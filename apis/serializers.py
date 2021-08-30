from rest_framework.serializers import ModelSerializer
from .models import *
from rest_framework import serializers
from .models import *
from django.contrib.auth.models import User
# from rest_framework.authtoken.models import Token
from django.core.exceptions import PermissionDenied
from django.contrib.auth import authenticate, get_user_model
from django.utils.translation import ugettext_lazy as _
from rest_framework.response import Response
from rest_framework import status, filters

from rest_framework.exceptions import ValidationError
from django.core.mail import send_mail
from project.settings import EMAIL_HOST_USER
from django.http import HttpResponseRedirect, HttpResponse, JsonResponse
from random import choice
import random
from string import digits, ascii_letters
# from rest_framework.authentication import SessionAuthentication, BasicAuthentication 





# class CsrfExemptSessionAuthentication(SessionAuthentication):

#     def enforce_csrf(self, request):
#         return  



def codes(length=6):
    passW = ''
    for i in range(length):
        passW += random.choice(digits + ascii_letters)
    if verificationTbl.objects.filter(code=passW).exists():
        return codes()

    return passW



class DistrictSerializer(serializers.ModelSerializer):
    class Meta:
        model = District
        fields = '__all__'



class RegionSerializer(serializers.ModelSerializer):
    # region_district = DistrictSerializer(many=True)

    class Meta:
        model = Region
        fields = ['region_name']



class JobInfoSerializer(serializers.ModelSerializer):
    # region = serializers.SlugRelatedField(queryset=Region.objects.all(), slug_field='region_name')
    # district = serializers.SlugRelatedField(queryset=District.objects.all(), slug_field='district_name')
    # level_of_health_system = serializers.SlugRelatedField(queryset=LevelOfHealthSystem.objects.all(), slug_field='level')


    class Meta:
        model = JobInfo
        fields = ['id', 'current_institution', 'job_title', 'region', 'district', 'level_of_health_system', 'employment_status',
        'is_current', 'longitude', 'latitude', 'created_at', 'updated_at']


class NewsSerializer(serializers.ModelSerializer):
    class Meta:
        model = New
        fields = ['id', 'title', 'content', 'picture1', 'picture2', 'picture3']
            


class UserProfileSerializer(serializers.ModelSerializer):


    class Meta:
        model = UserProfile
        fields = ['id', 'title', 'surname', 'date_of_birth', 'firstname', 'sex', 'phone1', 'phone2', 'is_trained_frontline', 'cohort_number_frontline', 'yr_completed_frontline', 
        'institution_enrolled_at_frontline', 'job_title_at_enroll_frontline', 'is_trained_intermediate', 'cohort_number_intermediate', 'yr_completed_intermediate', 
        'institution_enrolled_at_intermediate', 'job_title_at_enroll_intermediate', 'is_trained_advanced', 'cohort_number_advanced', 'yr_completed_advanced', 
        'institution_enrolled_at_advanced', 'image', 'email_status', 'job_title_at_enroll_advanced', 'status']




class UpdateUserProfileSerializer(serializers.ModelSerializer):


    class Meta:
        model = UserProfile
        fields = ['id', 'title', 'surname', 'date_of_birth', 'firstname', 'sex', 'phone1', 'phone2', 'is_trained_frontline', 'cohort_number_frontline', 'yr_completed_frontline', 
        'institution_enrolled_at_frontline', 'job_title_at_enroll_frontline', 'is_trained_intermediate', 'cohort_number_intermediate', 'yr_completed_intermediate', 
        'institution_enrolled_at_intermediate', 'job_title_at_enroll_intermediate', 'is_trained_advanced', 'cohort_number_advanced', 'yr_completed_advanced', 
        'institution_enrolled_at_advanced', 'email_status', 'job_title_at_enroll_advanced', 'status']




class EventSerializer(serializers.ModelSerializer):
    class Meta:
        model = Event
        fields = '__all__'



class LevelOfHealthSystemSerializer(serializers.ModelSerializer):
    class Meta:
        model = LevelOfHealthSystem
        fields = '__all__'



'''We want to ensure that tokens are created when user is created in UserCreate view, so we update the UserSerializer. Change your serializers.py like this'''

class UserSerializer(serializers.ModelSerializer):
    confirm = serializers.CharField(
        label=_("Confirm password"),
        style={'input_type': 'password'},
        trim_whitespace=False,
        max_length=128,
        write_only=True
    )

    class Meta:
        model = User
        fields = ('id', 'email', 'password', 'confirm')
        extra_kwargs = {'password': {'write_only': True}}

    def create(self, validated_data):
        confirm = validated_data['confirm']
        if confirm == validated_data['password']:

            user = User(
                email=validated_data['email'],
                username=validated_data['email']
            )
            user.set_password(validated_data['password'])
            user.save()
            # Token.objects.create(user=user)
            return user
        raise ValidationError({"msg":'Passwords must match'})
        # return validated_data




# //////////////////////    detail view serializers
class RegionDetailSerializer(serializers.ModelSerializer):
    region_district = DistrictSerializer(many=True, read_only=True)

    class Meta:
        model = Region
        fields = ['region_name', 'region_district']



# //////////////////////   verification serializers
class VerificationSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = verificationTbl
        fields = ['email']











class UserDetailSerializer(serializers.ModelSerializer):
    main_user = UserProfileSerializer(read_only=True)
    job_to_user = JobInfoSerializer(many=True, read_only=True)
    news_to_user = NewsSerializer(many=True, read_only=True)

    class Meta:
        model = User
        fields = ('id', 'username', 'email', 'password', 'main_user', 'job_to_user', 'news_to_user')
        extra_kwargs = {'password': {'write_only': True}}

    def create(self, validated_data):
        user = User(
            email=validated_data['email'],
            username=validated_data['email']
        )
        user.set_password(validated_data['password'])
        user.save()
        # Token.objects.create(user=user)
        return user



class LoginSerializers(serializers.Serializer):

    email = serializers.CharField(max_length=255)
    password = serializers.CharField(
        label=_("Password"),
        style={'input_type': 'password'},
        trim_whitespace=False,
        max_length=128,
        write_only=True
    )

    main_user = UserProfileSerializer(read_only=True)
    job_to_user = JobInfoSerializer(read_only=True, many=True)

    class Meta:
        model = User
        fields = ('id', 'username', 'email', 'password', 'main_user', 'job_to_user')
        extra_kwargs = {'password': {'write_only': True}}




class AlldataSerializer(serializers.ModelSerializer):
    
    main_user = UserProfileSerializer(read_only=True)
    job_to_user = JobInfoSerializer(read_only=True)

    class Meta:
        model = User
        fields = ('id', 'email', 'main_user', 'job_to_user')
        extra_kwargs = {'password': {'write_only': True}}




class UserAndProfileSerializer(serializers.ModelSerializer):
    
    main_user = UserProfileSerializer(write_only=True)
    job_to_user = JobInfoSerializer(write_only=True, many=True)
    cpassword = serializers.CharField(
        label=_("Confirm password"),
        style={'input_type': 'password'},
        trim_whitespace=False,
        max_length=128,
        write_only=True
    )

    class Meta:
        model = User
        fields = ('id', 'email', 'password', 'cpassword', 'main_user', 'job_to_user')
        extra_kwargs = {'password': {'write_only': True}}

    def create(self, validated_data):
        if validated_data['password'] != validated_data['cpassword']:
            msg = ({"msg":'Passwords are not the same'})
            raise serializers.ValidationError(msg)

        if User.objects.filter(email__contains=validated_data['email']).exists():
            raise serializers.ValidationError({"status":400, "msg":'email already exists'})
       
        if validated_data['main_user']['surname'] == '':
            raise serializers.ValidationError({"status":400, "msg":'fill surname'})

        if validated_data['main_user']['firstname'] == '':
            raise serializers.ValidationError({"status":400, "msg":'fill firstname'})

        if validated_data['main_user']['sex'] == '':
            raise serializers.ValidationError({"status":400, "msg":'fill sex'})


       
        if validated_data['main_user']['title'] == '':
            validated_data['main_user']['title'] = None

        if validated_data['main_user']['phone1'] == '':
            validated_data['main_user']['phone1'] = None

        if validated_data['main_user']['institution_enrolled_at_frontline'] == '':
            validated_data['main_user']['institution_enrolled_at_frontline'] = None

        if validated_data['main_user']['job_title_at_enroll_frontline'] == '':
            validated_data['main_user']['job_title_at_enroll_frontline'] = None

        if validated_data['main_user']['institution_enrolled_at_intermediate'] == '':
            validated_data['main_user']['institution_enrolled_at_intermediate'] = None

        if validated_data['main_user']['job_title_at_enroll_intermediate'] == '':
            validated_data['main_user']['job_title_at_enroll_intermediate'] = None

        if validated_data['main_user']['institution_enrolled_at_advanced'] == '':
            validated_data['main_user']['institution_enrolled_at_advanced'] = None

        if validated_data['main_user']['job_title_at_enroll_advanced'] == '':
            validated_data['main_user']['job_title_at_enroll_advanced'] = None

        if validated_data['main_user']['image'] == '':
            validated_data['main_user']['image'] = None


        for a in range(len(validated_data['job_to_user'])):

            if validated_data['job_to_user'][a]['is_current'] == '':
                validated_data['job_to_user'][a]['is_current'] = None

            if validated_data['job_to_user'][a]['current_institution'] == '':
                validated_data['job_to_user'][a]['current_institution'] = None

            if validated_data['job_to_user'][a]['job_title'] == '':
                validated_data['job_to_user'][a]['job_title'] = None

            if validated_data['job_to_user'][a]['employment_status'] == '':
                validated_data['job_to_user'][a]['employment_status'] = None


        user = User(
            email=validated_data['email'],
            username=validated_data['email'],
            first_name=validated_data['main_user']['firstname'],
            last_name=validated_data['main_user']['surname']
        )
        user.set_password(validated_data['password'])


        user.save()

        prof = UserProfile.objects.create(**validated_data['main_user'])
        prof.user = user
        prof.save()


        job = validated_data.pop('job_to_user')

        if len(job) > 0:
            for datas in job:
                JobInfo.objects.create(
                    user_profile_id=prof.id,
                    user_id = user.id,
                    current_institution = datas.get('current_institution'),
                    job_title = datas.get('job_title'),
                    region = datas.get('region'),
                    district = datas.get('district'),
                    level_of_health_system = datas.get('level_of_health_system'),
                    employment_status = datas.get('employment_status'),
                    is_current = datas.get('is_current'),
                    longitude = datas.get('longitude'),
                    latitude = datas.get('latitude')
                    )

        else:
            new_job = JobInfo.objects.create(**job[0], user=user, user_profile_id=prof[0].id)
            

        created = verificationTbl.objects.create(email=validated_data['email'], code=codes())
        try:
            send_mail('Your Verifcation Code',
                """Your verifcation code is """+created.code+""" .""", 'wheregeospatialnoreply@gmail.com', [validated_data['email']],)
        except Exception as e:
            print(e)
            raise serializers.ValidationError({"msg":"Could not send info to email, an error occured. Contact admin for verification."})
        raise serializers.ValidationError({"status":200, "id":user.id, "email":user})
        #return user





# ###########     update the profile all
class UpdateProfileSerializer(serializers.ModelSerializer):
    job_to_user = JobInfoSerializer(many=True)
    main_user = UpdateUserProfileSerializer()

    password = serializers.CharField(
        label=_("password"),
        style={'input_type': 'password'},
        trim_whitespace=False,
        max_length=128,
        required=False,
        read_only=True
    )
    cpassword = serializers.CharField(
        label=_("Confirm password"),
        style={'input_type': 'password'},
        trim_whitespace=False,
        max_length=128,
        required=False,
        read_only=True
    )


    class Meta:
        model = User
        fields = ('id', 'email', 'password', 'cpassword', 'main_user', 'job_to_user')


    def update(self, instance, validated_data):

        # if validated_data['password'] == '':
        #     validated_data['password'] = 'None'

        # if validated_data['password'] == '':
        #     validated_data['password'] = 'None'


        job = validated_data.pop('job_to_user')
        main = validated_data.pop('main_user')
        # news = validated_data.pop('news_to_user')

        # profile = instance.main_user
        jobs_data1 = instance.job_to_user.all()
        news_data1 = instance.news_to_user.all()

        jobs_data1 = list(jobs_data1)
        # jobs_data1 = list(prof)

        user = User.objects.get(email=validated_data['email'])
        # print(user)

        if UserProfile.objects.filter(user_id=user.id).exists():
            prof = UserProfile.objects.filter(user_id=user.id).update(**main)
        else:
            prof = UserProfile.objects.filter(user_id=user.id).create(**main, user=user)
        # print(prof[0].id)



        if len(jobs_data1) > 0:
            for datas in job:
                jobs = jobs_data1.pop(0)
                jobs.current_institution = datas.get('current_institution', jobs.current_institution)
                jobs.job_title = datas.get('job_title', jobs.job_title)
                jobs.region = datas.get('region', jobs.region)
                jobs.district = datas.get('district', jobs.district)
                jobs.level_of_health_system = datas.get('level_of_health_system', jobs.level_of_health_system)
                jobs.employment_status = datas.get('employment_status', jobs.employment_status)
                jobs.is_current = datas.get('is_current', jobs.is_current)
                jobs.longitude = datas.get('longitude', jobs.longitude)
                jobs.latitude = datas.get('latitude', jobs.latitude)
                jobs.save()

        else:
            new_job = JobInfo.objects.create(**job[0], user=user, user_profile_id=prof[0].id)

        return user






class PasswordSerializer(serializers.ModelSerializer):
    confirm = serializers.CharField(
        label=_("Confirm password"),
        style={'input_type': 'password'},
        trim_whitespace=False,
        max_length=128,
        write_only=True
    )

    class Meta:
        model = User
        fields = ('id', 'email', 'password', 'confirm')
        extra_kwargs = {'password': {'write_only': True}}




class AllJobsSerializer(serializers.ModelSerializer):
    
    job_to_user = JobInfoSerializer(many=True)

    class Meta:
        model = User
        fields = ('id','email', 'job_to_user')

    def update(self, instance, validated_data):
        job = validated_data.pop('job_to_user')

        jobs_data1 = instance.job_to_user.all()

        jobs_data1 = list(jobs_data1)

        user = User.objects.get(email=validated_data['email'])
        # print(user)

        prof = None
        if UserProfile.objects.filter(user_id=user.id).exists():
            prof = UserProfile.objects.filter(user_id=user.id)


        if len(jobs_data1) > 0:
            for datas in job:
                jobs = jobs_data1.pop(0)
                jobs.current_institution = datas.get('current_institution', jobs.current_institution)
                jobs.job_title = datas.get('job_title', jobs.job_title)
                jobs.region = datas.get('region', jobs.region)
                jobs.district = datas.get('district', jobs.district)
                jobs.level_of_health_system = datas.get('level_of_health_system', jobs.level_of_health_system)
                jobs.employment_status = datas.get('employment_status', jobs.employment_status)
                jobs.is_current = datas.get('is_current', jobs.is_current)
                jobs.longitude = datas.get('longitude', jobs.longitude)
                jobs.latitude = datas.get('latitude', jobs.latitude)
                jobs.save()

        else:
            new_job = JobInfo.objects.filter(id=job['id']).update(**job[0], user=user, user_profile_id=prof[0].id)

        return user

