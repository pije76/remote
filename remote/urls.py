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

from pondation import views
from project import views
from client import views
from agency import views
from freelancer import views

urlpatterns = [
#    path(r'^jet/', include('jet.urls', 'jet')),
#    path(r'^jet/dashboard/', include('jet.dashboard.urls', 'jet-dashboard')),
	path('admin/', admin.site.urls),
	path('', include('pondation.urls')),
	path('accounts/', include('allauth.urls')),
	path('profile/', include('pondation.urls')),
	path('find-project/', include('project.urls')),
	path('find-client/', include('client.urls')),
#	path('find-agency/', include('agency.urls')),
	path('find-freelancer/', include('freelancer.urls')),
	path('accounts/profile/', include('pondation.urls')),
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
