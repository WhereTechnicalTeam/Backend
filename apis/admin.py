from django.contrib import admin
from .models import *
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import User
# Register your models here.

class DistrictFkNEW(admin.TabularInline):
	model = District
	extra = 0


class JobFK(admin.TabularInline):
	model = JobInfo
	extra = 0


class RegionsAdmin(admin.ModelAdmin):
	list_display = ['id', 'region_name']
	list_filter = ['region_name']
	search_fields = ['region_name']
	ordering = ('id',)

	can_delete = False
	inlines =[DistrictFkNEW, JobFK]

	
class DistrictsAdmin(admin.ModelAdmin):
	list_display = ['id', 'district_name']
	list_filter = ['district_name']
	search_fields = ['district_name']
	ordering = ('id',)

	can_delete = False
	inlines =[JobFK]



class UserProfileAdmin(admin.ModelAdmin):
	list_display = ['id', 'title', 'surname', 'firstname', 'status', 'sex', '_phone1', 'is_trained_frontline', 'cohort_number_frontline', 'yr_completed_frontline', 'institution_enrolled_at_frontline',
	 'job_title_at_enroll_frontline', 'is_trained_intermediate', 'cohort_number_intermediate', 'yr_completed_intermediate', 'institution_enrolled_at_intermediate', 'job_title_at_enroll_intermediate', 
	 'is_trained_advanced', 'cohort_number_advanced', 'yr_completed_advanced', 'institution_enrolled_at_advanced', 'job_title_at_enroll_advanced', 'created_at', 'updated_at']
	list_filter = ['_title']
	search_fields = ['title', 'surname', 'firstname',]
	ordering = ('id',)

	inlines =[JobFK]


class JobInfoAdmin(admin.ModelAdmin):
	list_display = ['id', 'current_institution', 'job_title', 'region_id', 'district_id', 'level_of_health_system', 'employment_status', 'is_current', 'created_at', 'updated_at']
	list_filter = ['_job_title']
	search_fields = ['job_title', 'level_of_health_system',]
	ordering = ('id',)


class LevelOfHealthSystemAdmin(admin.ModelAdmin):
	list_display = ['id', 'level']
	list_filter = ['level']
	search_fields = ['level']
	ordering = ('id',)

	can_delete = False
	inlines =[JobFK]


class NewsAdmin(admin.ModelAdmin):
	list_display = ['id', 'title', 'content',  'created_at', 'updated_at']
	list_filter = ['title']
	search_fields = ['title']
	ordering = ('id',)

	can_delete = False
	# inlines =[JobFK]


class EventsAdmin(admin.ModelAdmin):
	list_display = ['id', 'title', 'schedule', 'description', 'created_at', 'updated_at']
	list_filter = ['title']
	search_fields = ['title']
	ordering = ('id',)
	can_delete = False


class ContactUsAdmin(admin.ModelAdmin):
	list_display = ['name', 'email', 'number', 'messasge',  'created_at']
	list_filter = ['name', 'email']
	search_fields = ['name', 'email']
	ordering = ('id',)





admin.site.register(Region, RegionsAdmin)
admin.site.register(District, DistrictsAdmin)
admin.site.register(UserProfile, UserProfileAdmin)
admin.site.register(JobInfo, JobInfoAdmin)
admin.site.register(LevelOfHealthSystem, LevelOfHealthSystemAdmin)
admin.site.register(New, NewsAdmin)
admin.site.register(Event, EventsAdmin)
admin.site.register(contactUs, ContactUsAdmin)