from django.db import models
from django.db.models.deletion import CASCADE

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

class Review(models.Model):
    image       = models.ImageField(upload_to ='reviews/')
    comment     = models.TextField(max_length= 200)
    item        = models.ForeignKey(Item, on_delete= models.CASCADE)
    slug        = models.SlugField(max_length=50, unique=True)
