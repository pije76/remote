from django.db import models
from django.db.models.signals import post_save
from django.contrib.auth.models import User

from profiles.models import Profile, Skill

# Create your models here.
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
	skill = models.ForeignKey(Skill, null=False, blank=False, on_delete=models.CASCADE)
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
