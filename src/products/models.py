from django.db import models

# Create your models here.
class Category(models.Model):
    name        = models.TextField()
    slug        = models.SlugField(max_length=50)
    description = models.TextField()
    image       = models.ImageField(upload_to ='categories/')