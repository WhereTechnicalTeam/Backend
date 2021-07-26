from __future__ import unicode_literals
from django.http import HttpResponseRedirect, HttpResponse
from django.shortcuts import get_object_or_404, render, redirect
import datetime
from django.views import generic
from django.contrib.auth.models import User 
from django.contrib.auth.forms import AuthenticationForm, UserCreationForm
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
from django.urls import reverse
from apis.models import *
from datatable.views import ServerSideDatatableView
from django.contrib import messages
from django.urls import reverse


def index(request):

	return render(request, 'feltp/public_index.html')


def alumni(request):

	return render(request, 'feltp/alumni.html')


def about(request):

	return render(request, 'feltp/about.html')


def news(request):

	return render(request, 'feltp/public_news.html')


def login(request):

	return render(request, 'feltp/login.html')


def admin_dashboard(request):
	

	return render(request, 'feltp/admin_index.html')


def admin_alumni(request):
	obj = UserProfile.objects.all()
	# print(obj.first())

	return render(request, 'feltp/admin_alumni.html', {'obj':obj})


def admin_create_event(request):
	# user = request.user.id

	if request.method == 'POST':
		title = request.POST.get('title')
		schedule = request.POST.get('schedule')
		description = request.POST.get('description')
		image = request.FILES.get('picture')
		# if title != '' and content != '':
		a = Event.objects.create(title=title, schedule=schedule, description=description, picture=image)
		messages.success(request, 'done')
		return HttpResponseRedirect("/feltp/admincreateevent")

	return render(request, 'feltp/admin_create_event.html')


def admin_create_gallery(request):
	if request.method == 'POST':
		title = request.POST.get('title')
		image = request.FILES.get('picture')
		a = Gallery.objects.create(title=title, picture=image)
		messages.success(request, 'done')
		return HttpResponseRedirect("/feltp/admincreategallery")

	return render(request, 'feltp/admin_create_gallery.html')


def admin_create_news(request):

	user = request.user.id

	if request.method == 'POST':
		title = request.POST.get('title')
		content = request.POST.get('content')
		image = request.FILES.get('picture1')
		# if title != '' and content != '':
		a = New.objects.create(title=title, content=content, picture1=image, user_id=user)
		messages.success(request, 'done')
		return HttpResponseRedirect("/feltp/admincreatenews")

	return render(request, 'feltp/admin_create_news.html')



#    lists
def admin_eventlist(request):
	obj = Event.objects.all()

	return render(request, 'feltp/admin_event_list.html', {'obj':obj})


def admin_gallerylist(request):
	obj = Gallery.objects.all()

	return render(request, 'feltp/admin_gallery_list.html', {'obj':obj})


def admin_newslist(request):
	obj = New.objects.all()

	return render(request, 'feltp/admin_news.html', {'obj':obj})



def admin_mapview(request):

	return render(request, 'feltp/admin_map.html')



#      edits
def admin_edit_news(request, obj_id):
	edit = get_object_or_404(New, obj_id)

	user = request.user.id

	if request.method == 'POST':
		title = request.POST.get('title')
		content = request.POST.get('content')
		image = request.FILES.get('picture1')
		# if title != '' and content != '':
		a = New.objects.filter(id=obj_id).update(title=title, content=content, picture1=image, user_id=user)
		messages.success(request, 'done')
		return HttpResponseRedirect("/feltp/admincreatenews")

	return render(request, 'feltp/admin_view_news.html', {'edit':edit})


def admin_edit_event(request, obj_id):
	edit = get_object_or_404(Event, obj_id)

	if request.method == 'POST':
		title = request.POST.get('title')
		schedule = request.POST.get('schedule')
		description = request.POST.get('description')
		image = request.FILES.get('picture')
		# if title != '' and content != '':
		a = Event.objects.filter(id=obj_id).update(title=title, schedule=schedule, description=description, picture=image)
		messages.success(request, 'done')
		return HttpResponseRedirect("/feltp/admincreateevent")

	return render(request, 'feltp/admin_view_event.html', {'edit':edit})


def admin_edit_gallery(request, obj_id):
	edit = get_object_or_404(Gallery, obj_id)

	if request.method == 'POST':
		title = request.POST.get('title')
		image = request.FILES.get('picture')
		a = Gallery.objects.filter(id=obj_id).update(title=title, picture=image)
		messages.success(request, 'done')
		return HttpResponseRedirect("/feltp/admincreategallery")

	return render(request, 'feltp/admin_view_gallery.html', {'edit':edit})



#     detail
def admin_eventdetail(request):
	obj = get_object_or_404(Event, obj_id)

	return render(request, 'feltp/eventsdetail.html', {'obj':obj})


def admin_gallerydetail(request):
	obj = get_object_or_404(Gallery, obj_id)

	return render(request, 'feltp/gallerydetail.html', {'obj':obj})


def admin_newsdetail(request):
	obj = get_object_or_404(New, obj_id)

	return render(request, 'feltp/newsdetail.html', {'obj':obj})



# ##################   Event delete view   ##########################################
def eventdelete(request, obj_id):
 	sb_delete = Event.objects.get(id=obj_id)
 	sb_delete.delete()
 	return HttpResponse('Deleted')



# ##################   Gallery delete view   ##########################################
def gallerydelete(request, obj_id):
 	sb_delete = Gallery.objects.get(id=obj_id)
 	sb_delete.delete()
 	return HttpResponse('Deleted')



# ##################   News delete view   ##########################################
def newsdelete(request, obj_id):
 	sb_delete = New.objects.get(id=obj_id)
 	sb_delete.delete()
 	return HttpResponse('Deleted')





class aluminiListView(ServerSideDatatableView):

	queryset = UserProfile.objects.all()
	columns = [
		'id', 
		'title',
		'surname',
		'firstname',
		'sex',
		'date_of_birth',
		'phone1', 
		'phone2',
		'is_trained_frontline',
		'cohort_number_frontline',
		'yr_completed_frontline',
		'institution_enrolled_at_frontline',
		'job_title_at_enroll_frontline', 
		'is_trained_intermediate',
		'cohort_number_intermediate',
		'yr_completed_intermediate',
		'institution_enrolled_at_intermediate',
		'job_title_at_enroll_intermediate',
		'is_trained_advanced',
		'cohort_number_advanced', 
		'yr_completed_advanced',
		'institution_enrolled_at_advanced',
		'job_title_at_enroll_advanced',
		'status',
		]