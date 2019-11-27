"""remote URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
	https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
	1. Add an import:  from my_app import views
	2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
	1. Add an import:  from other_app.views import Home
	2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
	1. Import the include() function: from django.urls import include, path
	2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import include, path
from django.conf import settings
from django.conf.urls.static import static

#from pondation import views
#from project import views
#from client import views
#from agency import views
#from freelancer import views
#from profiles import views

from pondation.views import index

urlpatterns = [
#    path('jet/', include('jet.urls', 'jet')),
#    path('jet/dashboard/', include('jet.dashboard.urls', 'jet-dashboard')),
	path('admin/', admin.site.urls),
#	path('', include('pondation.urls')),
	path('', index, name='index'),
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

urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

if settings.DEBUG:
    import debug_toolbar
    urlpatterns = [
        path('__debug__/', include(debug_toolbar.urls)),
    ] + urlpatterns
