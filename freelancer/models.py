from django.db import models
from django.db.models.signals import post_save
from django.contrib.auth.models import User

import tagulous.models

from profiles.models import Profile

# Create your models here.
class Skill(tagulous.models.TagTreeModel):
	class TagMeta:
		initial = [
			'Python/Django',
			'Python/Flask',
			'JavaScript/JQuery',
			'JavaScript/Angular.js',
			'Linux/nginx',
			'Linux/uwsgi',
		]
		space_delimiter = False
#		autocomplete_view = 'skill_autocomplete'

	class Meta:
		verbose_name_plural = 'Skills'

#	def __str__(self):
#		return self.title

#	def set_tags(self, tags):
#		Skill.objects.update_tags(self, title)

#	def get_tags(self):
#		return Skill.objects.get_for_object(self)

class FreelancerProfile(models.Model):
	MEMBERSHIP_CHOICES = (
		('free', 'Free'),
		('basic', 'Basic'),
		('premium', 'Premium'),
	)

	PAYMENT_CHOICES = (
		('direct', 'Direct Transfer'),
		('creditcard', 'Credit Card'),
		('paypal', 'Paypal'),
	)

	username = models.OneToOneField(Profile, related_name='freelancer', on_delete=models.CASCADE, primary_key=True)
	membership = models.CharField("Tipe Keanggotaan", max_length=80, choices=MEMBERSHIP_CHOICES, null=False)
	payment = models.CharField("Metode Pembayaran", max_length=80, choices=PAYMENT_CHOICES, null=False)
	balance= models.DecimalField(max_digits=10, decimal_places=2)
	point = models.CharField("Point", max_length=80, null=False)
	rate = models.CharField("Hourly Rate", max_length=80, null=False)
	category = models.ForeignKey('project.Category', null=False, blank=False, on_delete=models.CASCADE)
#	skill = models.ForeignKey(Skill, null=False, blank=False, on_delete=models.CASCADE)
	skill = tagulous.models.TagField(Skill, help_text="This field does not split on spaces",)
	employment = models.CharField("Employment History", max_length=80, blank=True)
	portfolio = models.CharField("Portfolio", max_length=80, blank=True)
	certificate = models.CharField("Certifications", max_length=80, blank=True)

	def __str__(self):
		return str(self.user)

	class Meta:
		verbose_name = 'Profile'

#	def create_user_profile(sender, instance, created, **kwargs):
#		if created:
#			FreelancerProfile.objects.create(user=instance)

#	post_save.connect(create_user_profile, sender=User)
