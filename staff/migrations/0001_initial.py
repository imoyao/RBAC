# -*- coding: utf-8 -*-
# Generated by Django 1.9.4 on 2017-04-02 02:56
from __future__ import unicode_literals

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Access',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(default='', max_length=50)),
                ('urls', models.CharField(default='', max_length=1000)),
                ('status', models.SmallIntegerField(default=1)),
                ('updated_time', models.DateTimeField(default=datetime.datetime(2017, 4, 2, 10, 56, 37, 205636))),
                ('created_time', models.DateTimeField(default=datetime.datetime(2017, 4, 2, 10, 56, 37, 205669))),
            ],
        ),
        migrations.CreateModel(
            name='Role',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(default='', max_length=20)),
                ('status', models.SmallIntegerField(default=1)),
                ('updated_time', models.DateTimeField(default=datetime.datetime(2017, 4, 2, 10, 56, 37, 204061))),
                ('created_time', models.DateTimeField(default=datetime.datetime(2017, 4, 2, 10, 56, 37, 204099))),
            ],
        ),
        migrations.CreateModel(
            name='RoleAccess',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('role_id', models.IntegerField()),
                ('access_id', models.IntegerField()),
                ('created_time', models.DateTimeField(default=datetime.datetime(2017, 4, 2, 10, 56, 37, 206326))),
            ],
        ),
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(default='', max_length=20)),
                ('email', models.CharField(default='', max_length=30)),
                ('is_admin', models.SmallIntegerField(default=0)),
                ('status', models.SmallIntegerField(default=1)),
                ('updated_time', models.DateTimeField(default=datetime.datetime(2017, 4, 2, 10, 56, 37, 203390))),
                ('created_time', models.DateTimeField(default=datetime.datetime(2017, 4, 2, 10, 56, 37, 203426))),
            ],
        ),
        migrations.CreateModel(
            name='UserRole',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('uid', models.IntegerField()),
                ('role_id', models.IntegerField()),
                ('created_time', models.DateTimeField(default=datetime.datetime(2017, 4, 2, 10, 56, 37, 204659))),
            ],
        ),
    ]
