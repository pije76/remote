from django.urls import path, include, re_path

import mptt_urls
from clean_urls.views import CleanURLHandler

from .models import Category, Project
from .views import CategoryView
from . import views

app_name = 'project'

urlpatterns = [
	path('', views.project_category, name='project_category'),
#	path('', CategoryView.as_view()),
	re_path(r'^(?P<slug>[-\w]+)/$', views.project_list, name='project_list'),
#    re_path(r"^(?P<slug>[-\w]+)/$", CategoryView.as_view(), name="project_list"),
    re_path(r'^(?P<category>[-\w]+)/(?P<slug>[-\w]+)/$', views.project_detail, name='project_detail'),
#	re_path(r'^category/(?P<hierarchy>.+)/$', views.show_category, name='show_category'),
#	re_path(r'^(?P<slug>([-\w]+/)+)$', CleanURLHandler((Category.objects.all(), CategoryView.as_view()),), name='project_detail'),
#	re_path(r'^(?P<slug>([-\w]+/)+)$', CleanURLHandler(Category.objects.all(), CategoryView.as_view()), Category.objects.all(), CategoryView.as_view(), name='project_detail'),
#	re_path(r'^(?P<slug>([-\w]+/)+)$', CleanURLHandler((Category.objects.all(), CategoryView.as_view()),(Category.objects.all(), CategoryView.as_view()),(Project.objects.all(), ProjectView.as_view()),), name='project_detail'),
#    path(r'^(?P<slug>[-\w]+)/$', views.project_list, name='project_list'),
#    re_path('^(?P<category>[-\w]+)/(?P<slug>[-\w]+)/$', views.project_detail, name="project_detail"),
#    re_path(r'^category/(?P<path>.*)', mptt_urls.view(model='project.models.Category', view='project.views.project_detail', slug_field='slug', trailing_slash=True), {'extra': 'You may also pass extra options as usual!'}, name='project_detail'),
#    path(r'^(?P<category>[\w\-]+)/(?P<slug>[\w\-]+)/$', 'project_detail'),
#    path(r'^(?P<category>[-w]+)/(?P<slug>[-w]+)/$', 'project_detail', name='project_detail'),
#    path(r'^(?P<category>[a-zA-Z0-9_.-]+)/(?P<slug>[a-zA-Z0-9_.-]+)/$', 'project_detail', name='project_detail'),

]
