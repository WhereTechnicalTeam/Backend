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
from rest_framework.parsers import FormParser




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

	def get_queryset(self, *args, **kwargs):
		queryset_list = UserProfile.objects.all()
		query = self.request.GET.get('q')
		if query:
			queryset_list = queryset_list.filter(
				Q(surname__icontains=query)|
				Q(firstname__icontains=query)|
				Q(status__icontains=query)
				).distinct()
		return queryset_list



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
	



#         User  Apis
class UserList(ListAPIView):
	authentication_classes = (TokenAuthentication,)
	serializer_class = UserSerializer
	permission_classes = [IsAuthenticated]
	# lookup_field = 'slug'
	filter_backends = (filters.SearchFilter,)
	search_fields = ('username', 'email',)

	def get_queryset(self, *args, **kwargs):
		queryset_list = User.objects.all()
		query = self.request.GET.get('q')
		if query:
			queryset_list = queryset_list.filter(
				Q(username__icontains=query)|
				Q(email__icontains=query)
				).distinct()
		return queryset_list


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
	



#         Events  Apis
class EventsList(ListAPIView):
	serializer_class = EventSerializer
	permission_classes = [IsAuthenticated, IsOwnerOrReadOnly]
	filter_backends = (filters.SearchFilter,)
	search_fields = ('schedule', 'description', 'title',)

	def get_queryset(self, *args, **kwargs):
		queryset_list = Event.objects.all()
		query = self.request.GET.get('q')
		if query:
			queryset_list = queryset_list.filter(
				Q(title__icontains=query)|
				Q(description__icontains=query)|
				Q(schedule__icontains=query)
				).distinct()
		return queryset_list


	def list(self, request):
		# Note the use of `get_queryset()` instead of `self.queryset`
		queryset = self.get_queryset()
		serializer = NewsSerializer(queryset, many=True)
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
	queryset = JobInfo.objects.all()
	serializer_class = JobInfoSerializer
	lookup_field = 'pk'
	permission_classes = [IsAuthenticated]


	def get(self, request, pk):
		# Note the use of `get_queryset()` instead of `self.queryset`
		queryset = self.get_queryset()
		queryset = queryset.get(pk=pk)
		serializer = JobInfoSerializer(queryset)
		return Response({"status":status.HTTP_200_OK, "job": serializer.data})



class JobsUpdate(RetrieveUpdateAPIView):
	queryset = JobInfo.objects.all()
	serializer_class = JobInfoSerializer
	lookup_field = 'pk'
	permission_classes = [IsAuthenticatedOrReadOnly, IsOwnerOrReadOnly]

	def perform_update(self, serializer):
		serializer.save(user=self.request.user)

	

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
	permission_classes = [IsAuthenticated]



	def perform_create(self, serializer):
		serializer.save(user=self.request.user)



	def create(self, validated_data):
		serializd = JobInfoSerializer(data=validated_data.data)
		if serializd.is_valid():
			self.perform_create(serializd)
			return Response({"status":status.HTTP_200_OK, "news": serializd.data})
		else:
			return Response({
                'status': 'Bad request'
            }, status=status.HTTP_404_NOT_FOUND)



#         all data from users to news apis
class UserDetailViewList(ListAPIView):
	queryset = User.objects.all()[:20]
	serializer_class = UserDetailSerializer
	#permission_classes = [IsAuthenticated, IsOwnerOrReadOnly]
	filter_backends = (filters.SearchFilter,)
	search_fields = ('username', 'email',)



	def list(self, request):
		# Note the use of `get_queryset()` instead of `self.queryset`
		queryset = self.get_queryset()
		serializer = UserDetailSerializer(queryset, many=True)
		return Response({"status":status.HTTP_200_OK, "alldata": serializer.data})



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
		return Response({"status":status.HTTP_200_OK, "token" : "true"})
	return JsonResponse({"status":status.HTTP_404_NOT_FOUND, "token" : "false"})





@api_view(["GET", "POST"])
def logout_user(request):
    # simply delete the token to force a login
    print(request.data['token'])
    data = request.data['token']
    Token.objects.get(pk=data).delete()
    return JsonResponse({"status":status.HTTP_200_OK, "logout" : "true"})




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

				return Response("Verification code is valid. You may login.", status=status.HTTP_200_OK)
			
			else:
				# print('here')
				return Response("Verification code is valid. You may sign up.", status=status.HTTP_200_OK)

		else:
			return Response("This verification code does not exist.", status=status.HTTP_400_BAD_REQUEST)

	except:
		return Response("This verification code does not exist.", status=status.HTTP_400_BAD_REQUEST)



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
    if serializer.is_valid(raise_exception=True):
        # user = serializer.validated_data['user']
        email = request.data.get('email')
        user = User.objects.get(email=email)
        queryset = User.objects.filter(email=user)
        serializered = AlldataSerializer(queryset, many=True)

        # user = User.objects.get(user=user, user)

        # print (user)
        prof = UserProfile.objects.get(user=user)
        try:
            if prof.status == 'approved' and prof.email_status == 'verified':
                print ('ver')
                update_last_login(None, user)
                user.is_active = True
                user.save()
                (token, created) = Token.objects.get_or_create(user=user)
                job =  JobInfo.objects.get(user=user)


                return Response({"status":status.HTTP_200_OK, 'token': token.key, "alldata": serializered.data})
              
            else:
                return Response({'status': status.HTTP_400_BAD_REQUEST,
                                'Final Verifcation': 'You have not yet been verified by the admin. You may knidly contact him/her to be verified to be logged in.'
                                })
        except Exception as e:
            return Response({'status': status.HTTP_500_INTERNAL_SERVER_ERROR})
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
					return Response({"status":status.HTTP_200_OK, "alldata": serializered.data, "code":"A verification code has been sent to your email"})
					
				except Exception as e:
					print(e)
					return Response("Could not send info to email, an error occured. Contact admin for verification.", status=status.HTTP_500_INTERNAL_SERVER_ERROR)
			else:
				print('verified')

				return Response({"status":status.HTTP_200_OK, "alldata": serializered.data})

				
		else:
			return Response({"action":"User not found", "status":status.HTTP_400_BAD_REQUEST})

	except:
		return Response({"action":"User not found", "status":status.HTTP_400_BAD_REQUEST})



@api_view(['POST'])
def v_code(request):
	print(request.data['code'])
	print(request.data)

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
				return Response("Verification code is valid. You may login.", status=status.HTTP_200_OK)
			
		else:
			return Response("This verification code does not exist.", status=status.HTTP_400_BAD_REQUEST)

	except Exception as e:
		print(e)
		return Response("This verification code does not exist.", status=status.HTTP_400_BAD_REQUEST)




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


	def list(self, request):
		# Note the use of `get_queryset()` instead of `self.queryset`
		queryset = self.get_queryset()
		serializer = AlldataSerializer(queryset, many=True)
		return Response({"status":status.HTTP_200_OK, "user": serializer.data})


	def perform_create(self, serializer):
		return serializer.save()

	



class UserAndProfileUpdate(RetrieveUpdateAPIView):
	queryset = User.objects.all()
	serializer_class = UpdateProfileSerializer
	#permission_classes = [IsAuthenticated, IsUserOrNot]

	def perform_update(self, serializer):
		serializer.save(user=self.request.user)
		return Response({"status":status.HTTP_200_OK, "alldata": serializer.data})



	def get(self, request, pk):
		# Note the use of `get_queryset()` instead of `self.queryset`
		queryset = self.get_queryset()
		queryset = queryset.get(pk=pk)
		serializer = UpdateProfileSerializer(queryset)
		return Response({"status":status.HTTP_200_OK, "alldata": serializer.data})



