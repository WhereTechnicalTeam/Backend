from django.db import models
from django.contrib.auth import get_user_model
from django.contrib.auth.models import User
from django.contrib.postgres.fields import ArrayField
from django.db.models.signals import post_save
from django.dispatch import receiver



REGIONS = (
    ("1", "AHAFO"),
    ("2", "ASHANTI"),
    ("3", "BONO"),
    ("4", "BONO EAST"),
    ("5", "CENTRAL"),
    ("6", "EASTERN"),
    ("7", "GREATER ACCRA"),
    ("8", "NORTH EAST"),
    ("9", "NORTHERN"),
    ("10", "OTI"),
    ("11", "SAVANNAH"),
    ("12", "UPPER EAST"),
    ("13", "UPPER WEST"),
    ("14", "VOLTA"),
    ("15", "WESTERN"),
    ("16", "WESTERN NORTH"),
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
    title = models.CharField(max_length=10, blank=True, null=True)
    surname = models.CharField(max_length=50, blank=True, null=True)
    firstname = models.CharField(max_length=50, blank=True, null=True)
    sex = models.CharField(max_length=10, blank=True, null=True)
    date_of_birth = models.DateField(blank=True, null=True)
    phone1 = models.CharField(max_length=13, blank=True, null=True)
    phone2 = models.CharField(max_length=13, blank=True, null=True)
    is_trained_frontline = models.CharField(max_length=5, blank=True, null=True, choices=CURRENT)
    cohort_number_frontline = models.IntegerField(blank=True, null=True)
    yr_completed_frontline = models.DateField(blank=True, null=True)
    institution_enrolled_at_frontline = models.CharField(max_length=100, blank=True, null=True)
    job_title_at_enroll_frontline = models.CharField(max_length=100, blank=True, null=True)
    is_trained_intermediate = models.CharField(max_length=5, blank=True, null=True, choices=CURRENT)
    cohort_number_intermediate = models.IntegerField(blank=True, null=True)
    yr_completed_intermediate = models.DateField(blank=True, null=True)
    institution_enrolled_at_intermediate = models.CharField(db_column='institution__enrolled_at_intermediate', max_length=100, blank=True, null=True)  # Field renamed because it contained more than one '_' in a row.
    job_title_at_enroll_intermediate = models.CharField(max_length=100, blank=True, null=True)
    is_trained_advanced = models.CharField(max_length=5, blank=True, null=True, choices=CURRENT)
    cohort_number_advanced = models.IntegerField(blank=True, null=True)
    yr_completed_advanced = models.DateField(blank=True, null=True)
    institution_enrolled_at_advanced = models.CharField(max_length=100, blank=True, null=True)
    job_title_at_enroll_advanced = models.CharField(max_length=100, blank=True, null=True)
    status = models.CharField(max_length=20, choices=STATUS, default='pending approval')
    email_status = models.CharField(max_length=100, blank=True, null=True, default='not verified')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    # slug = models.SlugField(max_length = 200, null=True)

    class Meta:
        managed = True
        db_table = 'userprofile'

    def __str__(self):
        return '{} {}'.format(self.firstname, self.surname)




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
    current_institution = models.CharField(max_length=100, blank=True, null=True)
    job_title = models.CharField(max_length=100, blank=True, null=True)
    region = models.ForeignKey(Region, on_delete=models.CASCADE, null=True)
    district = models.ForeignKey(District, on_delete=models.CASCADE, null=True)
    level_of_health_system = models.ForeignKey(LevelOfHealthSystem, on_delete=models.CASCADE, null=True)
    employment_status = models.CharField(max_length=100, blank=True, null=True)
    is_current = models.CharField(max_length=5, choices=CURRENT, default="no")
    longitude = models.FloatField(blank=True, null=True)
    latitude = models.FloatField(blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    # job_slug = models.SlugField(max_length = 200, null=True)

    class Meta:
        managed = True
        db_table = 'jobinfo'


    def __str__(self):
        return str(self.current_institution)


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
    title = models.CharField(max_length=500, blank=True, null=True)
    content = models.CharField(max_length=1000, blank=True, null=True)
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
    title = models.CharField(max_length=100, blank=True, null=True)
    schedule = models.DateField(blank=True, null=True)
    description = models.CharField(max_length=500, blank=True, null=True)
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
    title = models.CharField(max_length=100, blank=True, null=True)
    picture = models.ImageField(upload_to='api_images/gallery/', blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)