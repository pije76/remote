from django.shortcuts import render
from django import forms
from django.db import connection, transaction
from django.contrib.auth.decorators import login_required

from .models import FreelancerProfile

# Create your views here.
def freelancerprofile(request):
	freelancerprofiles = FreelancerProfile.objects.all()
	context = {
		'freelancerprofiles': freelancerprofiles,
	}
	return render(request, 'index.html', context)

@login_required
def freelancerlist(request):
	freelancerlists = FreelancerProfile.objects.all()
	context = {
		'freelancerlists': freelancerlists,
	}
	return render(request, 'index.html', context)

class ProfileForm(forms.ModelForm):
	class Meta:
		model = FreelancerProfile
		exclude = ['creation_date', 'slug']

@login_required
def edit(request, profile_id = None):
	profile = None
	if profile_id is not None:
		profile = get_object_or_404(FreelancerProfile, pk=profile_id)

	if request.method == 'POST':
		form = ProfileForm(request.POST, instance=profile)
		if form.is_valid():
			newprofile = form.save(commit=False)
			newprofile.user = request.user
			newprofile.save()
			return HttpResponseRedirect(newprofile.get_absolute_url())
	else:
		form = ProfileForm(instance=profile)
	return render_to_response('profile/profile_edit.html', {'form':form, 'profile':profile,}, context_instance=RequestContext(request))

connection._rollback()

def details(request, slug):
	profile = get_object_or_404(Profile, slug=slug)
	return render_to_response('profile/profile_detail.html', {'profile':profile,}, context_instance=RequestContext(request))

@login_required
def delete(request, profile_id):
	profile = FreelancerProfile.objects.get(pk=profile_id)
	profile.delete()
	return HttpResponseRedirect('/get-profile/')

def tags(request):
		return render_to_response('tag/tag_archive.html', {}, context_instance=RequestContext(request))

def with_tag(request, tag, object_id=None, page=1):
	query_tag = Tag.objects.get(name=tag)
	entries = TaggedItem.objects.get_by_model(models.FreelancerProfile, query_tag)

	return render_to_response('tag/tag_list.html', {"tag":tag, "entries":entries}, context_instance=RequestContext(request))
