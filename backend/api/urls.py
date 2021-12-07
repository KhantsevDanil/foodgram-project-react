from django.urls import include, path
from rest_framework.routers import DefaultRouter
from .views import (
    TagViewSet,
    IngredientsViewSet,
    RecipeViewSet
)


router = DefaultRouter()
router.register('tags', TagViewSet)
router.register('recipes', RecipeViewSet, basename='recipe')
router.register('ingredients', IngredientsViewSet, basename='ingredient')


urlpatterns = [
    path('auth/', include('djoser.urls.authtoken')),
    path('', include('users.urls')),
    path('', include(router.urls)),
]