from django.urls import include, path

from . import views
from .views import ProfileHomeView, ProfileIdentite

urlpatterns = [
#	path('', views.profile, name='profile'),
    path('', ProfileHomeView.as_view(), name='profile-home'),
#	path('accounts/profile/', include('pondation.urls')),
    path('^identity/(?P<pk>[0-9]+)/$', ProfileIdentite.as_view(), name='profile-identity-form'),
]
