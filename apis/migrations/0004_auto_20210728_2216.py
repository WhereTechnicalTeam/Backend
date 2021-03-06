# Generated by Django 2.2.24 on 2021-07-28 22:16

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('apis', '0003_userprofile_email_status'),
    ]

    operations = [
        migrations.AlterField(
            model_name='jobinfo',
            name='is_current',
            field=models.CharField(choices=[('Yes', 'Yes'), ('No', 'No')], default='no', max_length=5),
        ),
        migrations.AlterField(
            model_name='userprofile',
            name='is_trained_advanced',
            field=models.CharField(blank=True, choices=[('Yes', 'Yes'), ('No', 'No')], max_length=5, null=True),
        ),
        migrations.AlterField(
            model_name='userprofile',
            name='is_trained_frontline',
            field=models.CharField(blank=True, choices=[('Yes', 'Yes'), ('No', 'No')], max_length=5, null=True),
        ),
        migrations.AlterField(
            model_name='userprofile',
            name='is_trained_intermediate',
            field=models.CharField(blank=True, choices=[('Yes', 'Yes'), ('No', 'No')], max_length=5, null=True),
        ),
    ]
