from rest_framework import permissions


class IsOwnerOrReadOnly(permissions.BasePermission):
	'''Allow users to edit their own profile'''

	message = "You must be the owner of this message"
	global my_safe_method
	my_safe_method = ['PUT', 'GET']

	def has_permission(self, request, view):
		if request.method in my_safe_method:
			return True
		return False


	def has_object_permission(self, request, view, obj):
		if request.method in permissions.SAFE_METHODS:
			return True

		return obj.user == request.user


class IsUserOrNot(permissions.BasePermission):
	def has_object_permission(self, request, view, obj):
		if request.method in permissions.SAFE_METHODS:
			return True

		return obj.id == request.user
