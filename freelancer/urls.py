from django.urls import path

from . import views

app_name = 'freelancer'

urlpatterns = [
	path('', views.freelancerlist, name='freelancerlist'),
]
