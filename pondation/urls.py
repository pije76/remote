from django.urls import include, path

from . import views

app_name = 'pondation'

urlpatterns = [
	path('', views.index, name='index'),
	path('how-it-works/', views.howitwork, name='howitwork'),
#	path('accounts/', include('allauth.urls')),
]
