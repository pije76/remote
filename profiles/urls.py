from django.urls import include, path

from . import views
from .views import ProfileHomeView, ProfileIdentite

urlpatterns = [
    path('', ProfileHomeView.as_view(), name='profile-home'),
    path('^identity/(?P<pk>[0-9]+)/$', ProfileIdentite.as_view(), name='profile-identity-form'),
]
