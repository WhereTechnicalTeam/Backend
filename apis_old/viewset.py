from rest_framework import viewsets
from .models import *
from .serializers import *
from django.core.exceptions import PermissionDenied
from rest_framework.response import Response
from django.shortcuts import get_object_or_404
from rest_framework.decorators import action
from rest_framework import status, filters
from django.contrib.auth.models import User
from . import permissions
from rest_framework.permissions import IsAuthenticated
from rest_framework.authentication import TokenAuthentication
from rest_framework.authtoken.serializers import AuthTokenSerializer
from rest_framework.authtoken.views import ObtainAuthToken
from django.core.exceptions import ObjectDoesNotExist



class RegionViewSet(viewsets.ViewSet):
	serializer_class =  RegionSerializer



	# def perform_create(self, serializer):
	# 	serializer.save()

	# def create(self, request):
	# 	# if not request.user.has_perm('api.add_inventory'):
	# 	# 	raise PermissionDenied()
	# 	# else:
	# 	serializd = RegionSerializer(data=request.data)

	# 	if serializd.is_valid():
	# 		self.perform_create(serializd)
	# 		return Response(serializd.data)
	# 	else:
	# 		return Response({
 #                'status': 'Bad request'
 #            }, status=status.HTTP_404_NOT_FOUND)



	@action(detail=False)
	def get_list(self, request):
		queryset = Region.objects.all()
		serializer_class = RegionSerializer(queryset, many=True)
		return Response(serializer_class.data, status=status.HTTP_200_OK)

	

	def retrieve(self, request, pk=None):
		queryset = Region.objects.all()
		obj = get_object_or_404(queryset, pk=pk)
		serializer_class = RegionSerializer(obj)
		return Response(serializer_class.data, status=status.HTTP_200_OK)



	# def update(self, request, pk=None):
	# 	##   updates an object

	# 	try:
	# 		obj = Regions.objects.get(pk=pk)
	# 	except SC.DoesNotExist:
	# 		return Response(status=status.HTTP_404_NOT_FOUND)

	# 	# if not request.user.has_perm('api.change_inventory'):
	# 	# 	raise PermissionDenied()
	# 	# else:
	# 	serializer = RegionSerializer(obj, data=request.data)
	# 	if serializer.is_valid():
	# 		self.perform_create(serializd)
	# 		return Response(serializd.data)
	# 	return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


	# def partial_update(self, request, pk=None):
	# 	##  update part of an object
	# 	try:
	# 		obj = Regions.objects.get(pk=pk)
	# 	except SC.DoesNotExist:
	# 		return Response(status=status.HTTP_404_NOT_FOUND)

	# 	# if not request.user.has_perm('api.change_inventory'):
	# 	# 	raise PermissionDenied()
	# 	# else:
	# 	serializer = RegionSerializer(obj, data=request.data)
	# 	if serializer.is_valid():
	# 		self.perform_create(serializd)
	# 		return Response(serializd.data)
	# 	return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


	# def destroy(self, request, pk=None):
	# 	##  deletes an object
	# 	try:
	# 		obj = Regions.objects.get(pk=pk)
	# 	except SC.DoesNotExist:
	# 		return Response(status=status.HTTP_404_NOT_FOUND)

	# 	if not request.user.has_perm('api.delete_inventory'):
	# 		raise PermissionDenied()
	# 	else:
	# 		return Response({'method':'delete'})



class UserProfileViewSet(viewsets.ViewSet):
	queryset = UserProfile.objects.all()


	@action(detail=True, methods=['post', 'put', 'patch', 'delete'])
	def get(self, request):
		queryset = UserProfile.objects.all()
		serializer_class = UserProfileSerializer(queryset, many=True)
		return Response(serializer_class.data, status=status.HTTP_200_OK)


	def perform_create(self, serializer):
		serializer.save()
		

	def create(self, request):
		# if not request.user.has_perm('api.add_inventory'):
		# 	raise PermissionDenied()
		# else:
		serializd = UserProfileSerializer(data=request.data)

		if serializd.is_valid():
			self.perform_create(serializd)
			return Response(serializd.data, status=status.HTTP_201_CREATED)
		else:
			return Response({
                'status': 'Bad request'
            }, status=status.HTTP_404_NOT_FOUND)


	

	def retrieve(self, request, pk=None):
		queryset = UserProfile.objects.all()
		obj = get_object_or_404(queryset, pk=pk)
		serializer_class = UserProfileSerializer(obj)
		return Response(serializer_class.data, status=status.HTTP_200_OK)



	def update(self, request, pk=None):
		##   updates an object

		try:
			obj = UserProfile.objects.get(pk=pk)
		except ObjectDoesNotExist:
			return Response(status=status.HTTP_404_NOT_FOUND)

		# if not request.user.has_perm('api.change_inventory'):
		# 	raise PermissionDenied()
		# else:
		serializer = UserProfileSerializer(obj, data=request.data)
		if serializer.is_valid():
			self.perform_create(serializd)
			return Response(serializd.data, status=status.HTTP_200_OK)
		return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


	def partial_update(self, request, pk=None):
		##  update part of an object
		try:
			obj = UserProfile.objects.get(pk=pk)
		except ObjectDoesNotExist:
			return Response(status=status.HTTP_404_NOT_FOUND)

		# if not request.user.has_perm('api.change_inventory'):
		# 	raise PermissionDenied()
		# else:
		serializer = UserProfileSerializer(obj, data=request.data)
		if serializer.is_valid():
			self.perform_create(serializd)
			return Response(serializd.data, status=status.HTTP_200_OK)
		return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


	def destroy(self, request, pk=None):
		##  deletes an object
		try:
			obj = UserProfile.objects.get(pk=pk)
		except ObjectDoesNotExist:
			return Response(status=status.HTTP_404_NOT_FOUND)

		# if not request.user.has_perm('api.delete_inventory'):
		# 	raise PermissionDenied()
		# else:
		return Response({'method':'delete'}, status=status.HTTP_200_OK)





class JobInfoViewSet(viewsets.ViewSet):
	queryset = JobInfo.objects.all()



	@action(detail=True, methods=['post', 'put', 'patch', 'delete'])
	def get(self, request):
		queryset = JobInfo.objects.all()
		serializer_class = JobInfoSerializer(queryset, many=True)
		return Response(serializer_class.data, status=status.HTTP_200_OK)



	def perform_create(self, serializer):
		serializer.save()

	def create(self, request):
		# if not request.user.has_perm('api.add_inventory'):
		# 	raise PermissionDenied()
		# else:
		serializd = JobInfoSerializer(data=request.data)

		if serializd.is_valid():
			self.perform_create(serializd)
			return Response(serializd.data, status=status.HTTP_201_CREATED)
		else:
			return Response({
                'status': 'Bad request'
            }, status=status.HTTP_404_NOT_FOUND)


	

	def retrieve(self, request, pk=None):
		queryset = JobInfo.objects.all()
		obj = get_object_or_404(queryset, pk=pk)
		serializer_class = JobInfoSerializer(obj)
		return Response(serializer_class.data, status=status.HTTP_200_OK)



	def update(self, request, pk=None):
		##   updates an object

		try:
			obj = JobInfo.objects.get(pk=pk)
		except ObjectDoesNotExist:
			return Response(status=status.HTTP_404_NOT_FOUND)

		# if not request.user.has_perm('api.change_inventory'):
		# 	raise PermissionDenied()
		# else:
		serializer = JobInfoSerializer(obj, data=request.data)
		if serializer.is_valid():
			self.perform_create(serializd)
			return Response(serializd.data, status=status.HTTP_200_OK)
		return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


	def partial_update(self, request, pk=None):
		##  update part of an object
		try:
			obj = JobInfo.objects.get(pk=pk)
		except ObjectDoesNotExist:
			return Response(status=status.HTTP_404_NOT_FOUND)

		# if not request.user.has_perm('api.change_inventory'):
		# 	raise PermissionDenied()
		# else:
		serializer = JobInfoSerializer(obj, data=request.data)
		if serializer.is_valid():
			self.perform_create(serializd)
			return Response(serializd.data, status=status.HTTP_200_OK)
		return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


	def destroy(self, request, pk=None):
		##  deletes an object
		try:
			obj = JobInfo.objects.get(pk=pk)
		except ObjectDoesNotExist:
			return Response(status=status.HTTP_404_NOT_FOUND)

		# if not request.user.has_perm('api.delete_inventory'):
		# 	raise PermissionDenied()
		# else:
		return Response({'method':'delete'}, status=status.HTTP_200_OK)





class NewsViewSet(viewsets.ViewSet):
	queryset = New.objects.all()




	@action(detail=True, methods=['post', 'put', 'patch', 'delete'])
	def get(self, request):
		queryset = New.objects.all()
		serializer_class = NewsSerializer(queryset, many=True)
		return Response(serializer_class.data, status=status.HTTP_200_OK)



	def perform_create(self, serializer):
		serializer.save()

	def create(self, request):
		# if not request.user.has_perm('api.add_inventory'):
		# 	raise PermissionDenied()
		# else:
		serializd = NewsSerializer(data=request.data)

		if serializd.is_valid():
			self.perform_create(serializd)
			return Response(serializd.data, status=status.HTTP_201_CREATED)
		else:
			return Response({
                'status': 'Bad request'
            }, status=status.HTTP_404_NOT_FOUND)


	

	def retrieve(self, request, pk=None):
		queryset = New.objects.all()
		obj = get_object_or_404(queryset, pk=pk)
		serializer_class = NewsSerializer(obj)
		return Response(serializer_class.data, status=status.HTTP_200_OK)



	def update(self, request, pk=None):
		##   updates an object

		try:
			obj = New.objects.get(pk=pk)
		except ObjectDoesNotExist:
			return Response(status=status.HTTP_404_NOT_FOUND)

		# if not request.user.has_perm('api.change_inventory'):
		# 	raise PermissionDenied()
		# else:
		serializer = NewsSerializer(obj, data=request.data)
		if serializer.is_valid():
			self.perform_create(serializd)
			return Response(serializd.data, status=status.HTTP_200_OK)
		return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


	def partial_update(self, request, pk=None):
		##  update part of an object
		try:
			obj = New.objects.get(pk=pk)
		except ObjectDoesNotExist:
			return Response(status=status.HTTP_404_NOT_FOUND)

		# if not request.user.has_perm('api.change_inventory'):
		# 	raise PermissionDenied()
		# else:
		serializer = NewsSerializer(obj, data=request.data)
		if serializer.is_valid():
			self.perform_create(serializd)
			return Response(serializd.data, status=status.HTTP_200_OK)
		return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


	def destroy(self, request, pk=None):
		##  deletes an object
		try:
			obj = New.objects.get(pk=pk)
		except ObjectDoesNotExist:
			return Response(status=status.HTTP_404_NOT_FOUND)

		# if not request.user.has_perm('api.delete_inventory'):
		# 	raise PermissionDenied()
		# else:
		return Response({'method':'delete'}, status=status.HTTP_200_OK)




class EventViewSet(viewsets.ViewSet):
	queryset = Event.objects.all()



	@action(detail=True, methods=['post', 'put', 'patch', 'delete'])
	def get(self, request):
		queryset = Event.objects.all()
		serializer_class = EventSerializer(queryset, many=True)
		return Response(serializer_class.data, status=status.HTTP_200_OK)




	def perform_create(self, serializer):
		serializer.save()

	def create(self, request):
		# if not request.user.has_perm('api.add_inventory'):
		# 	raise PermissionDenied()
		# else:
		serializd = EventSerializer(data=request.data)

		if serializd.is_valid():
			self.perform_create(serializd)
			return Response(serializd.data, status=status.HTTP_201_CREATED)
		else:
			return Response({
                'status': 'Bad request'
            }, status=status.HTTP_404_NOT_FOUND)

	

	def retrieve(self, request, pk=None):
		queryset = Event.objects.all()
		obj = get_object_or_404(queryset, pk=pk)
		serializer_class = EventSerializer(obj)
		return Response(serializer_class.data, status=status.HTTP_200_OK)



	def update(self, request, pk=None):
		##   updates an object

		try:
			obj = Event.objects.get(pk=pk)
		except obj.DoesNotExist:
			return Response(status=status.HTTP_404_NOT_FOUND)

		# if not request.user.has_perm('api.change_inventory'):
		# 	raise PermissionDenied()
		# else:
		serializer = EventSerializer(obj, data=request.data)
		if serializer.is_valid():
			self.perform_create(serializd)
			return Response(serializd.data, status=status.HTTP_200_OK)
		return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


	def partial_update(self, request, pk=None):
		##  update part of an object
		try:
			obj = Event.objects.get(pk=pk)
		except ObjectDoesNotExist:
			return Response(status=status.HTTP_404_NOT_FOUND)

		# if not request.user.has_perm('api.change_inventory'):
		# 	raise PermissionDenied()
		# else:
		serializer = EventSerializer(obj, data=request.data)
		if serializer.is_valid():
			self.perform_create(serializd)
			return Response(serializd.data, status=status.HTTP_200_OK)
		return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


	def destroy(self, request, pk=None):
		##  deletes an object
		try:
			obj = Event.objects.get(pk=pk)
		except ObjectDoesNotExist:
			return Response(status=status.HTTP_404_NOT_FOUND)

		# if not request.user.has_perm('api.delete_inventory'):
		# 	raise PermissionDenied()
		# else:
		return Response({'method':'delete'}, status=status.HTTP_200_OK)




class UserViewSet(viewsets.ModelViewSet):
	''' handles create, update and read'''

	authentication_classes = (TokenAuthentication,)
	permission_classes = (permissions.UpdateOwnProfile,)
	serializer_class = UserSerializer
	queryset = User.objects.all()
	filter_backends = (filters.SearchFilter,)
	search_fields = ('username', 'email',)


	# @action(detail=True,methods=['put'], name='Change Password')
	# def update_password(self, request, pk=None):
	# 	user = self.get_object()
	# 	serializer = UserSerializer(data=request.data)
	# 	if serializer.is_valid():
	# 		user.set_password(serializer.validated_data['password'])
	# 		user.save()
	# 		return Response({'status': 'password set'})
	# 	else:
	# 		return Response(serializer.errors,
 #                            status=status.HTTP_400_BAD_REQUEST)



class LoginViewSet(viewsets.ViewSet):

	serializer_class = AuthTokenSerializer

	def create(self, request):
		return ObtainAuthToken().as_view()(request=request._request)





# ////////////////   detail viewset serializers view
class UserProfileDetailViewSet(viewsets.ViewSet):
	queryset = UserProfile.objects.all()

	# def perform_create(self, serializer):
	# 	serializer.save()
		

	# def create(self, request):
	# 	# if not request.user.has_perm('api.add_inventory'):
	# 	# 	raise PermissionDenied()
	# 	# else:
	# 	serializd = UserProfileSerializer(data=request.data)

	# 	if serializd.is_valid():
	# 		self.perform_create(serializd)
	# 		return Response(serializd.data, status=status.HTTP_201_CREATED)
	# 	else:
	# 		return Response({
 #                'status': 'Bad request'
 #            }, status=status.HTTP_404_NOT_FOUND)



	@action(detail=True, methods=['get'])
	def get(self, request):
		queryset = UserProfile.objects.all()
		serializer_class = UserProfileDetailViewSerializer(queryset, many=True)
		return Response(serializer_class.data, status=status.HTTP_200_OK)

	

	def retrieve(self, request, pk=None):
		queryset = UserProfile.objects.all()
		obj = get_object_or_404(queryset, pk=pk)
		serializer_class = UserProfileDetailViewSerializer(obj)
		return Response(serializer_class.data, status=status.HTTP_200_OK)



	# def update(self, request, pk=None):
	# 	##   updates an object

	# 	try:
	# 		obj = UserProfile.objects.get(pk=pk)
	# 	except ObjectDoesNotExist:
	# 		return Response(status=status.HTTP_404_NOT_FOUND)

	# 	# if not request.user.has_perm('api.change_inventory'):
	# 	# 	raise PermissionDenied()
	# 	# else:
	# 	serializer = UserProfileSerializer(obj, data=request.data)
	# 	if serializer.is_valid():
	# 		self.perform_create(serializd)
	# 		return Response(serializd.data, status=status.HTTP_200_OK)
	# 	return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


	# def partial_update(self, request, pk=None):
	# 	##  update part of an object
	# 	try:
	# 		obj = UserProfile.objects.get(pk=pk)
	# 	except ObjectDoesNotExist:
	# 		return Response(status=status.HTTP_404_NOT_FOUND)

	# 	# if not request.user.has_perm('api.change_inventory'):
	# 	# 	raise PermissionDenied()
	# 	# else:
	# 	serializer = UserProfileSerializer(obj, data=request.data)
	# 	if serializer.is_valid():
	# 		self.perform_create(serializd)
	# 		return Response(serializd.data, status=status.HTTP_200_OK)
	# 	return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


	# def destroy(self, request, pk=None):
	# 	##  deletes an object
	# 	try:
	# 		obj = UserProfile.objects.get(pk=pk)
	# 	except ObjectDoesNotExist:
	# 		return Response(status=status.HTTP_404_NOT_FOUND)

	# 	# if not request.user.has_perm('api.delete_inventory'):
	# 	# 	raise PermissionDenied()
	# 	# else:
	# 	return Response({'method':'delete'}, status=status.HTTP_200_OK)



class UserDetailViewSet(viewsets.ViewSet):
	queryset = User.objects.all()

	# def perform_create(self, serializer):
	# 	serializer.save()
		

	# def create(self, request):
	# 	# if not request.user.has_perm('api.add_inventory'):
	# 	# 	raise PermissionDenied()
	# 	# else:
	# 	serializd = UserProfileSerializer(data=request.data)

	# 	if serializd.is_valid():
	# 		self.perform_create(serializd)
	# 		return Response(serializd.data, status=status.HTTP_201_CREATED)
	# 	else:
	# 		return Response({
 #                'status': 'Bad request'
 #            }, status=status.HTTP_404_NOT_FOUND)



	@action(detail=True, methods=['get'])
	def get(self, request):
		queryset = User.objects.all()
		serializer_class = UserDetailSerializer(queryset, many=True)
		return Response(serializer_class.data, status=status.HTTP_200_OK)

	

	def retrieve(self, request, pk=None):
		queryset = User.objects.all()
		obj = get_object_or_404(queryset, pk=pk)
		serializer_class = UserDetailSerializer(obj)
		return Response(serializer_class.data, status=status.HTTP_200_OK)



	# def update(self, request, pk=None):
	# 	##   updates an object

	# 	try:
	# 		obj = User.objects.get(pk=pk)
	# 	except ObjectDoesNotExist:
	# 		return Response(status=status.HTTP_404_NOT_FOUND)

	# 	# if not request.user.has_perm('api.change_inventory'):
	# 	# 	raise PermissionDenied()
	# 	# else:
	# 	serializer = UserProfileSerializer(obj, data=request.data)
	# 	if serializer.is_valid():
	# 		self.perform_create(serializd)
	# 		return Response(serializd.data, status=status.HTTP_200_OK)
	# 	return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


	# def partial_update(self, request, pk=None):
	# 	##  update part of an object
	# 	try:
	# 		obj = User.objects.get(pk=pk)
	# 	except ObjectDoesNotExist:
	# 		return Response(status=status.HTTP_404_NOT_FOUND)

	# 	# if not request.user.has_perm('api.change_inventory'):
	# 	# 	raise PermissionDenied()
	# 	# else:
	# 	serializer = UserProfileSerializer(obj, data=request.data)
	# 	if serializer.is_valid():
	# 		self.perform_create(serializd)
	# 		return Response(serializd.data, status=status.HTTP_200_OK)
	# 	return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


	# def destroy(self, request, pk=None):
	# 	##  deletes an object
	# 	try:
	# 		obj = User.objects.get(pk=pk)
	# 	except ObjectDoesNotExist:
	# 		return Response(status=status.HTTP_404_NOT_FOUND)

	# 	# if not request.user.has_perm('api.delete_inventory'):
	# 	# 	raise PermissionDenied()
	# 	# else:
	# 	return Response({'method':'delete'}, status=status.HTTP_200_OK)

