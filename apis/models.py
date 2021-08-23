from django.db import models
from django.contrib.auth import get_user_model
from django.contrib.auth.models import User
from django.contrib.postgres.fields import ArrayField
from django.db.models.signals import post_save
from django.dispatch import receiver



REGIONS = (
    ("AHAFO", "AHAFO"),
    ("ASHANTI", "ASHANTI"),
    ("BONO", "BONO"),
    ("BONO EAST", "BONO EAST"),
    ("CENTRAL", "CENTRAL"),
    ("EASTERN", "EASTERN"),
    ("GREATER ACCRA", "GREATER ACCRA"),
    ("NORTH EAST", "NORTH EAST"),
    ("NORTHERN", "NORTHERN"),
    ("OTI", "OTI"),
    ("SAVANNAH", "SAVANNAH"),
    ("UPPER EAST", "UPPER EAST"),
    ("UPPER WEST", "UPPER WEST"),
    ("VOLTA", "VOLTA"),
    ("WESTERN", "WESTERN"),
    ("WESTERN NORTH", "WESTERN NORTH"),
)


STATUS = (
    ("pending approval", "pending approval"),
    ("approved", "approved"),
    ("registered", "registered"),
    )


CURRENT = (
    ("Yes", "Yes"),
    ("No", "No")
    )


STATE = (
    ("used", "used"),
    ("unused", "unused")
    )




User._meta.get_field('email')._unique = True


class Region(models.Model):
    # id = models.IntegerField(primary_key=True)
    region_name = models.CharField(max_length=100, blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'region'

    def __str__(self):
        return self.region_name



class District(models.Model):
    # id = models.IntegerField(primary_key=True)
    region = models.ForeignKey(Region, on_delete=models.CASCADE, null=True, related_name='region_district')
    district_name = models.CharField(max_length=100, blank=True, null=True)

    class Meta: 
        managed = True
        db_table = 'district'

    def __str__(self):
        return self.district_name



class UserProfile(models.Model):
    # id = models.IntegerField(primary_key=True)
    user = models.OneToOneField(User, related_name='main_user', on_delete=models.CASCADE, null=True)
    _title = models.CharField(max_length=10, blank=True, null=True, default=None, db_column='title')
    _surname = models.CharField(max_length=50, default=None, db_column='surname')
    _firstname = models.CharField(max_length=50, default=None, db_column='firstname')
    _sex = models.CharField(max_length=50, default=None, db_column='sex')
    date_of_birth = models.DateField(blank=True, null=True, default=None)
    _phone1 = models.CharField(max_length=13, blank=True, null=True, default=None, db_column='phone1')
    _phone2 = models.CharField(max_length=13, blank=True, null=True, default=None, db_column='phone2')
    is_trained_frontline = models.CharField(max_length=5, blank=True, null=True, choices=CURRENT, default=None)
    cohort_number_frontline = models.IntegerField(blank=True, null=True, default=None)
    yr_completed_frontline = models.DateField(blank=True, null=True, default=None)
    _institution_enrolled_at_frontline = models.CharField(max_length=100, blank=True, null=True, default=None, db_column='institution_enrolled_at_frontline')
    _job_title_at_enroll_frontline = models.CharField(db_column='job_title_at_enroll_frontline', max_length=100, blank=True, null=True, default=None)
    is_trained_intermediate = models.CharField(max_length=5, blank=True, null=True, choices=CURRENT, default=None)
    cohort_number_intermediate = models.IntegerField(blank=True, null=True, default=None)
    yr_completed_intermediate = models.DateField(blank=True, null=True, default=None)
    _institution_enrolled_at_intermediate = models.CharField(db_column='institution__enrolled_at_intermediate', max_length=100, blank=True, null=True, default=None)  # Field renamed because it contained more than one '_' in a row.
    _job_title_at_enroll_intermediate = models.CharField(db_column='job_title_at_enroll_intermediate', max_length=100, blank=True, null=True, default=None)
    is_trained_advanced = models.CharField(max_length=5, blank=True, null=True, choices=CURRENT, default=None)
    cohort_number_advanced = models.IntegerField(blank=True, null=True, default=None)
    yr_completed_advanced = models.DateField(blank=True, null=True, default=None)
    _institution_enrolled_at_advanced = models.CharField(max_length=100, blank=True, null=True, default=None, db_column='institution_enrolled_at_advanced')
    _job_title_at_enroll_advanced = models.CharField(db_column='job_title_at_enroll_advanced', max_length=100, blank=True, null=True, default=None)
    status = models.CharField(max_length=20, choices=STATUS, default='pending approval')
    email_status = models.CharField(max_length=100, blank=True, null=True, default='not verified')
    image = models.ImageField(upload_to='api_images/profile/', blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    # slug = models.SlugField(max_length = 200, null=True)

    class Meta:
        managed = True
        db_table = 'userprofile'

    def __str__(self):
        return '{} {}'.format(self.firstname, self.surname)


    @property
    def title(self):
        if self._title == "":
            self._title = None
            return self._title 
        return self._title 

    @property
    def surname(self):
        if self._surname == "":
            self._surname = None
            return self._surname 
        return self._surname 


    @property
    def firstname(self):
        if self._firstname == "":
            self._firstname = None
            return self._firstname 
        return self._firstname 


    @property
    def sex(self):
        if self._sex == "":
            self._sex = None
            return self._sex 
        return self._sex 


    @property
    def phone1(self):
        if self._phone1 == "":
            self._phone1 = None
            return self._phone1 
        return self._phone1 

    @property
    def phone2(self):
        if self._phone2 == "":
            self._phone2 = None
            return self._phone2 
        return self._phone2 


    @property
    def institution_enrolled_at_frontline(self):
        if self._institution_enrolled_at_frontline == "":
            self._institution_enrolled_at_frontline = None
            return self._institution_enrolled_at_frontline 
        return self._institution_enrolled_at_frontline 


    @property
    def job_title_at_enroll_frontline(self):
        if self._job_title_at_enroll_frontline == "":
            self._job_title_at_enroll_frontline = None
            return self._job_title_at_enroll_frontline 
        return self._job_title_at_enroll_frontline 


    @property
    def institution_enrolled_at_intermediate(self):
        if self._institution_enrolled_at_intermediate == "":
            self._institution_enrolled_at_intermediate = None
            return self._institution_enrolled_at_intermediate 
        return self._institution_enrolled_at_intermediate 


    @property
    def job_title_at_enroll_intermediate(self):
        if self._job_title_at_enroll_intermediate == "":
            self._job_title_at_enroll_intermediate = None
            return self._job_title_at_enroll_intermediate 
        return self._job_title_at_enroll_intermediate 


    @property
    def institution_enrolled_at_advanced(self):
        if self._institution_enrolled_at_advanced == "":
            self._institution_enrolled_at_advanced = None
            return self._institution_enrolled_at_advanced 
        return self._institution_enrolled_at_advanced 


    @property
    def job_title_at_enroll_advanced(self):
        if self._job_title_at_enroll_advanced == "":
            self._job_title_at_enroll_advanced = None
            return self._job_title_at_enroll_advanced 
        return self._job_title_at_enroll_advanced 

    # @property
    # def phone2(self):
    #     if self._phone2 == "":
    #         self._phone2 = None
    #         return self._phone2 
    #     return self._phone2 



class LevelOfHealthSystem(models.Model):
    # id = models.IntegerField(primary_key=True)
    level = models.CharField(max_length=100, blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'level_of_health_system'


    def __str__(self):
        return str(self.level)




class JobInfo(models.Model):
    # id = models.IntegerField(primary_key=True)
    user_profile = models.ForeignKey(UserProfile, on_delete=models.CASCADE, null=True, related_name='job_to_profile')
    user = models.ForeignKey(User, on_delete=models.CASCADE, null=True, related_name='job_to_user')
    _current_institution = models.CharField(max_length=100, blank=True, null=True, default=None, db_column='current_institution')
    _job_title = models.CharField(max_length=100, blank=True, null=True, default=None, db_column='job_title')
    region = models.ForeignKey(Region, on_delete=models.CASCADE, null=True)
    district = models.ForeignKey(District, on_delete=models.CASCADE, null=True)
    level_of_health_system = models.ForeignKey(LevelOfHealthSystem, on_delete=models.CASCADE, null=True)
    _employment_status = models.CharField(max_length=100, blank=True, null=True, default=None, db_column='employment_status')
    is_current = models.CharField(max_length=5,  default=None)
    longitude = models.FloatField(blank=True, null=True, default=None)
    latitude = models.FloatField(blank=True, null=True, default=None)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    # job_slug = models.SlugField(max_length = 200, null=True)

    class Meta:
        managed = True
        db_table = 'jobinfo'


    def __str__(self):
        return str(self.current_institution)


    @property
    def job_title(self):
        if self._job_title == "":
            self._job_title = None
            return self._job_title 
        return self._job_title 

    @property
    def employment_status(self):
        if self._employment_status == "":
            self._employment_status = None
            return self._employment_status 
        return self._employment_status 


    @property
    def current_institution(self):
        if self._current_institution == "":
            self._current_institution = None
            return self._current_institution 
        return self._current_institution 


    # @my_date.setter
    # def my_date(self, value):
    #     if value > datetime.date.today():
    #         logger.warning("The date chosen was in the future.")
    #     self._my_date = value 


    # @receiver(post_save, sender=UserProfile)
    # def create_user_profile(sender, instance, created, **kwargs):
    #     if created:
    #         JobInfo.objects.create(userprofile=instance)

    # @receiver(post_save, sender=UserProfile)
    # def save_user_profile(sender, instance, **kwargs):
    #     instance.jobinfo.save()




class New(models.Model):
    # id = models.IntegerField(primary_key=True)
    user_profile = models.ForeignKey(UserProfile, on_delete=models.CASCADE, null=True, related_name='news_to_profile')
    user = models.ForeignKey(User, on_delete=models.CASCADE, null=True, related_name='news_to_user')
    title = models.CharField(max_length=500, blank=True, null=True, default=None)
    content = models.CharField(max_length=1000, blank=True, null=True, default=None)
    # picture_array = ArrayField(models.CharField(max_length=200, blank=True, null=True), blank=True, null=True)
    picture1 = models.ImageField(upload_to='api_images/news/', blank=True, null=True)
    picture2 = models.ImageField(upload_to='api_images/news/', blank=True, null=True)
    picture3 = models.ImageField(upload_to='api_images/news/', blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    # news_slug = models.SlugField(max_length = 200, null=True)

    class Meta:
        managed = True
        db_table = 'news'


    def __str__(self):
        return str(self.content)


    # @receiver(post_save, sender=UserProfile)
    # def create_user_profile(sender, instance, created, **kwargs):
    #     if created:
    #         New.objects.create(user=instance)

    # @receiver(post_save, sender=UserProfile)
    # def save_user_profile(sender, instance, **kwargs):
    #     instance.news.save()



class Event(models.Model):
    # id = models.IntegerField(primary_key=True)
    title = models.CharField(max_length=100, blank=True, null=True, default=None)
    schedule = models.DateField(blank=True, null=True, default=None)
    description = models.CharField(max_length=500, blank=True, null=True, default=None)
    created_at = models.DateTimeField(auto_now_add=True)
    picture = models.ImageField(upload_to='api_images/events/', blank=True, null=True)
    updated_at = models.DateTimeField(auto_now=True)
    # event_slug = models.SlugField(max_length = 200, null=True)


    def __str__(self):
        return str(self.schedule)



def create_slug(model, instance, column_name, new_slug=None):
    slug = slugify(instance.column_name)
    if new_slug is not None:
        slug = new_slug
    queryset = model.objects.filter(slug=slug).order_by('id')
    exists = queryset.exists()
    if exists:
        new_slug = '%s-%s' %(slug, queryset.first().id)
        return create_slug(instance, news_slug=new_slug)
    return slug



class verificationTbl(models.Model):
    email = models.EmailField()
    code = models.CharField(max_length=7, blank=True, null=True)
    status = models.CharField(max_length=10, choices=STATE, default="unused")
    created_at = models.DateTimeField(auto_now_add=True)
    user = models.ForeignKey(User, related_name='verify_user', on_delete=models.CASCADE, null=True)



class Gallery(models.Model):
    title = models.CharField(max_length=100, blank=True, null=True, default=None)
    picture = models.ImageField(upload_to='api_images/gallery/', blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)




class contactUs(models.Model):
    name = models.CharField(max_length=50)
    email = models.EmailField()
    number = models.CharField(max_length=13)
    messasge = models.CharField(max_length=500)
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        managed = True
        db_table = 'contactus'
        verbose_name_plural = ' Contact Us'
