from django.urls import path, re_path

from . import views

import tagulous.views

urlpatterns = [
	path('', views.freelancerlist, name='freelancerlist'),
#	re_path(r'^api/skill/$',tagulous.views.autocomplete,{'tag_model': models.Skill},name='skill_autocomplete',),
]
