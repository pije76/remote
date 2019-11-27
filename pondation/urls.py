from django.urls import include, path

from . import views

#app_name = 'pondation'
from .views import index

urlpatterns = [
	path('', views.index, name='index'),
    path('cara-kerja/', views.cara_kerja, name='cara_kerja'),

    path('avatar/', include('avatar.urls')),
	path('accounts/', include('allauth.urls')),
    path('accounts/profile/', include('profiles.urls')),
	path('search/', include('haystack.urls')),
#	path('ratings/', include('star_ratings.urls', namespace='ratings')),

	path('cari-proyek/', include('project.urls')),
	path('cari-client/', include('client.urls')),
	path('cari-freelancer/', include('freelancer.urls')),
#	path('cari-agency/', include('agency.urls')),

]
