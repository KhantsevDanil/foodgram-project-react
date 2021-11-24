from django.urls import include, path
from rest_framework.routers import DefaultRouter
from rest_framework.authtoken import views


from .views import (UserViewSet,)

router = DefaultRouter()

router.register('', UserViewSet, basename='users')


urlpatterns = [
    path('users/', include(router.urls)),
]
