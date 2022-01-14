from django.contrib import admin
from .models import Transaction, Invoice, Detail

# Register your models here.
admin.site.register(Transaction)
admin.site.register(Invoice)
admin.site.register(Detail)
