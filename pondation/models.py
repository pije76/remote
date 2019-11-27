from django.db import models
from django.utils.text import slugify
from django.contrib.auth.models import AbstractUser

from fontawesome_5.fields import IconField

# Create your models here.
class Menu(models.Model):
    name = models.CharField("Menu Name", max_length=100)
    slug = models.SlugField(default='',editable=False, max_length=100)
    icon = IconField()

    class Meta:
        verbose_name = "Menu Name"
        verbose_name_plural = "Menu Names"

    def __str__(self):
        return str(self.name)

