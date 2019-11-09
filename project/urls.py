from django.urls import path

from . import views

app_name = 'project'

urlpatterns = [
	path('', views.project_category, name='project-category'),
]
