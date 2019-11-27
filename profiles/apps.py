from django.apps import AppConfig
from django.urls import reverse_lazy as _


class Userprofiles2Config(AppConfig):
    name = 'profiles'
    verbose_name = _(u'profiles')

    def ready(self):
        from profiles import signals
