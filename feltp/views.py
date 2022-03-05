from __future__ import unicode_literals
from django.http import HttpResponseRedirect, HttpResponse, JsonResponse
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
from django.contrib.auth.decorators import login_required
from django.contrib.auth.decorators import permission_required
from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin
import csv
from django.contrib.auth.decorators import permission_required
from django.core.exceptions import PermissionDenied
from django.core.mail import send_mail
from project.settings import EMAIL_HOST_USER
import re
from django.contrib.auth.decorators import login_required
from django.db.models import Q
from datetime import date, timedelta
from djgeojson.views import GeoJSONLayerView
from django.core.serializers import serialize
from apis.views import codes




def gold():
	alls = JobInfo.objects.all().values_list('id', flat=True)
	for aa in alls:
		a = JobInfo.objects.get(pk=aa).user_id
		print(a)
		if a != '' and a != None:
			b = UserProfile.objects.get(user_id=a).pk 
			print(b)
			# return (a,b)
			JobInfo.objects.filter(pk=aa).update(user_profile=b)







def index(request):
	d = date.today() - timedelta(days=14)

	jobs = JobInfo.objects.all().order_by('-created_at')[:4]
	events = Event.objects.all().order_by('-created_at')[:3]
	news = New.objects.all().order_by('-created_at')[:4]
	if New.objects.filter(created_at__gte=d).exists():
		news_old = New.objects.filter(created_at__gt=d).order_by('-created_at')[:5]

		return render(request, 'feltp/public_index.html', {'news':news, 'news_old':news_old, 'events':events, 'jobs':jobs})
	elif New.objects.all().order_by('-created_at')[20:24].exists():
		news_old = New.objects.all().order_by('-created_at')[20:24]
		return render(request, 'feltp/public_index.html', {'news':news, 'news_old':news_old, 'events':events, 'jobs':jobs})

	return render(request, 'feltp/public_index.html', {'news':news, 'events':events, 'jobs':jobs})



@login_required(login_url="/login")
def edit_user(request, obj_id):
	regions = Region.objects.all().order_by('region_name')
	user = get_object_or_404(User, pk=obj_id)
	prof = {}
	job = {}
	if UserProfile.objects.filter(user=user).exists():
		prof = UserProfile.objects.get(user=user)
		if JobInfo.objects.filter(user=user).exists():
			job = JobInfo.objects.filter(user=user)[0]

	if request.method == 'POST':
		user.email = request.POST.get('email')

		prof.surname = request.POST.get('surname')
		prof.firstname = request.POST.get('firstname')
		prof.date_of_birth = request.POST.get('date_of_birth')
		prof.phone1phone2 = request.POST.get('phone1phone2')
		prof.phone2 = request.POST.get('phone2')
		prof.is_trained_frontline = request.POST.get('is_trained_frontline')
		prof.cohort_number_frontline = request.POST.get('cohort_number_frontline')
		prof.yr_completed_frontline = request.POST.get('yr_completed_frontline')
		prof.institution_enrolled_at_frontline = request.POST.get('institution_enrolled_at_frontline')
		prof.job_title_at_enroll_frontline = request.POST.get('job_title_at_enroll_frontline')
		prof.is_trained_intermediate = request.POST.get('is_trained_intermediate')
		prof.cohort_number_intermediate = request.POST.get('cohort_number_intermediate')
		prof.yr_completed_intermediate = request.POST.get('yr_completed_intermediate')
		prof.institution_enrolled_at_intermediate = request.POST.get('institution_enrolled_at_intermediate')
		prof.job_title_at_enroll_intermediate = request.POST.get('job_title_at_enroll_intermediate')
		prof.is_trained_advanced = request.POST.get('is_trained_advanced')
		prof.cohort_number_advanced = request.POST.get('cohort_number_advanced')
		prof.yr_completed_advanced = request.POST.get('yr_completed_advanced')
		prof.institution_enrolled_at_advanced = request.POST.get('institution_enrolled_at_advanced')
		prof.job_title_at_enroll_advanced = request.POST.get('job_title_at_enroll_advanced')
		prof.image = request.FILES.get('image')

		job = JobInfo.objects.filter(user=user).update_or_create(
			current_institution=request.POST.get('current_institution'),
			job_title=request.POST.get('job_title'),
			region_id=request.POST.get('region'),
			district_id=request.POST.get('district'),
			is_current=request.POST.get('is_current'),
			user=user,
			level_of_health_system_id=request.POST.get('level_of_health_system')
			)

		job = JobInfo.objects.filter(is_current='Yes').order_by('-updated_at').first() or JobInfo.objects.all().order_by('-updated_at').first()

		prof.save()
		user.save()

		return render(request, 'feltp/public_view_profile.html', {'regions':regions, 'prof':prof, 'job':job})

	return render(request, 'feltp/public_view_profile.html', {'regions':regions, 'prof':prof, 'job':job})



# @login_required(login_url='/login')
def news(request):
	news = New.objects.all().order_by('-created_at')
	# if request.method == 'POST':

	return render(request, 'feltp/public_news.html', {'news':news})



def events(request):
	events = Event.objects.all().order_by('-created_at')
	# if request.method == 'POST':

	return render(request, 'feltp/public_events.html', {'events':events})



def event_detail(request, obj_id):
	obj = get_object_or_404(Event, pk=obj_id)
	return render(request, 'feltp/public_event_detail.html', {'obj':obj})



def news_detail(request, obj_id):
	obj = get_object_or_404(New, pk=obj_id)
	return render(request, 'feltp/public_news_detail.html', {'obj':obj})



def fetch_profile(request):
	proff = UserProfile.objects.all().order_by('-created_at')
	# if request.method == 'POST':
	return render(request, 'feltp/public_view_profile.html', {'proff':proff})


def profile_search_query(request):
	data = request.GET.get('data')
	data = re.sub("\W\d", '', data)

	profilesearch = JobInfo.objects.filter(Q(user_profile__surname__icontains=data) | Q(user_profile__firstname__icontains=data))
	# print(profilesearch)
	return render(request, 'feltp/profiledata.html', {'profilesearch':profilesearch[:8]})


@login_required(login_url='/login')
def admin_dashboard(request):
	if not request.user.has_perm('apis.view_project'):
		raise PermissionDenied()
	else:
		return render(request, 'feltp/admin_index.html')
	return render(request, 'feltp/serverError.html')


@login_required(login_url='/login')
def admin_alumni(request):
	if not request.user.has_perm('apis.view_project'):
		raise PermissionDenied()
	else:
		obj = UserProfile.objects.all()
		return render(request, 'feltp/admin_alumni.html', {'obj':obj})
	return render(request, 'feltp/serverError.html')


@login_required(login_url='/login')
def admin_create_event(request):
	if not request.user.has_perm('apis.add_project'):
		raise PermissionDenied()
	else:

		if request.method == 'POST' and request.is_ajax():
			title = request.POST.get('title')
			schedule = request.POST.get('schedule')
			description = request.POST.get('description')
			image = request.FILES.get('picture')
			a = Event.objects.create(title=title, schedule=schedule, description=description, picture=image)
			return HttpResponse('done')
		# messages.success(request, 'done')
		# return HttpResponseRedirect("/admincreateevent")

	return render(request, 'feltp/admin_create_event.html')


@login_required(login_url='/login')
def admin_create_gallery(request):
	if not request.user.has_perm('apis.add_project'):
		raise PermissionDenied()
	else:

		if request.method == 'POST' and request.is_ajax():
			title = request.POST.get('title')
			image = request.FILES.get('picture')
			# print(image)
			a = Gallery.objects.create(title=title, picture=image)
			return HttpResponse('done')
		# messages.success(request, 'done')
		# return HttpResponseRedirect("/admincreategallery")

	return render(request, 'feltp/admin_create_gallery.html')




@login_required(login_url='/login')
def admin_create_news(request):

	user = request.user.id
	if not request.user.has_perm('apis.add_project'):
		raise PermissionDenied()
	else:

		if request.method == 'POST' and request.is_ajax():
			title = request.POST.get('title')
			content = request.POST.get('content')
			image = request.FILES.get('picture1')
			# print(image)
			# if title != '' and content != '':
			a = New.objects.create(title=title, content=content, picture1=image, user_id=user)
			return HttpResponse('done')
		# messages.success(request, 'done')
		# return HttpResponseRedirect("/admincreatenews")

	return render(request, 'feltp/admin_create_news.html')



#    lists
@login_required(login_url='/login')
def admin_eventlist(request):
	if not request.user.has_perm('apis.view_project'):
		raise PermissionDenied()
	else:
		obj = Event.objects.all()
		return render(request, 'feltp/admin_event_list.html', {'obj':obj})

	return render(request, 'feltp/serverError.html')


@login_required(login_url="/login")
def admin_gallerylist(request):
	if not request.user.has_perm('apis.view_project'):
		raise PermissionDenied()
	else:
		obj = Gallery.objects.all()
		return render(request, 'feltp/admin_gallery_list.html', {'obj':obj})

	return render(request, 'feltp/serverError.html')

	

@login_required(login_url="/login")
def admin_newslist(request):
	if not request.user.has_perm('apis.view_project'):
		raise PermissionDenied()
	else:
		obj = New.objects.all()
		return render(request, 'feltp/admin_news.html', {'obj':obj})

	return render(request, 'feltp/serverError.html')


@login_required(login_url="/login")
def admin_mapview(request):

	return render(request, 'feltp/admin_map.html')



#      edits
@login_required(login_url="/login")
def admin_edit_news(request, obj_id):
	if not request.user.has_perm('apis.change_project'):
		raise PermissionDenied()
	else:
		edit = get_object_or_404(New, pk=obj_id)

		user = request.user.id

		if request.method == 'POST' and request.is_ajax():
			title = request.POST.get('title')
			content = request.POST.get('content')
			image = request.FILES.get('picture1')
			# if title != '' and content != '':
			a = New.objects.filter(id=obj_id).update(title=title, content=content, picture1=image, user_id=user)
			# messages.success(request, 'done')
			# return HttpResponseRedirect("/admincreatenews")
			return HttpResponse('done')

	return render(request, 'feltp/admin_view_news.html', {'edit':edit})



@login_required(login_url="/login")
def admin_edit_event(request, obj_id):
	if not request.user.has_perm('apis.change_project'):
		raise PermissionDenied()
	else:
		edit = get_object_or_404(Event, pk=obj_id)

		if request.method == 'POST' and request.is_ajax():
			title = request.POST.get('title')
			schedule = request.POST.get('schedule')
			description = request.POST.get('description')
			image = request.FILES.get('picture')
			# if title != '' and content != '':
			a = Event.objects.filter(id=obj_id).update(title=title, schedule=schedule, description=description, picture=image)
			# messages.success(request, 'done')
			# return HttpResponseRedirect("/admincreateevent")
			return HttpResponse('done')

	return render(request, 'feltp/admin_view_event.html', {'edit':edit})


@login_required(login_url="/login")
def admin_edit_gallery(request, obj_id):
	if not request.user.has_perm('apis.change_project'):
		raise PermissionDenied()
	else:
		edit = get_object_or_404(Gallery, pk=obj_id)

		if request.method == 'POST' and request.is_ajax():
			title = request.POST.get('title')
			image = request.FILES.get('picture')
			# print(image)
			a = Gallery.objects.filter(id=obj_id).update(title=title, picture=image)
			# messages.success(request, 'done')
			# return HttpResponseRedirect("/admincreategallery")
			return HttpResponse('done')

	return render(request, 'feltp/admin_view_gallery.html', {'edit':edit})



#     detail
@login_required(login_url="/login")
def admin_eventdetail(request, obj_id):
	if not request.user.has_perm('apis.view_project'):
		raise PermissionDenied()
	else:
		obj = get_object_or_404(Event, pk=obj_id)
		return render(request, 'feltp/eventsdetail.html', {'obj':obj})
	return render(request, 'feltp/serverError.html')


@login_required(login_url="/login")
def admin_gallerydetail(request, obj_id):
	if not request.user.has_perm('apis.view_project'):
		raise PermissionDenied()
	else:
		obj = get_object_or_404(Gallery, pk=obj_id)
		return render(request, 'feltp/gallerydetail.html', {'obj':obj})
	return render(request, 'feltp/serverError.html')


@login_required(login_url="/login")
def admin_newsdetail(request, obj_id):
	if not request.user.has_perm('apis.view_project'):
		raise PermissionDenied()
	else:	
		obj = get_object_or_404(New, pk=obj_id)
		return render(request, 'feltp/newsdetail.html', {'obj':obj})
	return render(request, 'feltp/serverError.html')



# ##################   Event delete view   ##########################################
def eventdelete(request, obj_id):
	if not request.user.has_perm('apis.delete_project'):
		raise PermissionDenied()
	else:
	 	sb_delete = Event.objects.get(id=obj_id)
	 	sb_delete.delete()
	 	return HttpResponse('Deleted')
	return render(request, 'feltp/serverError.html')



# ##################   Gallery delete view   ##########################################
def gallerydelete(request, obj_id):
	if not request.user.has_perm('apis.delete_project'):
		raise PermissionDenied()
	else:
	 	sb_delete = Gallery.objects.get(id=obj_id)
	 	sb_delete.delete()
	 	return HttpResponse('Deleted')
	return render(request, 'feltp/serverError.html')



# ##################   News delete view   ##########################################
def newsdelete(request, obj_id):
	if not request.user.has_perm('apis.delete_project'):
		raise PermissionDenied()
	else:
	 	sb_delete = New.objects.get(id=obj_id)
	 	sb_delete.delete()
	 	return HttpResponse('Deleted')
	return render(request, 'feltp/serverError.html')



def loginPage(request):
	return render(request, 'feltp/login.html')



# ##################   Login view   ##########################################
def login_view(request):
	if request.method == 'POST':
		email = request.POST.get('email')
		password =  request.POST.get('password')
		remember = request.POST.get('remember_me')

		# print(email)
		# print(password)

		if remember:
			request.session['username'] = username
			request.session['password'] = password
		else:
			''' <-- Here if the remember me is False, that is why expiry is set to 
			0 seconds. So it will automatically close the session after the browser is closed.'''
			request.session.set_expiry(0)

		user = authenticate(request, username=email, password=password)
		# print(user)
		if user is not None:
			if user.is_superuser:
				login(request, user)
				return HttpResponse('superuser')
			if UserProfile.objects.filter(user=user).exists():
				prof = UserProfile.objects.get(user=user)
				try:
					if prof.status == 'approved' and prof.email_status == 'verified':
						login(request, user)
						return HttpResponse('public')
						
					else:
						return HttpResponse('not_approved')
				except Exception as e:
					print(e)
					return HttpResponse('not_approved')
			else:
				return HttpResponse('no_profile')
		else:
			return HttpResponse('credential')
					
	return render(request, 'feltp/login.html')




# ##################   Logout view   ##########################################
def logout_view(request):
	logout(request)
	return HttpResponseRedirect('https://ghanafeltp.net/')


def forgot_password(request):
	data = request.GET.get('data')
	if data != '':
		# print(data)
		if User.objects.filter(email__iexact=data).exists():
			user = User.objects.get(email__iexact=data)
			# print(user)

			try:
				send_mail('Password Reset',
					"""To initiate the password reset process for your username: """+ user.username + """, click the link below: 
					http://127.0.0.1:8000/feltp/passwordreset?data="""+ user.username + """.""", 'wheregeospatialnoreply@gmail.com', [data],)
				return JsonResponse({"status":"Email sent"})
				
			except Exception as e:
				print(e)
				return Response("Could not send info to email, an error occured. Contact admin for verification.", status=status.HTTP_500_INTERNAL_SERVER_ERROR)

	return render(request, 'feltp/login.html')


def password_reset(request):
	data = request.GET.get('data')
	if request.method == 'POST':
		password = request.POST.get('password')
		con_password =  request.POST.get('confirm_password')

		if password == con_password:
			if User.objects.filter(username=data).exists():
				user = User.objects.get(username=data)
				# print(user)
				user.set_password(password)
				user.save()
				return HttpResponse("done")
			else:
				return HttpResponse('user')
		else:
			return HttpResponse('password')

	return render(request, 'feltp/passwordreset.html')


def stats(request):
	all_profile = UserProfile.objects.all()
	alumni = all_profile.count()
	news = New.objects.all().count()
	galery = Gallery.objects.all().count()
	events = Event.objects.all().count()
	frontline = all_profile.filter(is_trained_frontline='Yes').count()
	intermediate = all_profile.filter(is_trained_intermediate='Yes').count()
	advanced = all_profile.filter(is_trained_advanced='Yes').count()
	not_approved = all_profile.filter(status='pending approval').count()
	not_verified = all_profile.filter(status='not verified').count()

	context = {'alumni':alumni, 'news':news, 'galery':galery, 'events':events, 'frontline':frontline, 
	'intermediate':intermediate, 'advanced':advanced, 'not_approved':not_approved, 'not_verified':not_verified}

	# context = [alumni, news, galery, events, frontline, 
	# intermediate, advanced, not_approved, not_verified]

	return JsonResponse(context)
	# return render(request, 'feltp/stats.html', context)



#   gets all regions in the database
def region_coverage(request):
	regions = Region.objects.all().order_by('region_name')
	# print(regions)
	return render(request, 'feltp/regions.html', {'regions':regions})




##########   select district based on region filter  ######################
def districtSelectOption(request):
	data = request.GET.get('data')
	data = re.sub("\W\d", '', data) 

	if data != '' and data != '0' and data is not None:
		districts = District.objects.filter(region__id=data).order_by('district_name')
		context = {'districts':districts}
		# print(districts)

		return render(request, 'feltp/district.html', {'districts':districts})
	else:
		
		 return HttpResponse('None')



class jobsLayer(GeoJSONLayerView):
	# Options
	model = JobInfo
	precision = 3   
	simplify = 0.001
	properties = ('current_institution', 'region', 'district')



def queryjson(request):
	query = list(JobInfo.objects.exclude(longitude__isnull=True).exclude(latitude__isnull=True).values('current_institution', 'region__region_name',
	 'district__district_name', 'longitude', 'latitude', 'user_profile__is_trained_frontline', 'job_title',
	  'user_profile__is_trained_intermediate', 'user_profile__is_trained_advanced', 'user_profile__firstname', 'user_profile__surname'))
	# print(query)
	for a in range(1, len(query)):
		# print(a)
		# if a['user_profile__is_trained_advanced'] == 'Yes' and a['user_profile__is_trained_frontline'] == 'Yes' and a['user_profile__is_trained_intermediate'] == 'Yes':
		# 	del a['user_profile__is_trained_frontline']
		# 	del a['user_profile__is_trained_intermediate']
		# 	# print('ad')

		if set(('user_profile__is_trained_advanced', 'user_profile__is_trained_intermediate', 'user_profile__is_trained_frontline')).issubset(query[a]):
			if query[a]['user_profile__is_trained_frontline'] != 'Yes' and query[a]['user_profile__is_trained_intermediate'] != 'Yes' and query[a]['user_profile__is_trained_advanced'] != 'Yes':
				query[a]['level'] = None
				del query[a]['user_profile__is_trained_intermediate']
				del query[a]['user_profile__is_trained_advanced']
				del query[a]['user_profile__is_trained_frontline']


		if 'user_profile__is_trained_advanced' in query[a]:
			if query[a]['user_profile__is_trained_advanced'] == 'Yes':
				del query[a]['user_profile__is_trained_frontline']
				del query[a]['user_profile__is_trained_intermediate']

		if 'user_profile__is_trained_intermediate' in query[a]:
			if query[a]['user_profile__is_trained_intermediate'] == 'Yes':
				del query[a]['user_profile__is_trained_frontline']
				del query[a]['user_profile__is_trained_advanced']
		# 	# print('in')

		if 'user_profile__is_trained_frontline' in query[a]:
			if query[a]['user_profile__is_trained_frontline'] == 'Yes':
				del query[a]['user_profile__is_trained_intermediate']
				del query[a]['user_profile__is_trained_advanced']
		# 	# print('fr')

		# if query[a]['user_profile__is_trained_frontline'] != 'Yes' and a['user_profile__is_trained_intermediate'] != 'Yes' and a['user_profile__is_trained_advanced'] != 'Yes':
		# 	del query[a]['user_profile__is_trained_intermediate']
		# 	del query[a]['user_profile__is_trained_advanced']
		# 	del query[a]['user_profile__is_trained_frontline']
			# print('all')
		# print(a['user_profile__is_trained_frontline'])
	return JsonResponse(query, safe=False)
	# return render(request, 'public_index.html', {'query':query})




def cohorts(request):
	data = request.GET.get('data')
	data = re.sub("\W\d", '', data)
	context = {}

	all_profile = UserProfile.objects.all()
	if data == 'front':
		frontline = all_profile.filter(is_trained_frontline='Yes')
		return render(request, 'feltp/stats_list.html', {'frontline':frontline, 'title':'Trained at Frontline'})

	elif data == 'inter':
		intermediate = all_profile.filter(is_trained_intermediate='Yes')
		return render(request, 'feltp/stats_list.html', {'intermediate':intermediate, 'title':'Trained at Intermediate'})

	elif data == 'advance':
		advanced = all_profile.filter(is_trained_advanced='Yes')
		return render(request, 'feltp/stats_list.html', {'advanced':advanced, 'title':'Trained at Advanced'})

	elif data == 'pending':
		not_approved = all_profile.filter(status='pending approval')
		return render(request, 'feltp/stats_list.html', {'not_approved':not_approved, 'title':'Pending Users'})

	elif data == 'unverified':
		not_verified = all_profile.filter(status='not verified')
		return render(request, 'feltp/stats_list.html', {'not_verified':not_verified, 'title':'Unverified Users'})

	else:
		return render(request, 'feltp/stats_list.html')
	return render(request, 'feltp/stats_list.html')




# ///////////////////////////   approve or disapprove a user  /////////////////////////
def setstatus(request):
	idd = request.GET.get('data')
	vall = request.GET.get('val')
	# print(idd)
	# print(vall)

	conf = UserProfile.objects.filter(id=idd).update(status=vall)
	# conf.save()
	return HttpResponse('done')





# ///////////////////////////   delete a user  /////////////////////////
def deleteuser(request, obj_id):
	idd = request.GET.get('data')
	sb_delete = UserProfile.objects.get(id=obj_id)
	sb_delete.delete()
	return HttpResponse('done')




def contactus(request):
	if request.method == 'POST' and request.is_ajax():
		name = request.POST.get('name')
		email = request.POST.get('email')
		number = request.POST.get('number')
		messasge = request.POST.get('messasge')
		a = contactUs.objects.create(name=name, email=email, number=number, messasge=messasge)
		return HttpResponse('done')

	return render(request, 'feltp/public_index.html')














{
"email":"aabalekuusimon78@gmail.com",
"password":"add123456"
}



def newMap(request):
	return render(request, 'feltp/newMap.html')


# @login_required(login_url='/login')
def newsfeed(request):
	news = New.objects.all().order_by('-created_at')[:10]

	all_profile = UserProfile.objects.all()
	alumni = all_profile.count()
	frontline = all_profile.filter(is_trained_frontline='Yes').count()
	intermediate = all_profile.filter(is_trained_intermediate='Yes').count()
	advanced = all_profile.filter(is_trained_advanced='Yes').count()

	context = {'alumni':alumni, 'frontline':frontline, 
	'intermediate':intermediate, 'advanced':advanced, 'news':news}

	return render(request, 'feltp/newNewsfeed.html', context)


# @login_required(login_url='/login')
def newsfeed_detail(request, obj_id):
	obj = get_object_or_404(New, pk=obj_id)
	return render(request, 'feltp/newNewsfeeddetail.html', {'obj':obj})



@login_required(login_url="/login")
def newedit_user(request, obj_id):
	regions = Region.objects.all().order_by('region_name')
	user = get_object_or_404(User, pk=obj_id)
	prof = {}
	job = {}
	img = {}

	# print(obj_id)
	if UserProfile.objects.filter(user=user).exists():
		prof = UserProfile.objects.get(user=user)
		if JobInfo.objects.filter(user=user).exists():
			job = JobInfo.objects.filter(user=user)[0]
			# print(job.id)
			# job = JobInfo.objects.get(user=user)

		if ImageProfile.objects.filter(user_profile_id=prof.id): img = ImageProfile.objects.get(user_profile_id=prof.id)

	if request.method == 'POST':
		# user.email = request.POST.get('email')

		prof.surname = request.POST.get('surname')
		prof.firstname = request.POST.get('firstname')
		prof.date_of_birth = request.POST.get('date_of_birth')
		prof.phone1 = is_none(request.POST.get('phone1'))
		prof.phone2 = is_none(request.POST.get('phone2'))
		prof.is_trained_frontline = is_none(request.POST.get('is_trained_frontline'))
		prof.cohort_number_frontline = is_none(request.POST.get('cohort_number_frontline'))
		prof.yr_completed_frontline = is_none(request.POST.get('yr_completed_frontline'))
		prof.institution_enrolled_at_frontline = is_none(request.POST.get('institution_enrolled_at_frontline'))
		prof.job_title_at_enroll_frontline = is_none(request.POST.get('job_title_at_enroll_frontline'))
		prof.is_trained_intermediate = is_none(request.POST.get('is_trained_intermediate'))
		prof.cohort_number_intermediate = is_none(request.POST.get('cohort_number_intermediate'))
		prof.yr_completed_intermediate = is_none(request.POST.get('yr_completed_intermediate'))
		prof.institution_enrolled_at_intermediate = is_none(request.POST.get('institution_enrolled_at_intermediate'))
		prof.job_title_at_enroll_intermediate = is_none(request.POST.get('job_title_at_enroll_intermediate'))
		prof.is_trained_advanced = is_none(request.POST.get('is_trained_advanced'))
		prof.cohort_number_advanced = is_none(request.POST.get('cohort_number_advanced'))
		prof.yr_completed_advanced = is_none(request.POST.get('yr_completed_advanced'))
		prof.institution_enrolled_at_advanced = request.POST.get('institution_enrolled_at_advanced')
		prof.job_title_at_enroll_advanced = request.POST.get('job_title_at_enroll_advanced')
		
		prof.save()

		img = ImageProfile.objects.filter(user_profile_id=prof.id).update_or_create(
			user_profile_id=prof.id,
			defaults = dict(
				image=request.FILES.get('image'),
				user_profile_id=prof.id
				)
			)
		

		return render(request, 'feltp/newprofile_edit.html', {'regions':regions, 'prof':prof, 'img':img})

	return render(request, 'feltp/newprofile_edit.html', {'regions':regions, 'prof':prof, 'job':job, 'img':img})




#   returns the value should we have a '' or null value
def is_none(obj):
	if obj == '':
		obj == None
	else:
		return obj





def createUser(request):
	regions = Region.objects.all().order_by('region_name')
	if request.method == 'POST':

		email = request.POST.get('email')

		surname = request.POST.get('surname')
		firstname = request.POST.get('firstname')
		date_of_birth = request.POST.get('date_of_birth')
		sex = request.POST.get('sex')
		phone1 = request.POST.get('phone1')
		phone2 = request.POST.get('phone2')
		is_trained_frontline = request.POST.get('is_trained_frontline')
		cohort_number_frontline = request.POST.get('cohort_number_frontline')
		yr_completed_frontline = request.POST.get('yr_completed_frontline')
		institution_enrolled_at_frontline = request.POST.get('institution_enrolled_at_frontline')
		job_title_at_enroll_frontline = request.POST.get('job_title_at_enroll_frontline')
		is_trained_intermediate = request.POST.get('is_trained_intermediate')
		cohort_number_intermediate = request.POST.get('cohort_number_intermediate')
		yr_completed_intermediate = request.POST.get('yr_completed_intermediate')
		institution_enrolled_at_intermediate = request.POST.get('institution_enrolled_at_intermediate')
		job_title_at_enroll_intermediate = request.POST.get('job_title_at_enroll_intermediate')
		is_trained_advanced = request.POST.get('is_trained_advanced')
		cohort_number_advanced = request.POST.get('cohort_number_advanced')
		yr_completed_advanced = request.POST.get('yr_completed_advanced')
		institution_enrolled_at_advanced = request.POST.get('institution_enrolled_at_advanced')
		job_title_at_enroll_advanced = request.POST.get('job_title_at_enroll_advanced')

		image = request.FILES.get('image')

		if surname == '':
			return HttpResponse('surname')

		if firstname == '':
			return HttpResponse('firstname')

		if sex == '':
			return HttpResponse('sex')

		print('start')
		if request.POST.get('password') != request.POST.get('cpassword'):
			return HttpResponse('match')

		if User.objects.filter(email=email).exists():
			return HttpResponse('exists')

		usr = User.objects.create(
			username=email,
			email=email,
			first_name = firstname,
			last_name = surname
			)
		
		usr.set_password(request.POST.get('password'))
		usr.save()

		
		prof = UserProfile.objects.create(
			surname = surname,
			firstname = firstname,
			date_of_birth = date_of_birth,			
			phone1 =  is_none(phone1),
			phone2 =  is_none(phone2),
			user_id =  is_none(usr.id),
			is_trained_frontline =  is_none(is_trained_frontline),
			cohort_number_frontline =  is_none(cohort_number_frontline),
			yr_completed_frontline =  is_none(yr_completed_frontline),
			institution_enrolled_at_frontline =  is_none(institution_enrolled_at_frontline),
			job_title_at_enroll_frontline =  is_none(job_title_at_enroll_frontline), 
			is_trained_intermediate =  is_none(is_trained_intermediate),
			cohort_number_intermediate =  is_none(cohort_number_intermediate),
			yr_completed_intermediate =  is_none(yr_completed_intermediate),
			institution_enrolled_at_intermediate =  is_none(institution_enrolled_at_intermediate),
			job_title_at_enroll_intermediate =  is_none(job_title_at_enroll_intermediate),
			is_trained_advanced =  is_none(is_trained_advanced),
			cohort_number_advanced = is_none(cohort_number_advanced),
			yr_completed_advanced =  is_none(yr_completed_advanced),
			institution_enrolled_at_advanced =  is_none(institution_enrolled_at_advanced),
			job_title_at_enroll_advanced =  is_none(job_title_at_enroll_advanced)
			)


		created = verificationTbl.objects.create(email=email, code=codes())
		try:
			send_mail('Your Verifcation Code',
				"""Your verifcation code is """+created.code+""" .""", 'wheregeospatialnoreply@gmail.com', [email],)
		except Exception as e:
			print(e)

		

		jobs, created = JobInfo.objects.get_or_create(
			user_id= usr.id,
			current_institution=request.POST.get('current_institution'),
			job_title=request.POST.get('job_title'),
			is_current=request.POST.get('is_current'),
			defaults = {
				'region_id':request.POST.get('region'),
				'district_id':request.POST.get('district'),
				# 'is_current':request.POST.get('is_current'),
				'longitude':request.POST.get('longitude'),
				'latitude':request.POST.get('latitude'),
				'level_of_health_system_id':request.POST.get('level_of_health_system'),
				'user_profile_id': prof.id
			}
			
		)
		return HttpResponse('done')

	return render(request, 'feltp/signup.html', {'regions':regions})



@login_required(login_url="/login")
def jobsedit(request, obj_id=None):
	user = request.user.id
	print(user)
	regions = Region.objects.all().order_by('region_name')
	jobs = JobInfo.objects.filter(user_id=user)
	# print(jobs)
	print(obj_id)

	if request.method == "POST":

		current_institution = request.POST.get('current_institution')
		job_title=request.POST.get('job_title')
		region=request.POST.get('region')
		district=request.POST.get('district')
		is_current=request.POST.get('is_current')
		longitude=request.POST.get('longitude')
		latitude=request.POST.get('latitude')
		level_of_health_system=request.POST.get('level_of_health_system')

		user_profile= UserProfile.objects.get(user_id=request.user.id)

		if obj_id == 0:

			jobss, created = JobInfo.objects.get_or_create(
				
				current_institution=current_institution,
				job_title=request.POST.get('job_title'),
				defaults = {
					'user_id': user,
					'region_id':region,
					'district_id':district,
					'is_current':is_current,
					'longitude':longitude,
					'latitude':latitude,
					'level_of_health_system_id':level_of_health_system,
					'user_profile_id': user_profile.id
				}
				
			)

			return HttpResponse('done')


		else:
			job, created = JobInfo.objects.filter(user_id=user, pk=obj_id).update_or_create(
				# user_id= user_profile.user_id,
				current_institution=current_institution,
				job_title=request.POST.get('job_title'),
				defaults = {
					'region_id':region,
					'district_id':district,
					'is_current':is_current,
					'longitude':longitude,
					'latitude':latitude,
					'level_of_health_system_id':level_of_health_system,
					# 'user_profile': user_profile.id
				}
			)

			jobd = JobInfo.objects.get(user_id=user, pk=obj_id)

			return render(request, 'feltp/ind_job.html', {'job':jobd})

	return render(request, 'feltp/jobs.html', {'jobs':jobs, 'regions':regions})



def verifyCode(request):
	data = request.GET.get('data')
	# print(data)
	if data:
		try:
			query = verificationTbl.objects.get(code__contains=data)
			print(query)

			if query:
				# print(query.email)
				if User.objects.get(email__contains=query.email):
					query.status = 'used'
					query.user_id = User.objects.get(email=query.email).id
					query.save()

					prof = UserProfile.objects.get(user_id=query.user_id)
					# print(prof)
					prof.email_status='verified'
					prof.status = 'approved'
					prof.save()
					print(prof.email_status)
					# token, created = Token.objects.get_or_create(user=user)
				# 	return Response({"status": status.HTTP_200_OK, "Token": token.key})
					return HttpResponse("login")
				
				return HttpResponse('not_user')
				
			else:
				return HttpResponse("not_exist")

		except Exception as e:
			print(e)

	return render(request, 'feltp/v_code.html')




def resendCode(request):
	data = request.GET.get('data')
	email = data
	created = verificationTbl.objects.create(email=email, code=codes())
	try:
		send_mail('Your Verifcation Code',
			"""Your verifcation code is """+created.code+""" .""", 'wheregeospatialnoreply@gmail.com', [email],)
	except Exception as e:
		print(e)

	return HttpResponse('sent')
