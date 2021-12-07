from django.urls import include, path
from rest_framework.routers import DefaultRouter

from recipes.views.ingredient import IngredientsViewSet
from recipes.views.recipe import RecipeViewSet
from recipes.views.tag import TagViewSet

router = DefaultRouter()
router.register('tags', TagViewSet)
router.register('recipes', RecipeViewSet, basename='recipe')
router.register('ingredients', IngredientsViewSet, basename='ingredient')


urlpatterns = [
    path('auth/', include('djoser.urls.authtoken')),
    path('', include('users.urls')),
    path('', include(router.urls)),
]
