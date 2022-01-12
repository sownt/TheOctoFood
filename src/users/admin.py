from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from .models import Account, Address

# Register your models here.
class CustomUserAdmin(UserAdmin):
    list_display = ('username', 'email', 'first_name', 'last_name', 'phone_number', 'date_joined', 'is_active', 'is_staff', 'is_superuser',)
    list_display_links = ('username',)
    filter_horizontal = ()
    list_filter = ()
    fieldsets = ()

admin.site.register(Account, CustomUserAdmin)
admin.site.register(Address)