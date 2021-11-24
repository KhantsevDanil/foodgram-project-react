from .models import (Ingredient,
                     Tag,
                     Recipe,
                     Favorite,
                     Follow)
from users.models import User
from .serializer import (RecipeSerializer,
                         IngredientSerializer,
                         FavoriteSerializer,
                         TagSerializer,
                         FollowSerializer,
                         RecipeCreateSerializer)
from .permissions import (IsOwnerOrAdmin)
from .filters import IngredientFilter
from django.shortcuts import get_object_or_404
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import permissions, viewsets, filters



class IngredientsViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = Ingredient.objects.all()
    serializer_class = IngredientSerializer
    filterset_class = IngredientFilter


class FavoriteViewSet(viewsets.ModelViewSet):
    queryset = Favorite.objects.all()
    serializer_class = FavoriteSerializer
    filter_backends = [filters.SearchFilter]
    permission_classes = [IsOwnerOrAdmin, ]
    search_fields = ['User__username', 'Favorite__title']
    http_method_names = ['post', 'delete']


    def perform_create(self, serializer):
        return serializer.save(user=self.request.user)


class RecipeViewSet(viewsets.ModelViewSet):
    queryset = Recipe.objects.all()
    filter_backends = [DjangoFilterBackend]

    def get_serializer_class(self):
        if self.request.method in permissions.SAFE_METHODS:
            return RecipeSerializer
        return RecipeCreateSerializer


class FollowViewSet(viewsets.ModelViewSet):
    queryset = Follow.objects.all()
    serializer_class = FollowSerializer
    permission_classes = [permissions.IsAuthenticated, ]
    http_method_names = ['get', 'delete']

    def perform_create(self, serializer):
        return serializer.save(user=self.request.user)


class GetFollower(viewsets.ModelViewSet):
    serializer_class = FollowSerializer

    def get_queryset(self):
        user = get_object_or_404(User, username=self.request.user.username)
        count_user_following = len(user.following.all())
        return [(user.following[user_number] + user.following.recipes[user_number])
                for user_number in range(count_user_following)]


class TagViewSet(viewsets.ModelViewSet):
    queryset = Tag.objects.all()
    serializer_class = TagSerializer
    pagination_class = None