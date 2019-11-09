from django.shortcuts import render

from .models import Project, Category

# Create your views here.
def project_category(request):
#    parentcategory = Category.objects.add_related_count(Category.objects.all(), Project, 'category', 'cat_count', cumulative=True)
    parentcategory = Category.objects.add_related_count(Category.objects.root_nodes(), Project, 'category', 'cat_count', cumulative=True)
    context = {
    	'parentcategory': parentcategory,
    }
    return render(request, 'project/project_category.html', context)
