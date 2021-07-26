from django.urls import path

from . import views


# app_name = 'feltp'

urlpatterns = [
    path('', views.index, name='home'),
    path('about', views.about, name='about'),
    path('news', views.news, name='news'),
    path('alumni', views.alumni, name='alumni'),
    path('login', views.login, name='login'),
    
    path('admindashnoard', views.admin_dashboard, name='admindashnoard'),
    path('admin_alumni', views.admin_alumni, name='admin_alumni'),
    path('admincreateevent', views.admin_create_event, name='admin_create_event'),
    path('admincreategallery', views.admin_create_gallery, name='admin_create_gallery'),
    path('admincreatenews', views.admin_create_news, name='admin_create_news'),
    path('adminevent', views.admin_eventlist, name='admin_eventlist'),
    path('admingallery', views.admin_gallerylist, name='admin_gallerylist'),
    path('adminmap', views.admin_mapview, name='admin_mapview'),
    path('adminnews', views.admin_newslist, name='admin_newslist'),

    path('eventdetail/<int:obj_id>/', views.admin_eventdetail, name='eventdetail'),
    path('newsdetail/<int:obj_id>/', views.admin_newsdetail, name='newsdetail'),
    path('gallerydetail/<int:obj_id>/', views.admin_gallerydetail, name='gallerydetail'),

    path('eventdetail/<int:obj_id>/edit', views.admin_edit_event, name='eventdetail'),
    path('newsdetail/<int:obj_id>/edit', views.admin_edit_news, name='newsdetail'),
    path('gallerydetail/<int:obj_id>/edit', views.admin_edit_gallery, name='gallerydetail'),

    path('eventdetail/<int:obj_id>/delete', views.eventdelete, name='eventdetail'),
    path('newsdetail/<int:obj_id>/delete', views.newsdelete, name='newsdetail'),
    path('gallerydetail/<int:obj_id>/delete', views.gallerydelete, name='gallerydetail'),
    
    path('alumnilist', views.aluminiListView.as_view(), name="alumnilist"),
]