from django.shortcuts import render, get_object_or_404
from .models import Track

def index(request):
    return render(request, 'index.html')

def track_list(request):
    tracks = Track.objects.all()
    return render(request, 'track_list.html', {'tracks': tracks})

def track_detail(request, id):
    track = get_object_or_404(Track, id=id)
    return render(request, 'track_detail.html', {'track': track})
