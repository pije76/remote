from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from django import forms
from django.db import connection, transaction

from .models import Profile
from tagging.models import Tag, TaggedItem

# Create your views here.
def index(request):
	context = {}
	return render(request, 'index.html', context)

def howitwork(request):
	howitworks = Profile.objects.all()
	context = {
		'howitworks': howitworks,
	}
	return render(request, 'index.html', context)

def profile(request):
	profilelists = Profile.objects.all()
	context = {
		'profilelists': profilelists,
	}
	return render(request, 'index.html', context)
