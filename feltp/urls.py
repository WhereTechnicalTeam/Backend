from django.urls import path
from djgeojson.views import GeoJSONLayerView
from . import views


# app_name = 'feltp'

urlpatterns = [
    # path('', views.index, name='home'),
    path('', views.newMap, name='newMap'),
    path('newedituser/<int:obj_id>', views.newedit_user, name='newedituser'),
    path('newsfeed', views.newsfeed, name='newsfeed'),
    path('newsfeed/<int:obj_id>/', views.newsfeed_detail, name='newsfeed'),
    path('createuser', views.createUser, name='createuser'),
    path('jobsedit/<int:obj_id>', views.jobsedit, name='jobsedit'),
    path('verifyCode', views.verifyCode, name='verifyCode'),
    path('resendCode', views.resendCode, name='resendCode'),


    path('news', views.news, name='news'),
    path('edituser/<int:obj_id>', views.edit_user, name='edituser'),
    path('events', views.events, name='events'),
    path('fetchprofile', views.fetch_profile, name='fetchprofile'),
    path('profilesearchquery', views.profile_search_query, name='profilesearchquery'),
    path('districtSelectOption', views.districtSelectOption, name='districtSelectOption'),
    path('jobsjson', views.jobsLayer.as_view(), name='jobsjson'),
    path('queryjson', views.queryjson, name='queryjson'),
    path('detailevent/<int:obj_id>/', views.event_detail, name='detailevent'),
    path('detailnews/<int:obj_id>/', views.news_detail, name='detailnews'),
    path('contactus', views.contactus, name='contactus'),

    path('login_view', views.login_view, name='login_view'),
    path('login/', views.loginPage, name='login'),
    path('logout_view', views.logout_view, name='logout_view'),
    path('forgotpassword', views.forgot_password, name='forgotpassword'),
    path('passwordreset', views.password_reset, name='passwordreset'),
    
    path('admindashboard', views.admin_dashboard, name='admindashboard'),
    path('admin_alumni', views.admin_alumni, name='admin_alumni'),
    path('admincreateevent', views.admin_create_event, name='admin_create_event'),
    path('admincreategallery', views.admin_create_gallery, name='admin_create_gallery'),
    path('admincreatenews', views.admin_create_news, name='admin_create_news'),
    path('adminevent', views.admin_eventlist, name='admin_eventlist'),
    path('admingallery', views.admin_gallerylist, name='admin_gallerylist'),
    path('adminmap', views.admin_mapview, name='admin_mapview'),
    path('adminnews', views.admin_newslist, name='admin_newslist'),
    path('stats', views.stats, name='stats'),
    path('statsdetail', views.cohorts, name='statsdetail'),
    path('setstatus', views.setstatus, name='setstatus'),

    path('eventdetail/<int:obj_id>/', views.admin_eventdetail, name='eventdetail'),
    path('newsdetail/<int:obj_id>/', views.admin_newsdetail, name='newsdetail'),
    path('gallerydetail/<int:obj_id>/', views.admin_gallerydetail, name='gallerydetail'),

    path('eventdetail/<int:obj_id>/edit', views.admin_edit_event, name='eventdetail'),
    path('newsdetail/<int:obj_id>/edit', views.admin_edit_news, name='newsdetail'),
    path('gallerydetail/<int:obj_id>/edit', views.admin_edit_gallery, name='gallerydetail'),

    path('eventdetail/<int:obj_id>/delete', views.eventdelete, name='eventdetail'),
    path('newsdetail/<int:obj_id>/delete', views.newsdelete, name='newsdetail'),
    path('gallerydetail/<int:obj_id>/delete', views.gallerydelete, name='gallerydetail'),
    path('deleteuser/<int:obj_id>', views.deleteuser, name='deleteuser'),

]