"""
URL configuration for devhands project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
# from django.contrib import admin
from django.urls import path

from core.views import cpu_usleep, main, from_db, from_cache, from_cache_many

urlpatterns = [
    path('', main),
    path('cpu_usleep', cpu_usleep),
    path('from_db', from_db),
    path('from_cache', from_cache),
    path('from_cache_many', from_cache_many),
    #    path('admin/', admin.site.urls),
]
