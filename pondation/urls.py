from django.urls import include, path

from . import views

app_name = 'pondation'

urlpatterns = [
	path('', views.index, name='index'),
#	path('', index, name='index'),
	path('how-it-works/', views.howitwork, name='howitwork'),
    path('avatar/', include('avatar.urls')),
	path('accounts/', include('allauth.urls')),
    path('accounts/profile/', include('profiles.urls')),
    path('cara-kerja/', include('pondation.urls')),
	path('cari-proyek/', include('project.urls')),
	path('cari-client/', include('client.urls')),
	path('cari-freelancer/', include('freelancer.urls')),
#	path('cari-agency/', include('agency.urls')),
	path('search/', include('haystack.urls')),
#	path('ratings/', include('star_ratings.urls', namespace='ratings')),

]
