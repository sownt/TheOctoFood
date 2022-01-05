from django.http import HttpResponse

def home(request):
    return HttpResponse("<p>This is the homepage view</p>")