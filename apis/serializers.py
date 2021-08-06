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
    class Meta:
        model = JobInfo
        fields = ['current_institution', 'job_title', 'region', 'district', 'level_of_health_system', 'employment_status',
        'is_current', 'longitude', 'latitude', 'created_at', 'updated_at']


class NewsSerializer(serializers.ModelSerializer):
    class Meta:
        model = New
        fields = ['id', 'title', 'content', 'picture1', 'picture2', 'picture3']
            


class UserProfileSerializer(serializers.ModelSerializer):
    # job_to_profile = JobInfoSerializer(many=True, read_only=True)
    # news_to_profile = NewsSerializer(many=True, read_only=True)


    class Meta:
        model = UserProfile
        fields = ['user', 'title', 'surname', 'firstname', 'sex', 'phone1', 'is_trained_frontline', 'cohort_number_frontline', 'yr_completed_frontline', 
        'institution_enrolled_at_frontline', 'job_title_at_enroll_frontline', 'is_trained_intermediate', 'cohort_number_intermediate', 'yr_completed_intermediate', 
        'institution_enrolled_at_intermediate', 'job_title_at_enroll_intermediate', 'is_trained_advanced', 'cohort_number_advanced', 'yr_completed_advanced', 
        'institution_enrolled_at_advanced', 'image', 'email_status', 'job_title_at_enroll_advanced']




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
        fields = ('email', 'password', 'confirm')
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
        raise ValidationError('Passwords must match')
        return validated_data




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



'''We want to ensure that tokens are created when user is created in UserCreate view, so we update the UserSerializer. Change your serializers.py like this'''






















class UserDetailSerializer(serializers.ModelSerializer):
    main_user = UserProfileSerializer(read_only=True)
    job_to_user = JobInfoSerializer(many=True, read_only=True)
    news_to_user = NewsSerializer(many=True, read_only=True)

    class Meta:
        model = User
        fields = ('username', 'email', 'password', 'main_user', 'job_to_user', 'news_to_user')
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

    def validate(self, data):
        email = data.get('email')
        password = data.get('password')

        if email and password:
            user = authenticate(username=email, password=password)

            if not user:
                msg = _('Unable to log in with provided credentials.')
                raise serializers.ValidationError({'status':'400', 'msg':'Unable to log in with provided credentials.'})
        else:
            msg = _( 'Must include "username" and "password".')
            raise serializers.ValidationError({'status':'401', 'msg':'You are not authorised yet.'})
            # raise serializers.ValidationError(msg, code='authorization')

        data['user'] = user
        return data



class UserAndProfileSerializer(serializers.ModelSerializer):
    
    main_user = UserProfileSerializer()
    job_to_user = JobInfoSerializer()
    cpassword = serializers.CharField(
        label=_("Confirm password"),
        style={'input_type': 'password'},
        trim_whitespace=False,
        max_length=128,
        write_only=True
    )



    class Meta:
        model = User
        fields = ('email', 'password', 'cpassword', 'main_user', 'job_to_user')
        extra_kwargs = {'password': {'write_only': True}}

    def create(self, validated_data):
        if validated_data['password'] != validated_data['cpassword']:
            msg = ('Passwords are not the same')
            raise serializers.ValidationError(msg)

        user = User(
            email=validated_data['email'],
            username=validated_data['email']
        )
        user.set_password(validated_data['password'])
        user.save()

        prof = UserProfile.objects.create(**validated_data['main_user'])
        prof.user = user
        prof.save()

        job = JobInfo.objects.create(**validated_data['job_to_user'])
        job.user = user
        job.user_profile = prof
        job.save()

        user.first_name = prof.firstname
        user.last_name = prof.surname
        user.save()

        # Token.objects.create(user=user)
        created = verificationTbl.objects.create(email=validated_data['email'], code=codes())
        try:
            send_mail('Your Verifcation Code',
                """Your verifcation code is """+created.code+""" .""", 'wheregeospatialnoreply@gmail.com', [validated_data['email']],)
            #return Response({"email_status": prof.email_status, "code":"A verification code has been sent to your email", "profile":model_to_dict(profile), "status":status.HTTP_200_OK})
        except Exception as e:
            print(e)
            return Response("Could not send info to email, an error occured. Contact admin for verification.", status=status.HTTP_400_BAD_REQUEST)
        return (user)



# ###########     update the profile all
class UpdateProfileSerializer(serializers.ModelSerializer):
    job_to_user = JobInfoSerializer(many=True)
    main_user = UserProfileSerializer()
    news_to_user = NewsSerializer(many=True)


    class Meta:
        model = User
        fields = ('main_user', 'job_to_user', 'news_to_user')

    def update(self, instance, validated_data):
        job = validated_data.pop('job_to_user')
        main = validated_data.pop('main_user')
        news = validated_data.pop('news_to_user')

        profile = instance.main_user
        jobs_data1 = instance.job_to_user.all()
        news_data1 = instance.news_to_user.all()

        jobs_data1 = list(jobs_data1)

        
        profile.title = validated_data.get('title', profile.title)
        profile.surname = validated_data.get('surname', profile.surname)
        profile.firstname = validated_data.get('firstname', profile.firstname)
        profile.sex = validated_data.get('sex', profile.sex)
        profile.date_of_birth = validated_data.get('date_of_birth', profile.date_of_birth)
        profile.phone1 = validated_data.get('phone1', profile.phone1)
        profile.phone2 = validated_data.get('phone2', profile.phone2)
        profile.is_trained_frontline = validated_data.get('is_trained_frontline', profile.is_trained_frontline)
        profile.cohort_number_frontline = validated_data.get('cohort_number_frontline', profile.cohort_number_frontline)
        profile.yr_completed_frontline = validated_data.get('yr_completed_frontline', profile.yr_completed_frontline)
        profile.institution_enrolled_at_frontline = validated_data.get('institution_enrolled_at_frontline', profile.institution_enrolled_at_frontline)
        profile.job_title_at_enroll_frontline = validated_data.get('job_title_at_enroll_frontline', profile.job_title_at_enroll_frontline)
        profile.is_trained_intermediate = validated_data.get('is_trained_intermediate', profile.is_trained_intermediate)
        profile.cohort_number_intermediate = validated_data.get('cohort_number_intermediate', profile.cohort_number_intermediate)
        profile.yr_completed_intermediate = validated_data.get('yr_completed_intermediate', profile.yr_completed_intermediate)
        profile.institution_enrolled_at_intermediate = validated_data.get('institution_enrolled_at_intermediate', profile.institution_enrolled_at_intermediate)
        profile.job_title_at_enroll_intermediate = validated_data.get('job_title_at_enroll_intermediate', profile.job_title_at_enroll_intermediate)
        profile.is_trained_advanced = validated_data.get('is_trained_advanced', profile.is_trained_advanced)
        profile.cohort_number_advanced = validated_data.get('cohort_number_advanced', profile.cohort_number_advanced)
        profile.yr_completed_advanced = validated_data.get('yr_completed_advanced', profile.yr_completed_advanced)
        profile.institution_enrolled_at_advanced = validated_data.get('institution_enrolled_at_advanced', profile.institution_enrolled_at_advanced)
        profile.job_title_at_enroll_advanced = validated_data.get('job_title_at_enroll_advanced', profile.job_title_at_enroll_advanced)
        profile.image = validated_data.get('image', profile.image)
        profile.save()

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

        for info in news_data1:
            news1 = news_data1.pop(0)
            news1.title = info.get('title', news1.title)
            news1.content = info.get('content', news1.content)
            news1.picture1 = info.get('picture1', news1.picture1)
            news1.picture2 = info.get('picture2', news1.picture2)
            news1.save()


        return instance