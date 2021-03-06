# Generated by Django 2.2.24 on 2021-08-14 21:29

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('apis', '0006_auto_20210804_2257'),
    ]

    operations = [
        migrations.AlterField(
            model_name='event',
            name='description',
            field=models.CharField(blank=True, default=None, max_length=500, null=True),
        ),
        migrations.AlterField(
            model_name='event',
            name='schedule',
            field=models.DateField(blank=True, default=None, null=True),
        ),
        migrations.AlterField(
            model_name='event',
            name='title',
            field=models.CharField(blank=True, default=None, max_length=100, null=True),
        ),
        migrations.AlterField(
            model_name='gallery',
            name='title',
            field=models.CharField(blank=True, default=None, max_length=100, null=True),
        ),
        migrations.AlterField(
            model_name='jobinfo',
            name='current_institution',
            field=models.CharField(blank=True, default=None, max_length=100, null=True),
        ),
        migrations.AlterField(
            model_name='jobinfo',
            name='employment_status',
            field=models.CharField(blank=True, default=None, max_length=100, null=True),
        ),
        migrations.AlterField(
            model_name='jobinfo',
            name='is_current',
            field=models.CharField(choices=[('Yes', 'Yes'), ('No', 'No')], default=None, max_length=5),
        ),
        migrations.AlterField(
            model_name='jobinfo',
            name='job_title',
            field=models.CharField(blank=True, default=None, max_length=100, null=True),
        ),
        migrations.AlterField(
            model_name='jobinfo',
            name='latitude',
            field=models.FloatField(blank=True, default=None, null=True),
        ),
        migrations.AlterField(
            model_name='jobinfo',
            name='longitude',
            field=models.FloatField(blank=True, default=None, null=True),
        ),
        migrations.AlterField(
            model_name='new',
            name='content',
            field=models.CharField(blank=True, default=None, max_length=1000, null=True),
        ),
        migrations.AlterField(
            model_name='new',
            name='title',
            field=models.CharField(blank=True, default=None, max_length=500, null=True),
        ),
        migrations.AlterField(
            model_name='userprofile',
            name='cohort_number_advanced',
            field=models.IntegerField(blank=True, default=None, null=True),
        ),
        migrations.AlterField(
            model_name='userprofile',
            name='cohort_number_frontline',
            field=models.IntegerField(blank=True, default=None, null=True),
        ),
        migrations.AlterField(
            model_name='userprofile',
            name='cohort_number_intermediate',
            field=models.IntegerField(blank=True, default=None, null=True),
        ),
        migrations.AlterField(
            model_name='userprofile',
            name='date_of_birth',
            field=models.DateField(blank=True, default=None, null=True),
        ),
        migrations.AlterField(
            model_name='userprofile',
            name='firstname',
            field=models.CharField(default=None, max_length=50),
        ),
        migrations.AlterField(
            model_name='userprofile',
            name='image',
            field=models.ImageField(blank=True, null=True, upload_to='api_images/profile/'),
        ),
        migrations.AlterField(
            model_name='userprofile',
            name='institution_enrolled_at_advanced',
            field=models.CharField(blank=True, default=None, max_length=100, null=True),
        ),
        migrations.AlterField(
            model_name='userprofile',
            name='institution_enrolled_at_frontline',
            field=models.CharField(blank=True, default=None, max_length=100, null=True),
        ),
        migrations.AlterField(
            model_name='userprofile',
            name='institution_enrolled_at_intermediate',
            field=models.CharField(blank=True, db_column='institution__enrolled_at_intermediate', default=None, max_length=100, null=True),
        ),
        migrations.AlterField(
            model_name='userprofile',
            name='is_trained_advanced',
            field=models.CharField(blank=True, choices=[('Yes', 'Yes'), ('No', 'No')], default=None, max_length=5, null=True),
        ),
        migrations.AlterField(
            model_name='userprofile',
            name='is_trained_frontline',
            field=models.CharField(blank=True, choices=[('Yes', 'Yes'), ('No', 'No')], default=None, max_length=5, null=True),
        ),
        migrations.AlterField(
            model_name='userprofile',
            name='is_trained_intermediate',
            field=models.CharField(blank=True, choices=[('Yes', 'Yes'), ('No', 'No')], default=None, max_length=5, null=True),
        ),
        migrations.AlterField(
            model_name='userprofile',
            name='job_title_at_enroll_advanced',
            field=models.CharField(blank=True, default=None, max_length=100, null=True),
        ),
        migrations.AlterField(
            model_name='userprofile',
            name='job_title_at_enroll_frontline',
            field=models.CharField(blank=True, default=None, max_length=100, null=True),
        ),
        migrations.AlterField(
            model_name='userprofile',
            name='job_title_at_enroll_intermediate',
            field=models.CharField(blank=True, default=None, max_length=100, null=True),
        ),
        migrations.AlterField(
            model_name='userprofile',
            name='phone1',
            field=models.CharField(blank=True, default=None, max_length=13, null=True),
        ),
        migrations.AlterField(
            model_name='userprofile',
            name='phone2',
            field=models.CharField(blank=True, default=None, max_length=13, null=True),
        ),
        migrations.AlterField(
            model_name='userprofile',
            name='sex',
            field=models.CharField(blank=True, default=None, max_length=10, null=True),
        ),
        migrations.AlterField(
            model_name='userprofile',
            name='surname',
            field=models.CharField(default=None, max_length=50),
        ),
        migrations.AlterField(
            model_name='userprofile',
            name='title',
            field=models.CharField(blank=True, default=None, max_length=10, null=True),
        ),
        migrations.AlterField(
            model_name='userprofile',
            name='yr_completed_advanced',
            field=models.DateField(blank=True, default=None, null=True),
        ),
        migrations.AlterField(
            model_name='userprofile',
            name='yr_completed_frontline',
            field=models.DateField(blank=True, default=None, null=True),
        ),
        migrations.AlterField(
            model_name='userprofile',
            name='yr_completed_intermediate',
            field=models.DateField(blank=True, default=None, null=True),
        ),
    ]
