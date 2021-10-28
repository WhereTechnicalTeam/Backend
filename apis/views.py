from django.shortcuts import render, HttpResponse
from .models import *
from .serializers import *
from rest_framework.generics import (ListAPIView, RetrieveAPIView, RetrieveUpdateAPIView, DestroyAPIView, CreateAPIView, ListCreateAPIView)
from .permissions import * 
from rest_framework.permissions import (AllowAny, IsAuthenticated, IsAdminUser, IsAuthenticatedOrReadOnly)
from django.db.models import Q
from rest_framework.response import Response
from django.shortcuts import get_object_or_404
from rest_framework.decorators import action
from rest_framework import status, filters
from django.contrib.auth.models import User
from rest_framework.authentication import TokenAuthentication
from rest_framework.authtoken.serializers import AuthTokenSerializer
from rest_framework.authtoken.views import ObtainAuthToken
from django.core.exceptions import ObjectDoesNotExist
from random import choice
import random
from string import digits, ascii_letters
from rest_framework.decorators import api_view, permission_classes
from django.core.mail import send_mail
from project.settings import EMAIL_HOST_USER
from django.contrib.auth import login, logout
from django.contrib.auth.models import update_last_login
from rest_framework.authtoken.models import Token
from rest_framework.views import APIView
from rest_framework.renderers import (HTMLFormRenderer, JSONRenderer, BrowsableAPIRenderer,)
from django.http import HttpResponseRedirect, HttpResponse, JsonResponse
from django.forms.models import model_to_dict
from django.contrib.auth.models import User
from rest_framework.parsers import FormParser, MultiPartParser
from rest_framework.renderers import JSONRenderer
from .paginations import AlldataPagination



@api_view(["GET"])
def welcome(request):
	return Response({'status': status.HTTP_200_OK, 'msg':'Welcome to FELTP APP'})


#  this is to delete duplicates from the db
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



def updateTbl():
	aa = User.objects.all()
	for a in aa:
		print('statrted')
		i = a.email.split('@')[0]
		a.first_name = i
		a.save()
	return 'done'




#     Region list view
class Region(ListAPIView): 
	queryset = Region.objects.all()
	serializer_class = RegionSerializer
	permission_classes = [IsAuthenticated]


#         User Profile Apis
class UserProfileList(ListAPIView):
	serializer_class = UserProfileSerializer
	permission_classes = [IsAuthenticated]
	# lookup_field = 'slug'
	filter_backends = (filters.SearchFilter,)
	search_fields = ('firstname', 'surname', 'status',)

	# def get_queryset(self, *args, **kwargs):
	# 	queryset_list = UserProfile.objects.all()
	# 	query = self.request.GET.get('q')
	# 	if query:
	# 		queryset_list = queryset_list.filter(
	# 			Q(surname__icontains=query)|
	# 			Q(firstname__icontains=query)|
	# 			Q(status__icontains=query)
	# 			).distinct()
	# 	return queryset_list



class UserProfileDetail(RetrieveAPIView):
	queryset = UserProfile.objects.all()
	serializer_class = UserProfileSerializer
	lookup_field = 'pk'
	permission_classes = [IsAuthenticated]


class UserProfileUpdate(RetrieveUpdateAPIView):
	queryset = UserProfile.objects.all()
	serializer_class = UserProfileSerializer
	lookup_field = 'pk'
	permission_classes = [IsAuthenticatedOrReadOnly, IsOwnerOrReadOnly]

	def perform_update(self, serializer):
		serializer.save(user=self.request.user)
		return Response({"status":status.HTTP_200_OK, "user": serializer.data})


class UserProfileDelete(DestroyAPIView):
	queryset = UserProfile.objects.all()
	serializer_class = UserProfileSerializer
	lookup_field = 'pk'
	permission_classes = [IsAuthenticated, IsOwnerOrReadOnly]

	def perform_delete(self, serializer):
		serializer.save(user=self.request.user)



class UserProfileCreate(CreateAPIView):
	queryset = UserProfile.objects.all()
	serializer_class = UserProfileSerializer
	permission_classes = [IsAuthenticated]

	def perform_create(self, serializer):
		serializer.save(user=self.request.user)
		return Response({"status":status.HTTP_200_OK, "user": serializer.data})
	



#         User  Apis
class UserList(ListAPIView):
	authentication_classes = (TokenAuthentication,)
	serializer_class = UserSerializer
	permission_classes = [IsAuthenticated]
	# lookup_field = 'slug'
	filter_backends = (filters.SearchFilter,)
	search_fields = ('username', 'email',)


	def list(self, request):
		# Note the use of `get_queryset()` instead of `self.queryset`
		queryset = self.get_queryset()
		serializer = UserSerializer(queryset, many=True)
		return Response({"status":status.HTTP_200_OK, "events": serializer.data})



class UserDetail(RetrieveAPIView):
	queryset = User.objects.all()
	serializer_class = UserSerializer
	lookup_field = 'pk'
	permission_classes = [IsAuthenticated]


	def get(self, request, pk):
		# Note the use of `get_queryset()` instead of `self.queryset`
		queryset = self.get_queryset()
		queryset = queryset.get(pk=pk)
		serializer = UserSerializer(queryset)
		return Response({"status":status.HTTP_200_OK, "user": serializer.data})


class UserUpdate(RetrieveUpdateAPIView):
	queryset = User.objects.all()
	serializer_class = UserSerializer
	lookup_field = 'pk'
	permission_classes = [IsAuthenticatedOrReadOnly, IsUserOrNot]

	# def perform_update(self, serializer):
	# 	serializer.save(user=self.request.user)


	def update(self, validated_data, pk):
		obj = get_object_or_404(User, pk=pk)

		username = self.request.data.get('username')
		email = self.request.data.get('email')
		password = self.request.data.get('password')
		confirm = self.request.data.get('confirm')

		if confirm == password:
			obj.email=email
			obj.username=username
			obj.set_password(password)
			obj.save()
			return Response("Success, user details updated", status=status.HTTP_200_OK)

		else:
			return Response({"status":status.HTTP_404_BAD_REQEUST, "msg":"Passwords do not match"})


class UserDelete(DestroyAPIView):
	queryset = User.objects.all()
	serializer_class = UserSerializer
	lookup_field = 'pk'
	permission_classes = [IsAdminUser]

	def perform_delete(self, serializer):
		serializer.save(user=self.request.user)


class UserCreate(CreateAPIView):
	queryset = User.objects.all()
	serializer_class = UserSerializer
	# permission_classes = [IsAuthenticated]

	def perform_create(self, serializer):
		serializer.save()
		return Response({"status":status.HTTP_200_OK, "user": serializer.data})
	



#         Events  Apis
class EventsList(ListAPIView):
	serializer_class = EventSerializer
	permission_classes = [IsAuthenticated, IsOwnerOrReadOnly]
	filter_backends = (filters.SearchFilter,)
	search_fields = ('schedule', 'description', 'title',)

	# def get_queryset(self, *args, **kwargs):
	# 	queryset_list = Event.objects.all()
	# 	query = self.request.GET.get('q')
	# 	if query:
	# 		queryset_list = queryset_list.filter(
	# 			Q(title__icontains=query)|
	# 			Q(description__icontains=query)|
	# 			Q(schedule__icontains=query)
	# 			).distinct()
	# 	return queryset_list


	def list(self, request):
		# Note the use of `get_queryset()` instead of `self.queryset`
		queryset = self.get_queryset()
		serializer = EventSerializer(queryset, many=True)
		return Response({"status":status.HTTP_200_OK, "events": serializer.data})



class EventsDetail(RetrieveAPIView):
	queryset = Event.objects.all()
	serializer_class = EventSerializer
	lookup_field = 'pk'
	permission_classes = [IsAuthenticated]


	def get(self, request, pk):
		# Note the use of `get_queryset()` instead of `self.queryset`
		queryset = self.get_queryset()
		queryset = queryset.get(pk=pk)
		serializer = EventSerializer(queryset)
		return Response({"status":status.HTTP_200_OK, "events": serializer.data})



class EventsUpdate(RetrieveUpdateAPIView):
	queryset = Event.objects.all()
	serializer_class = EventSerializer
	lookup_field = 'pk'
	permission_classes = [IsAdminUser]

	def perform_update(self, serializer):
		serializer.save(user=self.request.user)
		return Response({"status":status.HTTP_200_OK, "events": serializer.data})

	

class EventsDelete(DestroyAPIView):
	queryset = Event.objects.all()
	serializer_class = EventSerializer
	lookup_field = 'pk'
	permission_classes = [IsAdminUser]

	def perform_delete(self, serializer):
		serializer.save()


class EventsCreate(CreateAPIView):
	queryset = Event.objects.all()
	serializer_class = EventSerializer
	permission_classes = [IsAdminUser]

	def perform_create(self, serializer):
		serializer.save()
		return Response({"status":status.HTTP_200_OK, "events": serializer.data})


	def create(self, validated_data):
		serializd = EventSerializer(data=validated_data.data)
		if serializd.is_valid():
			self.perform_create(serializd)
			return Response({"status":status.HTTP_200_OK, "events": serializd.data})
		else:
			return Response({"status":status.HTTP_404_NOT_FOUND})






#         News  Apis
class NewsList(ListAPIView):
	serializer_class = NewsSerializer
	permission_classes = [IsAuthenticated, IsOwnerOrReadOnly]
	filter_backends = (filters.SearchFilter,)
	search_fields = ('content', 'title',)

	def get_queryset(self, *args, **kwargs):
		queryset_list = New.objects.all()
		query = self.request.GET.get('q')
		if query:
			queryset_list = queryset_list.filter(
				Q(title__icontains=query)|
				Q(content__icontains=query)
				).distinct()
		return queryset_list


	def list(self, request):
		# Note the use of `get_queryset()` instead of `self.queryset`
		queryset = self.get_queryset()
		serializer = NewsSerializer(queryset, many=True)
		return Response({"status":status.HTTP_200_OK, "news": serializer.data})



class NewsDetail(RetrieveAPIView):
	queryset = New.objects.all()
	serializer_class = NewsSerializer
	lookup_field = 'pk'
	permission_classes = [IsAuthenticated, IsOwnerOrReadOnly]


	def get(self, request, pk):
		# Note the use of `get_queryset()` instead of `self.queryset`
		queryset = self.get_queryset()
		queryset = queryset.get(pk=pk)
		serializer = NewsSerializer(queryset)
		return Response({"status":status.HTTP_200_OK, "news": serializer.data})


class NewsUpdate(RetrieveUpdateAPIView):
	queryset = New.objects.all()
	serializer_class = NewsSerializer
	lookup_field = 'pk'
	permission_classes = [IsAuthenticated]

	def perform_update(self, serializer):
		serializer.save(user=self.request.user)

	

class NewsDelete(DestroyAPIView):
	queryset = New.objects.all()
	serializer_class = NewsSerializer
	lookup_field = 'pk'
	permission_classes = [IsAuthenticated]

	def perform_delete(self, serializer):
		serializer.save(user=self.request.user)


class NewCreate(CreateAPIView):
	queryset = New.objects.all()
	serializer_class = NewsSerializer
	#permission_classes = [IsAuthenticated]

	def perform_create(self, serializer):
		serializer.save(user=self.request.user)


	def create(self, validated_data):
		serializd = NewsSerializer(data=validated_data.data)
		if serializd.is_valid():
			self.perform_create(serializd)
			return Response({"status":status.HTTP_200_OK, "news": serializd.data})
		else:
			return Response({"status":status.HTTP_404_NOT_FOUND})



#         Jobs  Apis
class JobsList(ListAPIView):
	serializer_class = JobInfoSerializer
	permission_classes = [IsAuthenticated, IsOwnerOrReadOnly]
	filter_backends = (filters.SearchFilter,)
	search_fields = ('content', 'title',)


	def list(self, request):
		# Note the use of `get_queryset()` instead of `self.queryset`
		queryset = self.get_queryset()
		serializer = JobInfoSerializer(queryset, many=True)
		return Response({"status":status.HTTP_200_OK, "news": serializer.data})



class JobsDetail(RetrieveAPIView):
	queryset = User.objects.all()
	serializer_class = AllJobsSerializer
	lookup_field = 'pk'
	#permission_classes = [IsAuthenticated]


	def get(self, request, pk):
		# Note the use of `get_queryset()` instead of `self.queryset`
		queryset0 = self.get_queryset()
		queryset1 = queryset0.filter(pk=pk)
		# queryset = JobInfo.objects.filter(user_id=pk)
		serializer = AllJobsSerializer(queryset1, many=True)
		return Response({"status":status.HTTP_200_OK, "job": serializer.data})



class JobsUpdate(RetrieveUpdateAPIView):
	queryset = JobInfo.objects.all()
	serializer_class = JobInfoSerializer
	lookup_field = 'pk'
	#permission_classes = [IsAuthenticatedOrReadOnly, IsOwnerOrReadOnly]

	def perform_update(self, serializer):
		serializer.save(user=self.request.user)
		return Response({"status":status.HTTP_200_OK, "job": serializer.data})

	

class JobsDelete(DestroyAPIView):
	queryset = JobInfo.objects.all()
	serializer_class = JobInfoSerializer
	lookup_field = 'pk'
	permission_classes = [IsAuthenticated]

	def perform_delete(self, serializer):
		serializer.save(user=self.request.user)


class JobsCreate(CreateAPIView):
	queryset = JobInfo.objects.all()
	serializer_class = JobInfoSerializer
	#permission_classes = [IsAuthenticated]



	def perform_create(self, serializer):
		serializer.save(user=self.request.user)
		return Response({"status":status.HTTP_200_OK, "job": serializer.data})



	def create(self, validated_data):
		serializd = JobInfoSerializer(data=validated_data.data)
		if serializd.is_valid():
			self.perform_create(serializd)
			return Response({"status":status.HTTP_200_OK, "news": serializd.data})
		else:
			return Response({"status":status.HTTP_404_NOT_FOUND})



#         all data from users to news apis
class UserDetailViewList(ListAPIView):
	queryset = User.objects.all().order_by('id')
	serializer_class = UserDetailSerializer
	#permission_classes = [IsAuthenticated, IsOwnerOrReadOnly]
	filter_backends = (filters.SearchFilter,)
	search_fields = ('username', 'email',)
	pagination = AlldataPagination



	def list(self, request):
		# Note the use of `get_queryset()` instead of `self.queryset`
		# queryset = self.get_queryset()
		# serializer = UserDetailSerializer(queryset, many=True)

		queryset = self.filter_queryset(self.get_queryset())
		page = self.paginate_queryset(queryset)
		if page is not None:
			serializer = self.get_serializer(page, many=True)
			result = self.get_paginated_response(serializer.data)
			data = result.data # pagination data
		else:
			print(page)
			serializer = self.get_serializer(queryset, many=True)
			data = 'Null'
			print(data)
			return Response({"status":status.HTTP_404_NOT_FOUND, "alldata": data})
		# payload = {
		# 	'return_code': '0000',
		# 	'return_message': 'Success',
		# 	'data': data
		# }
		return Response({"status":status.HTTP_200_OK, "alldata": data})



class UserDetailViewDetail(RetrieveAPIView):
	queryset = User.objects.all()
	serializer_class = UserDetailSerializer
	lookup_field = 'pk'
	#permission_classes = [IsAuthenticated, IsOwnerOrReadOnly]

	def get(self, request, pk):
		# Note the use of `get_queryset()` instead of `self.queryset`
		queryset = self.get_queryset()
		queryset = queryset.get(pk=pk)
		serializer = UserDetailSerializer(queryset)
		return Response({"status":status.HTTP_200_OK, "alldata": serializer.data})











@api_view(["GET", "POST"])
def tokenValidate(request):
	data = request.data['token']
	if Token.objects.filter(pk=data).exists():
		return Response({"status":status.HTTP_200_OK, "msg" : "true"})
	return JsonResponse({"status":status.HTTP_404_NOT_FOUND, "msg" : "false"})





@api_view(["GET", "POST"])
def logout_user(request):
    # simply delete the token to force a login
    # print(request.data['token'])
    data = request.data['token']
    Token.objects.get(pk=data).delete()
    return JsonResponse({"status":status.HTTP_200_OK, "msg" : "logged out"})




# class Logout(APIView):
#     def get(self, request, format=None):
#         # simply delete the token to force a login
#         request.user.auth_token.delete()
#         return Response({"status":status.HTTP_200_OK, "logout" : "true"})



@api_view(['POST'])
def verify_code(request):
	print(request.data['code'])
	# print(request.data)

	try:
		query = verificationTbl.objects.get(code__contains=request.data['code'])
		# print(query)

		if query:
			if User.objects.filter(email__contains=query.email):
				query.status = 'used'
				query.user_id = User.objects.get(email=query.email).id
				query.save()

				return Response({"msg":"Verification code is valid. You may login.", "status":status.HTTP_200_OK})
			
			else:
				# print('here')
				return Response({"msg":"Verification code is valid. You may sign up.", "status":status.HTTP_200_OK})

		else:
			return Response({"msg":"This verification code does not exist.", "status":status.HTTP_400_BAD_REQUEST})

	except:
		return Response({"msg":"This verification code does not exist.", "status":status.HTTP_400_BAD_REQUEST})



{
"email":"aabalekuusimon78@gmail.com",
"password":"add123456"
}


{
"email":"jmadjanor6@gmail.com",
"password":"jed123456"
}


{
"code":"29M3rA"
}


{
"email":"aabalekuusimon78@gmail.com"
}




     # login View
@api_view(['GET', 'POST'])
def login(request):
    serializer = LoginSerializers(data=request.data, context={'request': request})
    if serializer.is_valid():
	    email = request.data.get('email')
	    password = request.data.get('password')


	    if email and password:
	        user = authenticate(username=email, password=password)

	        if not user:
	            raise serializers.ValidationError({'status':status.HTTP_400_BAD_REQUEST, 'msg':'invalid credentials.'})

	        else:
	        	user = User.objects.get(email=email)
	        	queryset = User.objects.filter(email=user)
	        	datas = LoginSerializers(queryset, many=True)

	        	if UserProfile.objects.filter(user=user).exists():
			        prof = UserProfile.objects.get(user=user)
			        try:
			            if prof.status == 'approved' and prof.email_status == 'verified':
			                # print ('ver')
			                # print('yes')
			                update_last_login(None, user)
			                user.is_active = True
			                user.save()
			                (token, created) = Token.objects.get_or_create(user=user)
			                
			                # job =  JobInfo.objects.get(user=user)

			                return Response({"status":status.HTTP_200_OK, 'token': token.key, "alldata": datas.data})
			              
			            else:
			                return Response({'status': status.HTTP_400_BAD_REQUEST, 'msg': 'not verified.'})
			        except Exception as e:
			            return Response({'status': status.HTTP_500_INTERNAL_SERVER_ERROR})

	    else:
	        raise serializers.ValidationError({'status':'401', 'msg':'not authorised.'})
      

    return Response({'status': status.HTTP_400_BAD_REQUEST})


def codes(length=6):
    passW = ''
    for i in range(length):
        passW += random.choice(digits + ascii_letters)
    if verificationTbl.objects.filter(code=passW).exists():
    	return codes()

    return passW



@api_view(['POST'])
def get_profile(request):
	try:
		print('yes')
		query = User.objects.get(email__contains=request.data['email'])

		if query:
			profile = UserProfile.objects.get(user=query)
			queryset = User.objects.filter(email=request.data['email'])
			serializered = AlldataSerializer(queryset, many=True)

			if profile.email_status=='not verified':
				print('not verified')
				created = verificationTbl.objects.create(email=request.data['email'], code=codes())
				try:
					send_mail('Your Verifcation Code',
						"""Your verifcation code is """+created.code+""" .""", 'wheregeospatialnoreply@gmail.com', [request.data['email']],)
					#return Response({"status":status.HTTP_200_OK,  "msg":"A verification code has been sent to your email"})
					return Response({"status":status.HTTP_200_OK, "alldata": serializered.data, "msg":"A verification code has been sent to your email"})
					
				except Exception as e:
					# print(e)
					return Response({"status":status.HTTP_500_INTERNAL_SERVER_ERROR, "msg":"Could not send info to email, an error occured. Contact admin for verification."})
			else:
				print('verified')

				return Response({"status":status.HTTP_200_OK, "alldata": serializered.data})

				
		else:
			return Response({"status":status.HTTP_400_BAD_REQUEST, "msg":"User not found"})

	except:
		return Response({"status":status.HTTP_400_BAD_REQUEST, "msg":"User not found"})



@api_view(['POST'])
def v_code(request):
	print(request.data['code'])

	try:
		query = verificationTbl.objects.get(code__contains=request.data['code'])
		print(query)

		if query:
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
				return Response({"status":status.HTTP_200_OK, "msg":"Verification code is valid. You may login."})
			
		else:
			return Response({"status":status.HTTP_400_BAD_REQUEST, "msg":"This verification code does not exist."})

	except Exception as e:
		print(e)
		return Response({"status":status.HTTP_400_BAD_REQUEST, "msg":"This verification code does not exist."})




@api_view(['POST'])
def send_code(request):
	print(request.data['email'])

	created = verificationTbl.objects.create(email=request.data['email'], code=codes())
	print(created)
	try:
		send_mail('Your Verifcation Code',
			"""Your verifcation code is """+created.code+""" .""", 'wheregeospatialnoreply@gmail.com', [request.data['email']],)
		return Response({"status":status.HTTP_200_OK, "msg":"A verification code has been sent to your email"})
		
	except Exception as e:
		# print(e)
		return Response({"status":status.HTTP_500_INTERNAL_SERVER_ERROR, "msg":"Could not send info to email, an error occured. Contact admin for verification."})



@api_view(['GET'])
def fetch_jobs(request, pk):
	all_profile = User.objects.filter(id=pk)

	serializer = AllJobsSerializer(all_profile, many=True)
	if len(serializer.data) == 1:
		return Response({"status":status.HTTP_200_OK, "alldata":serializer.data[0]})
	return Response({"status":status.HTTP_400_BAD_REQUEST, "msg":"Does not exist"})



class UpdateJobs(RetrieveUpdateAPIView):
	queryset = User.objects.all()
	serializer_class = AllJobsSerializer
	#permission_classes = [IsAuthenticated,]

	def perform_update(self, serializer):
		serializer.save(user=self.request.user)
		return Response(serializer.data, status=status.HTTP_200_OK)



	def get(self, request, pk):
		# Note the use of `get_queryset()` instead of `self.queryset`
		queryset0 = self.get_queryset()
		queryset1 = queryset0.filter(pk=pk)
		# queryset = JobInfo.objects.filter(user_id=pk)
		serializer = AllJobsSerializer(queryset1, many=True)
		return Response(serializer.data[0], status=status.HTTP_200_OK)






@api_view(['GET'])
def statistics(request):
	all_profile = UserProfile.objects.all()
	alumni = all_profile.count()
	frontline = all_profile.filter(is_trained_frontline='Yes').count()
	intermediate = all_profile.filter(is_trained_intermediate='Yes').count()
	advanced = all_profile.filter(is_trained_advanced='Yes').count()

	context = {'alumni':alumni, 'frontline':frontline, 
	'intermediate':intermediate, 'advanced':advanced}

	return Response({"status":status.HTTP_200_OK, "stats": context})





#   returns the value should we have a '' or null value
def is_none(obj):
	if obj == '':
		obj == None
	else:
		return obj



class UserAndProfileCreate(CreateAPIView):
	queryset = User.objects.all()
	serializer_class = UserAndProfileSerializer
	#permission_classes = [IsAuthenticated]
	renderer_classes = [JSONRenderer]


	def list(self, request):
		# Note the use of `get_queryset()` instead of `self.queryset`
		queryset = self.get_queryset()
		serializer = UpdateProfileSerializer(queryset, many=True)
		return Response({"status":status.HTTP_200_OK, "alldata": serializer.data})


	def perform_create(self, serializer):
		# print(serializer.data.image)
		a=serializer.save()
		# print(serializer.data)
		return Response({"status":status.HTTP_201_CREATED, "alldata": serializer.data})
	



class UserAndProfileUpdate(RetrieveUpdateAPIView):
	queryset = User.objects.all()
	serializer_class = UpdateProfileSerializer
	#permission_classes = [IsAuthenticated,]

	def perform_update(self, serializer):
		serializer.save(user=self.request.user)
		return Response({"status":status.HTTP_200_OK, "alldata": serializer.data})


	# def update(self, validated_data, pk):

	# 	print(validated_data.data['main_user']['image'])
	# 	print(pk)

	# 	if User.objects.get(id=pk):
	# 		# user = User.objects.get(id=pk)
	# 		# print(user)

	# 		if UserProfile.objects.filter(user_id=pk).exists():
	# 			profile = UserProfile.objects.get(user_id=pk)
	# 			profile.title = validated_data.data['main_user']['title']
	# 			profile.surname = validated_data.data['main_user']['surname']
	# 			profile.firstname = validated_data.data['main_user']['firstname']
	# 			profile.sex = validated_data.data['main_user']['sex']
	# 			profile.date_of_birth = validated_data.data['main_user']['date_of_birth']
	# 			profile.phone1 = validated_data.data['main_user']['phone1']
	# 			profile.phone2 = validated_data.data['main_user']['phone2']
	# 			profile.is_trained_frontline = validated_data.data['main_user']['is_trained_frontline']
	# 			profile.cohort_number_frontline = validated_data.data['main_user']['cohort_number_frontline']
	# 			profile.yr_completed_frontline = validated_data.data['main_user']['yr_completed_frontline']
	# 			profile.institution_enrolled_at_frontline = validated_data.data['main_user']['institution_enrolled_at_frontline']
	# 			profile.job_title_at_enroll_frontline = validated_data.data['main_user']['job_title_at_enroll_frontline']
	# 			profile.is_trained_intermediate = validated_data.data['main_user']['is_trained_intermediate']
	# 			profile.cohort_number_intermediate = validated_data.data['main_user']['cohort_number_intermediate']
	# 			profile.yr_completed_intermediate = validated_data.data['main_user']['yr_completed_intermediate']
	# 			profile.institution_enrolled_at_intermediate = validated_data.data['main_user']['institution_enrolled_at_intermediate']
	# 			profile.job_title_at_enroll_intermediate = validated_data.data['main_user']['job_title_at_enroll_intermediate']
	# 			profile.is_trained_advanced = validated_data.data['main_user']['is_trained_advanced']
	# 			profile.cohort_number_advanced = validated_data.data['main_user']['cohort_number_advanced']
	# 			profile.yr_completed_advanced = validated_data.data['main_user']['yr_completed_advanced']
	# 			profile.institution_enrolled_at_advanced = validated_data.data['main_user']['institution_enrolled_at_advanced']
	# 			profile.job_title_at_enroll_advanced = validated_data.data['main_user']['job_title_at_enroll_advanced']

	# 			import base64
	# 			from django.core.files.base import ContentFile
	# 			import os

	# 			dd = validated_data.data['main_user']['image']
	# 			image = os.path.join('api_images/profile/', dd)

	# 			profile.image = image
	# 			profile.save()
	# 			    # prof.image = op
	# 			    # prof.save()
	# 		else:
	# 			prof = UserProfile.objects.filter(user_id=user.id).create(**main, user=user)
	# 			# print(prof[0].id)



	# 		# if len(jobs_data1) >= 0:
	# 		# 	for datas in job:
	# 		# 	    jobs = jobs_data1.pop(0)
	# 		# 	    jobs.current_institution = datas.get('current_institution', jobs.current_institution)
	# 		# 	    jobs.job_title = datas.get('job_title', jobs.job_title)
	# 		# 	    jobs.region = datas.get('region', jobs.region)
	# 		# 	    jobs.district = datas.get('district', jobs.district)
	# 		# 	    jobs.level_of_health_system = datas.get('level_of_health_system', jobs.level_of_health_system)
	# 		# 	    jobs.employment_status = datas.get('employment_status', jobs.employment_status)
	# 		# 	    jobs.is_current = datas.get('is_current', jobs.is_current)
	# 		# 	    jobs.longitude = datas.get('longitude', jobs.longitude)
	# 		# 	    jobs.latitude = datas.get('latitude', jobs.latitude)
	# 		# 	    jobs.save()

	# 			# else:
	# 			#     new_job = JobInfo.objects.create(**job[0], user=user, user_profile_id=prof[0].id)

	# 	return user



	def get(self, request, pk):
		# Note the use of `get_queryset()` instead of `self.queryset`
		queryset = self.get_queryset()
		queryset = queryset.get(pk=pk)
		serializer = UpdateProfileSerializer(queryset)
		return Response({"status":status.HTTP_200_OK, "alldata": serializer.data})



class updatePassword(RetrieveUpdateAPIView):
	queryset = User.objects.values('id', 'email')
	serializer_class = PasswordSerializer
	permission_classes = [IsAuthenticated, IsUserOrNot]

	def perform_update(self, serializer):
		serializer.save()
		return Response({"status":status.HTTP_200_OK, "alldata": serializer.data})

	def update(self, validated_data, pk):
		obj = get_object_or_404(User, email=validated_data.data['email'])
		print(obj)

		password = self.request.data.get('password')
		confirm = self.request.data.get('confirm')

		if confirm == password:
			obj.set_password(password)
			obj.save()
			return Response({"status":status.HTTP_200_OK, "msg":"Success, user password updated"})

		else:
			return Response({"status":status.HTTP_404_BAD_REQEUST, "msg":"Passwords do not match"})



class ImageUpload(APIView):
	parser_classes = [MultiPartParser, FormParser]

	def put(self, request, format=None):
		# print(request.data)

		try:
			data, updated = ImageProfile.objects.filter(user_profile_id=request.data.get('user_profile')).update_or_create(
				user_profile_id=request.data.get('user_profile'),
				defaults = dict(
					image=request.data.get('image'),
					user_profile_id=request.data.get('user_profile')
					)
				)
			return Response({"status":status.HTTP_200_OK, "msg":"Image uploaded"})
		except Exception as e:
			return Response({"status":status.HTTP_404_BAD_REQEUST, "msg1":e, 'data_captured':request.data})


		# serializer = ImageSerializer(data=request.data)
		# if serializer.is_valid():
		# 	serializer.save()
		# 	return Response({"status":status.HTTP_200_OK, "msg":"Image uploaded"})
		# else:
		# 	return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
