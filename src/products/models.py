from django.db import models

# Create your models here.
class Category(models.Model):
    name        = models.CharField(max_length=50, unique=True)
    slug        = models.SlugField(max_length=50, unique=True)
    description = models.TextField()
    image       = models.ImageField(upload_to ='categories/')

class Item(models.Model):
    name        = models.CharField(max_length=150, unique=True)
    slug        = models.SlugField(max_length=50, unique=True)
    description = models.TextField(max_length=300)
    price       = models.IntegerField()
    image       = models.ImageField(upload_to ='items/')
    category    = models.ForeignKey(Category, on_delete = models.CASCADE) 
    stock       = models.IntegerField()
