from django import forms
from django.shortcuts import render, redirect
from django.contrib import messages, auth
from django.contrib.auth.decorators import login_required
from django.contrib.auth.tokens import default_token_generator
from django.contrib.sites.shortcuts import get_current_site
from django.template.loader import render_to_string
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.utils.encoding import force_bytes
from django.core.mail import EmailMessage

from .models import Account

# Create your views here.
class RegistrationForm(forms.ModelForm):
    username = forms.CharField(max_length=50)
    email = forms.EmailField(max_length=255)
    first_name = forms.CharField(max_length=50)
    last_name = forms.CharField(max_length=50)
    phone_number = forms.CharField(max_length=50)
    password = forms.CharField(widget=forms.PasswordInput(attrs={'placeholder': 'Enter password'}))
    confirm_password = forms.CharField(widget=forms.PasswordInput(attrs={'placeholder': 'Confirm password'}))

    class Meta:
        model = Account
        fields = ['username', 'email', 'first_name', 'last_name', 'phone_number', 'password', 'confirm_password']

    def __init__(self, *args, **kwargs):
        super(RegistrationForm, self).__init__(*args, **kwargs)
        self.fields['username'].widget.attrs['placeholder'] = 'Enter username'
        self.fields['email'].widget.attrs['placeholder'] = 'Enter email'
        self.fields['first_name'].widget.attrs['placeholder'] = 'Enter first name'
        self.fields['last_name'].widget.attrs['placeholder'] = 'Enter last name'
        self.fields['phone_number'].widget.attrs['placeholder'] = 'Enter phone number'
        for field in self.fields:
            self.fields[field].widget.attrs['class'] = 'form-control'

    def clean(self):
        cleaned_data = super(RegistrationForm, self).clean()
        password = cleaned_data.get('password')
        confirm_password = cleaned_data.get('confirm_password')
        if password != confirm_password:
            raise forms.ValidationError('Passwords do not match')
        return cleaned_data

def register(request):
    if request.method == 'POST':
        form = RegistrationForm(request.POST)
        if form.is_valid():
            username = form.cleaned_data['username']
            email = form.cleaned_data['email']
            first_name = form.cleaned_data['first_name']
            last_name = form.cleaned_data['last_name']
            phone_number = form.cleaned_data['phone_number']
            password = form.cleaned_data['password']

            user = Account.objects.create_user(
                username=username, 
                email=email, 
                first_name=first_name, 
                last_name=last_name, 
                password=password,
                phone_number = phone_number
            )
            user.save()

            current_site = get_current_site(request=request)
            mail_subject = 'Verify your email address.'
            message = render_to_string('account/mail_activation.html', {
                'user': user,
                'domain': current_site.domain,
                'uid': urlsafe_base64_encode(force_bytes(user.pk)),
                'token': default_token_generator.make_token(user)
            })
            send_email = EmailMessage(mail_subject, message, to=[email])
            send_email.send()
            messages.success(
                request=request,
                message="Please confirm your email address!"
            )
            return redirect('register')
        else:
            messages.error(request=request, message="Register failed!")
    else:
        form = RegistrationForm()
    context = {
        'form': form,
    }
    return render(request, 'account/account_register.html', context)

def login(request):
    if request.method == "POST":
        email = request.POST.get('email')
        password = request.POST.get('password')
        user = auth.authenticate(email=email, password=password)
        if user is not None:
            auth.login(request=request, user=user)
            messages.success(request=request, message="Login successful!")
            url = request.META.get('HTTP_REFERER')
            try:
                query = requests.utils.urlparse(url).query
                params = dict(x.split("=") for x in query.split("&"))
                if "next" in params:
                    next_page = params["next"]
                    return redirect(next_page)
            except Exception:
                return redirect('dashboard')
        else:
            messages.error(request=request, message="Login failed!")
    context = {
        'email': email if 'email' in locals() else '',
        'password': password if 'password' in locals() else '',
    }
    return render(request, 'account/account_login.html', context=context)

@login_required(login_url="login")
def logout(request):
    auth.logout(request)
    messages.success(request=request, message="You are logged out!")
    return redirect('login')

def activate(request, uidb64, token):
    try:
        uid = urlsafe_base64_decode(uidb64).decode()
        user = Account.objects.get(pk=uid)
    except Exception:
        user = None

    if user is not None and default_token_generator.check_token(user, token):
        user.is_active = True
        user.save()
        messages.success(
            request=request, message="Your account is activated!")
        return redirect('login')
        
    else:
        messages.error(request=request, message="This link is invalid!")
        return redirect('login')

def forgot_password(request):
    try:
        if request.method == 'POST':
            email = request.POST.get('email')
            user = Account.objects.get(email__exact=email)

            current_site = get_current_site(request=request)
            mail_subject = 'Password Reset.'
            message = render_to_string('account/mail_reset.html', {
                'user': user,
                'domain': current_site.domain,
                'uid': urlsafe_base64_encode(force_bytes(user.pk)),
                'token': default_token_generator.make_token(user)
            })
            send_email = EmailMessage(mail_subject, message, to=[email])
            send_email.send()

            messages.success(
                request=request, message="We have sent you an email with instructions to reset your password!")

    except Exception:
        messages.error(request=request, message="Account does not exist!")
    finally:
        context = {
            'email': email if 'email' in locals() else '',
        }
        return render(request, "account/account_forgot.html", context=context)

def reset_password(request, uidb64, token):
    try:
        uid = urlsafe_base64_decode(uidb64).decode()
        user = Account.objects.get(pk=uid)
    except Exception:
        user = None

    if user is not None and default_token_generator.check_token(user, token):
        request.session['uid'] = uid
        return redirect('change_password')
    else:
        messages.error(request=request, message="This link has been expired or is invalid!")
        return redirect('login')

def change_password(request):
    if request.method == 'POST':
        password = request.POST.get('password')
        confirm_password = request.POST.get('confirm_password')

        if password == confirm_password:
            uid = request.session.get('uid')
            user = Account.objects.get(pk=uid)
            user.set_password(password)
            user.save()
            messages.success(request, message="Password reset successful!")
            return redirect('login')
        else:
            messages.error(request, message="Password do not match!")
    return render(request, 'account/account_reset.html')

def default(request):
    return redirect('home')