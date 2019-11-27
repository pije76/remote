from django.db import models
from django.utils.text import slugify
from django.contrib.auth.models import AbstractUser

from fontawesome_5.fields import IconField

# Create your models here.
#class Profile(AbstractUser):
#	pass
#	is_freelancer = models.BooleanField('freelancer status', default=False)
#	is_company = models.BooleanField('company status', default=False)
#	first_name = models.CharField("First Name", max_length=80)
#	last_name = models.CharField("Last Name", max_length=80)
#	email = models.EmailField("Email", max_length=254)
#	country = CountryField(blank=False)
#	title = models.CharField("Title", max_length=80)
#	rate = models.CharField("Hourly Rate", max_length=80)
	#skill = TagField("Skill", blank=False, help_text='comma separated')
#	education = models.CharField("Education", max_length=80)
#	employment = models.CharField("Employment History", max_length=80)
#	portfolio = models.CharField("Portfolio", max_length=80)
#	certificate = models.CharField("Certifications", max_length=80)

#	def __str__(self):
#		return str(self.user)

#	class Meta:
#		verbose_name = 'Profile'

#def create_user_profile(sender, instance, created, **kwargs):
#	if created:
#		Profile.objects.create(user=instance)

#post_save.connect(create_user_profile, sender=User)


class Menu(models.Model):
    name = models.CharField("Menu Name", max_length=100)
    slug = models.SlugField(default='',editable=False, max_length=100)
    icon = IconField()

    class Meta:
        verbose_name = "Menu Name"
        verbose_name_plural = "Menu Names"

    def __str__(self):
        return str(self.name)