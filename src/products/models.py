from django.db import models

# Create your models here.
class Category(models.Model):
    name        = models.CharField(max_length=50, unique=True)
    slug        = models.SlugField(max_length=50, unique=True)
    description = models.TextField()
    image       = models.ImageField(upload_to ='categories/')

class Item(models.Model):
    pass