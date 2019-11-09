from django.db import models
from django.utils.translation import ugettext_lazy as _
from django.db.models.signals import post_save
from django.contrib.auth.models import User

from localflavor.id_.id_choices import PROVINCE_CHOICES

from pondation.models import Profile
from pondation.storage import OverwriteStorage

# Create your models here.
class ClientProfile(models.Model):
	user = models.OneToOneField(Profile, related_name='Client', on_delete=models.CASCADE, primary_key=True)
#    name = models.CharField("Client Name", max_length=80)
	address = models.CharField("Alamat", max_length=254, blank=True, null=True)
	logo = models.ImageField("Logo", max_length=None, blank=True, null=True, storage=OverwriteStorage(), upload_to='static/images', default='')
	website = models.URLField("Website", max_length=80, null=True, blank=True, help_text=_('"www.client.com"'))
	email = models.EmailField("Email", max_length=254)
	city = models.CharField("Kota", max_length=64)
	state = models.CharField("Provinsi", max_length=64, choices=PROVINCE_CHOICES)

	def __str__(self):
		return str(self.user)

	class Meta:
		verbose_name = 'Client'

def create_user_profile(sender, instance, created, **kwargs):
	if created:
		ClientProfile.objects.create(user=instance)

post_save.connect(create_user_profile, sender=User)
