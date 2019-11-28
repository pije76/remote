from django.contrib.auth.decorators import login_required
from django.db.models import Count, Min, Sum, Avg
from django.http import HttpResponse
from django.shortcuts import render_to_response, get_object_or_404, render
from django.template.context import RequestContext
from django.views.generic import ListView
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage


import json

from .models import Project, Category
from .decorators import confirm_required

#from mptt.templatetags.mptt_tags import cache_tree_children
#from haystack.query import SearchQuerySet
from haystack.views import SearchView
#from meta.views import Meta


# Create your views here.
def index(request):
#    meta = Meta(
#        title=project.title,
#        description=project.description,
#        keywords=project.keywords.split(','),
#    )
	return render_to_response('index.html', locals(), context_instance=RequestContext(request))

from django.views.generic import ListView

from pure_pagination.mixins import PaginationMixin


class CategoryView(PaginationMixin, ListView):
	model = Category
	paginate_by = 20

	def get_context_data(self, **kwargs):
		context = super().get_context_data(**kwargs)
		context['now'] = datetime.datetime.now()
		context['products'] = ProductNode.objects.all()
		context['category_list'] = Category.objects.all()
		return context
		
class CategoryView(ListView):
	model = Category
	template_name = 'project/project_category.html'

	def get_context_data(self, *, object_list=None, **kwargs):
		"""Get the context for this view."""
		queryset = object_list if object_list is not None else self.object_list
		page_size = self.get_paginate_by(queryset)
		context_object_name = self.get_context_object_name(queryset)
		if page_size:
			paginator, page, queryset, is_paginated = self.paginate_queryset(queryset, page_size)
			context = {
				'paginator': paginator,
				'page_obj': page,
				'is_paginated': is_paginated,
				'object_list': queryset
			}
		else:
			context = {
				'paginator': None,
				'page_obj': None,
				'is_paginated': False,
				'object_list': queryset
			}
		if context_object_name is not None:
			context[context_object_name] = queryset
		context.update(kwargs)
		context['nodes'] = context.get('object_list')
		return super().get_context_data(**context)

def project_category(request):
	#qs = qs.filter(level__lt=2)
	#root_nodes = cache_tree_children(qs)
	#root_nodes.sort(key=lambda node: len(node.get_children()), reverse=True)

	#parentcategory = Category.objects.all()

	#qc = Category.objects.filter(title=title)
	#category = qc.get()
	#if category:
	#    qsc = category.get_children()
	#    sub_categories = qsc.get()

	#node = Category.objects.all()
	#node = Category.objects.get(parent=None)
	#parentcategory = Category.objects.add_related_count(Category.tree.root_nodes(), Project, 'category', 'cat_count', cumulative=True)
	#parentcategory = Category.tree.all()
	#parentcategory = Category.tree.add_related_count(node.get_children(), Project, 'category', 'cat_count')
#	parentcategory = Category.objects.filter(level__lte=0)
#	parentcategory = Category.objects.filter(level__lte=1)
	parentcategory = Category.objects.add_related_count(Category.objects.all(), Project, 'category', 'cat_count', cumulative=True)
#	parentcategory = Category.objects.add_related_count(Category.objects.filter(level__lte=0), Project, 'category', 'cat_count', cumulative=True)
	parentcategories = Category.objects.all()
#	children = parentcategories.get_children()
#	if children:
#		last_child = list(children)[1]
#	subcategory = Category.objects.node.get_descendants().filter(level__lte=node.level + 2)
#	subcategories = Category.objects.all()
#	subcategory = subcategories.get_descendants().filter(level__lte=subcategories.level + 2)
	#parentcategory = Category.objects.add_related_count(node.get_children(), Project, 'category', 'cat_count')
	#parentcategory = Category.objects.all()
	#parentcategory = Category.objects.filter(parent__isnull=True)
	#parentcategory = Category.objects.all().annotate(count=Count('title'))
	#parentcategory = Project.objects.values('category').annotate(count=Count('category'))
	#parentcategory = Category.objects.all().annotate(count=Count('title')).filter(parent__isnull=False)
	#parentcategory = Category.tree.all()
	#parentcategory = Category.tree.root_nodes()
	#parentcategory = Category.objects.add_related_count(Category.tree.root_nodes(), Project, 'category', 'cat_count', cumulative=True)
	#node = Category.objects.get(title='Web Development')
	#parentcategory = Category.objects.add_related_count(node.get_children(), Project, 'category', 'cat_count')
	#parentcategory = Category.objects.add_related_count(node.get_children(), Project, 'category', 'cat_count', True)
	context = {
		'parentcategory': parentcategory,
#		'subcategory': subcategory,
	}
#	return render_to_response('project/project_category.html', {'parentcategory': parentcategory}, RequestContext(request))
	return render(request, 'project/project_category.html', context)

def project_list(request, slug):
	category = get_object_or_404(Category, slug=slug)  # Given a category slug, display all items in a category.
	parentcategory = Category.objects.add_related_count(Category.objects.filter(level__lte=0), Project, 'category', 'cat_count', cumulative=True)
	#category = Category.objects.filter(parent__isnull=True)
	projects = Project.objects.filter(category=category).order_by('-create_date')
#	projects = Project.objects.all()
	page = request.GET.get('page', 1)
	paginator = Paginator(projects, 2)  # 2 posts in each page
	#projects = Category.objects.all()
	#projects = Category.tree.all()
	#projects = Category.tree.root_nodes()
#	return render_to_response("project/project_list.html", {'projects': projects}, context_instance=RequestContext(request))
	try:
		projectlist = paginator.page(page)
	except PageNotAnInteger:
		projectlist = paginator.page(1)
	except EmptyPage:
		projectlist = paginator.page(paginator.num_pages)

	context = {
		'category': category,
		'parentcategory': parentcategory,
		'projectlist': projectlist,
	}

	return render(request, "project/project_list.html", context)



def project_detail(request, slug, pk, category, format="html"):
	category = Category.objects.filter(slug=category)
	projectdetail = Project.objects.filter(slug=slug, pk=pk)
	context = {
		'category': category,
		'projectdetail': projectdetail,
		'format': format,
	}
#    return object_list(request, queryset=Category.objects.all(), paginate_by=20, template_name='project/project_list.html', extra_context={'category': category})
#	return render_to_response('project/project_detail.html', {'projectdetail': projectdetail},  context_instance=RequestContext(request))
#    return object_list(request, queryset=Category.objects.all(), paginate_by=20, template_name='project/project_list.html', extra_context={'category': category})
	return render(request, 'project/project_detail.html', context)


#class ProjectForm(forms.ModelForm):
#    class Meta:
#        model = Project
#        exclude = ['create_date', 'slug']

@login_required
def add(request):
	form = ProjectForm(request.POST or None)
	if request.method == 'POST':
		if form.is_valid():
			addproject = form.save(commit=False)
			addproject.user = request.user
			addproject.save()
		return HttpResponseRedirect(addproject.get_absolute_url())
	return render_to_response('project/project_add.html', {'form': form}, context_instance=RequestContext(request))


@login_required
def edit(request, project_id):
	project = get_object_or_404(Project, pk=project_id)
	form = ProjectForm(request.POST or None, instance=project)
	if form.is_valid():
		editproject = form.save(commit=False)
		editproject.user = request.user
		editproject.save()
		return HttpResponseRedirect(editproject.get_absolute_url())
	return render_to_response('project/project_edit.html', {'project': project, 'form': form}, context_instance=RequestContext(request))


@login_required
def delete_confirm(request, project_id):
	project = Project.objects.get(pk=project_id)
	return RequestContext(request, {'project': project})


@confirm_required('project/confirm_delete.html', delete_confirm)
def delete(request, project_id):
	delete = Project.objects.get(pk=project_id)
	delete.delete()
	return HttpResponseRedirect('/myproject/')


#def project_search(request):
#    results = SearchQuerySet().autocomplete(request.GET.get('q', ''))  # Django-Haystack 1.x with Ajax Autocomplete
#    results = SearchQuerySet().auto_query(request.GET.get('q', ''))  # Django-Haystack 2.x with Ajax Autocomplete
#    return HttpResponse(json.dumps(results[:5]), content_type='application/json')

#def search(req):
#    return SearchView(template='search/search.html')(req)
