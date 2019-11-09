from django.db import models
from django.db.models.signals import post_save
from django.contrib.auth.models import User

from localflavor.id_.id_choices import PROVINCE_CHOICES

from pondation.models import Profile

# Create your models here.
class FreelancerProfile(models.Model):
	user = models.OneToOneField(Profile, related_name='freelancer', on_delete=models.CASCADE, primary_key=True)
	title = models.CharField("Title", max_length=80)
	first_name = models.CharField("First Name", max_length=80)
	last_name = models.CharField("Last Name", max_length=80)
	email = models.EmailField("Email", max_length=254)
	city = models.CharField("Kota", max_length=64)
	state = models.CharField("Provinsi", max_length=64, choices=PROVINCE_CHOICES)
	rate = models.CharField("Hourly Rate", max_length=80)
	#skill = TagField("Skill", blank=False, help_text='comma separated')
	education = models.CharField("Education", max_length=80)
	employment = models.CharField("Employment History", max_length=80)
	portfolio = models.CharField("Portfolio", max_length=80)
	certificate = models.CharField("Certifications", max_length=80)

	def __str__(self):
		return str(self.user)

	class Meta:
		verbose_name = 'Freelancer'


def create_user_profile(sender, instance, created, **kwargs):
	if created:
		FreelancerProfile.objects.create(user=instance)

post_save.connect(create_user_profile, sender=User)
