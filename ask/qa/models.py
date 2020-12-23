# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

# Create your models here.

from django.contrib.auth.models import User

class Question (models.Model):
	#objects = QuestionManager()
	title = models.CharField(max_length=200)
	text = models.TextField()
	added_at = models.DateTimeField(blank = True, auto_now_add=True)
	rating = models.IntegerField(default=0)
	author = models.ForeignKey(User)
	likes = models.ManyToManyField(User, related_name='likes_set')
	
	def __unicode__(self):
		return self.title
	def get_absolute_url(self):
		return '/question/%d/' % self.pk
	class Meta:
		db_table = 'qa_questions'
		#ordering = ['-creation_data']

class QuestionManager (models.Manager):
	def new (self):
		return self.order_by('-added_at')
	def popular(self):
    		return self.order_by('-rating')

class Answer (models.Model):
	text = models.TextField()
	added_at = models.DateTimeField(blank = True, auto_now_add=True)
	question = models.ForeignKey('Question')
	author = models.ForeignKey(User)
	class Meta:
		db_table = 'qa_answers'
		ordering = ['-creation_data']


