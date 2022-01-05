from django.urls import path
from . import views

urlpatterns = [
    path('', views.default, name='default'),
    path('register/', views.register, name='register'),
    path('login/', views.login, name='login'),
    path('logout/', views.logout, name='logout'),
    path('forgot_password/', views.forgot_password, name='forgot_password'),
    path('change_password/', views.change_password, name='change_password'),

    # From mail
    path('activate/<uidb64>/<token>', views.activate, name='activate'),
    path('reset_password/<uidb64>/<token>', views.reset_password, name='reset_password'),
]
