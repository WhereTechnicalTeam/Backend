# Generated by Django 2.2.24 on 2021-08-04 22:57

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('apis', '0005_userprofile_image'),
    ]

    operations = [
        migrations.AlterField(
            model_name='userprofile',
            name='image',
            field=models.ImageField(blank=True, default='na', null=True, upload_to='api_images/profile/'),
        ),
    ]
