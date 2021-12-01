from django.urls import include, path
from rest_framework.routers import DefaultRouter
from .views import (
    FollowViewSet,
    TagViewSet,
    IngredientsViewSet,
    GetFollower,
    RecipeViewSet
)


router = DefaultRouter()
router.register('tags', TagViewSet)
router.register('recipes', RecipeViewSet, basename='recipe')
router.register('ingredients', IngredientsViewSet, basename='ingredient')
router.register('subscribe', GetFollower, basename='get_follower')
router.register(r'users/(?P<title_id>\d+)/subscribe', FollowViewSet, basename='new_following')


urlpatterns = [
    path('auth/', include('djoser.urls.authtoken')),
    path('', include('djoser.urls')),
    path('', include('users.urls')),
    path('', include(router.urls)),
]