# Generated by Django 2.2.24 on 2021-09-11 16:44

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('apis', '0019_auto_20210910_0235'),
    ]

    operations = [
        migrations.AlterField(
            model_name='new',
            name='content',
            field=models.CharField(blank=True, default=None, max_length=10000, null=True),
        ),
    ]
