from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('tracks/', views.track_list, name='track_list'),
    path('track/<int:id>/', views.track_detail, name='track_detail'),
    # Add more URL patterns as needed
]
