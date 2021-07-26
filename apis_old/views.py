from django.shortcuts import render

# Create your views here.
from .models import *
from django.contrib.auth.models import User


def dood():
	for i in range(1, 141):
		a = User.objects.get(id=i)
		d = 1+i
		aa = User.objects.get(id=d)
		b = a.email
		bb = aa.email
		if "@" in b:
			c = b.split('@')[0]
			cc = bb.split('@')[0]
			if c == cc:
				aa.delete()
			a.username = c
			a.save()

	return 'done'