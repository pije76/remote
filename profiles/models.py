from django.db import models
from django.contrib.auth.models import AbstractUser, User
from django.utils.translation import ugettext_lazy as _

from localflavor.id_.id_choices import PROVINCE_CHOICES

# Create your models here.
class Profile(models.Model):
	MEMBERTYPE_CHOICES = (
		('freelancer', 'Freelancer'),
		('client', 'Client'),
#		('agency', 'Agency'),
	)

	user = models.OneToOneField(User, null=True, related_name="profile", verbose_name=_('User'), on_delete=models.CASCADE)
	membertype = models.CharField('Tipe Keanggotaan', max_length=30, choices=MEMBERTYPE_CHOICES, unique=True, blank=False)
	first_name = models.CharField("Nama Depan", max_length=128)
	last_name = models.CharField("Nama Belakang", max_length=128)
	email = models.EmailField("Email", max_length=128)
	phone = models.PositiveIntegerField(null=True, blank=True, verbose_name=_('Phone'))
	address = models.CharField("Alamat", max_length=254, blank=True, null=True)
	city = models.CharField("Kota", max_length=64)
	state = models.CharField("Provinsi", max_length=64, choices=PROVINCE_CHOICES)
	avatar = models.ImageField(upload_to='profiles/avatars', blank=True, verbose_name=_('Avatar'))
	completion_level = models.PositiveSmallIntegerField(default=0, verbose_name=_('Profile completion percentage'))
	email_is_verified = models.BooleanField(default=False, verbose_name=_('Email is verified'))
	personal_info_is_completed = models.BooleanField(default=False, verbose_name=_('Personal info completed'))

#	country = CountryField(blank=False)
#	title = models.CharField("Title", max_length=80)
#	rate = models.CharField("Hourly Rate", max_length=80)
	#skill = TagField("Skill", blank=False, help_text='comma separated')
#	education = models.CharField("Education", max_length=80)
#	employment = models.CharField("Employment History", max_length=80)
#	portfolio = models.CharField("Portfolio", max_length=80)
#	certificate = models.CharField("Certifications", max_length=80)

	class Meta:
		verbose_name = _('User profile')
		verbose_name_plural = _('User profiles')

	def __str__(self):
#		return str(self.user)
		return "User profile: %s" % self.user.username

	def get_completion_level(self):
		completion_level = 0
		if self.email_is_verified:
			completion_level += 50
		if self.personal_info_is_completed:
			completion_level += 50
		return completion_level

	def update_completion_level(self):
		self.completion_level = self.get_completion_level()
		self.save()


#def create_user_profile(sender, instance, created, **kwargs):
#	if created:
#		Profile.objects.create(user=instance)

#post_save.connect(create_user_profile, sender=User)
