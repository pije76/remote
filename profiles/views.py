from django.shortcuts import render
from django.urls import reverse_lazy
from django.http import HttpResponseRedirect
from django.views.generic.edit import UpdateView
from django.views.generic import TemplateView
from django.contrib.auth.mixins import LoginRequiredMixin

from .models import Profile
from .forms import IdentiteForm

# Create your views here.
class ProfileHomeView(LoginRequiredMixin, TemplateView):
	template_name = 'profiles/profile.html'
	user_check_failure_path = reverse_lazy("account_signup")

	def check_user(self, user):
		if user.is_active:
			return True
		return False

	def get_context_data(self, **kwargs):
		context = super(ProfileHomeView, self).get_context_data(**kwargs)
		profile = Profile.objects.get_or_create(user=self.request.user)[0]
		context['profile'] = profile
		return context


class ProfileIdentite(LoginRequiredMixin, UpdateView):
	template_name = "profiles/identity_form.html"
	form_class = IdentiteForm
	user_check_failure_path = reverse_lazy("account_signup")
	success_url = reverse_lazy("profile-home")

	def get_queryset(self):
		queryset = Profile.objects.filter(user=self.request.user)
		return queryset

	def form_valid(self, form, **kwargs):
		super(ProfileIdentite, self).form_valid(form)
		profile = form.save(commit=False)
		user = self.request.user
		user.first_name = form.cleaned_data['first_name']
		user.last_name = form.cleaned_data['last_name']
		user.save()
		profile.membertype = form.cleaned_data['membertype']
		profile.phone = form.cleaned_data['phone']
		profile.personal_info_is_completed = True
		profile.completion_level = profile.get_completion_level()
		profile.save()
		return HttpResponseRedirect(self.get_success_url())