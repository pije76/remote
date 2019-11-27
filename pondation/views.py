from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from django import forms
from django.db import connection, transaction

# Create your views here.
def index(request):
	context = {}
	return render(request, 'index.html', context)

def cara_kerja(request):
	context = {
	}
	return render(request, 'index.html', context)
