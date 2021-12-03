from django.urls import path, include
from . import views
from .views import *

# from rest_framework import routers


# router = routers.DefaultRouter()
# router.register(r'login', LoginViewSet, 'login')

urlpatterns = [
	#    user profile crud
    path('regions', Region.as_view(), name='regionlist'),
    path('', views.welcome, name='welocome'),
    path('profilelist', UserProfileList.as_view(), name='profilelist'),
    path('profiledetail/<int:pk>/', UserProfileDetail.as_view(), name='profiledetail'),
    path('profiledetail/<int:pk>/edit', UserProfileUpdate.as_view(), name='profileupdate'),
    path('profiledetail/<int:pk>/delete', UserProfileDelete.as_view(), name='profiledelete'),
    path('profilecreate', UserProfileCreate.as_view(), name='profilecreate'),


    #    user  crud
    path('userdetail', UserList.as_view(), name='userlist'),
    path('userdetail/<int:pk>/', UserDetail.as_view(), name='userdetail'),
    path('userdetail/<int:pk>/edit', UserUpdate.as_view(), name='userupdate'),
    path('userdetail/<int:pk>/delete', UserDelete.as_view(), name='userdelete'),
    path('usercreate', UserCreate.as_view(), name='usercreate'),


   #    login
    path('login', views.login, name='logins'),
    # path('logout', Logout.as_view(), name='logout'),
    path('logout', views.logout_user, name='logout'),
    #path('logins', LoginAPIView.as_view(), name='log'),

       # events  crud
    path('eventdetail', EventsList.as_view(), name='userlist'),
    path('eventdetail/<int:pk>/', EventsDetail.as_view(), name='eventdetail'),
    path('eventdetail/<int:pk>/edit', EventsUpdate.as_view(), name='eventupdate'),
    path('eventdetail/<int:pk>/delete', EventsDelete.as_view(), name='eventdelete'),
    path('eventcreate', EventsCreate.as_view(), name='eventcreate'),


    #    news  crud
    path('newsdetail', NewsList.as_view(), name='newslist'),
    path('newsdetail/<int:pk>/', NewsDetail.as_view(), name='newsdetail'),
    path('newsdetail/<int:pk>/edit', NewsUpdate.as_view(), name='newsupdate'),
    path('newsdetail/<int:pk>/delete', NewsDelete.as_view(), name='newsdelete'),
    path('newscreate', NewCreate.as_view(), name='newscreate'),


    #    jobs  crud
    path('jobdetail', JobsList.as_view(), name='joblist'),
    # path('jobdetail/<int:pk>/', JobsDetail.as_view(), name='jobdetail'),
    # path('jobdetail/<int:pk>/edit', JobsUpdate.as_view(), name='jobupdate'),
    path('jobdetail/<int:pk>/delete', JobsDelete.as_view(), name='jobdelete'),
    path('jobcreate', JobsCreate.as_view(), name='jobcreate'),


    # # get all from users to jobs to news
    path('alldata', UserDetailViewList.as_view(), name='alldata'),
    path('alldata/<int:pk>', UserDetailViewDetail.as_view(), name='adddatadetail'),


    ###       new urls upon update
    path('verifyemail', views.get_profile, name='verifyemail'),
    path('userPR', UserAndProfileCreate.as_view(), name='userPR'),
    path('useredit/<int:pk>/', UserAndProfileUpdate.as_view(), name='useredit'),
    path('verifycode', views.VerifyUserCode.as_view(), name='verifycode'),
    path('statistics', views.statistics, name='statistics'),
    path('tokenvalidate', views.tokenValidate, name='tokenvalidate'),
    path('jobdetail/<int:pk>/', views.fetch_jobs, name='alljobs'),
    path('jobdetail/<int:pk>/update', UpdateJobs.as_view(), name='jobupdate'),
    path('useredit/<int:pk>/updatepassword', updatePassword.as_view(), name='updatepassword'),
    path('sendcode', views.SendUserCode.as_view(), name='sendcode'),
    path('imageupload', ImageUpload.as_view(), name='imageupload'),
    path('imageupload/<int:pk>', ImageUpload.as_view(), name='imageupload'),



] 