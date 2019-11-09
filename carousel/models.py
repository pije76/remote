# -*- coding: utf-8 -*-

import random
import glob
import os
import shutil
from datetime import datetime

from django.db import models
from django.contrib.auth.models import User
from django.conf import settings

from easy_thumbnails.fields import ThumbnailerImageField
from adminsortable.models import SortableMixin
from adminsortable.fields import SortableForeignKey

from pondation.models import Profile
from pondation.storage import OverwriteStorage

carousel_choices = (
    ('principal', u'Principal (1280px x 377px)'),
)


class CarouselActivatedManager(models.Manager):

    def get_queryset(self):
        return super().get_queryset().filter(
            published=True).order_by('-updated_at')

class Carousel(models.Model):
    name = models.CharField(u'Title', max_length=50, blank=True, null=True)
    carouseltype = models.CharField(u'Carousel', max_length=50, choices=carousel_choices)
    owner = models.ForeignKey(Profile, verbose_name=u"Owner", on_delete=models.CASCADE)
    image = models.ImageField('Image', max_length=None, blank=True, null=True, storage=OverwriteStorage(), upload_to='static/img', default='')
    description = models.CharField(u'Description', max_length=100, blank=True, null=True)
    link = models.CharField(u'Link', max_length=100, blank=True, null=True)
    image_order = models.PositiveIntegerField(default=0, editable=False, db_index=True)
    published = models.BooleanField(u'Publish', default=True)
    updated_at = models.DateTimeField(auto_now=True)
    carousel_order = models.PositiveIntegerField(default=0, editable=False, db_index=True)

    def __str__(self):
        return u'%s' % self.name

    class Meta:
        verbose_name = u"carousel"
        ordering = ['carousel_order']

    u''' Managers '''
    objects = models.Manager()
    activated = CarouselActivatedManager()

    def images_set(self):
        image = self.image_set.order_by('image_order')
        return image
