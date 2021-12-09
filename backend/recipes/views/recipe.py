from django.shortcuts import get_object_or_404
from rest_framework import permissions, status, viewsets
from rest_framework.decorators import action
from rest_framework.response import Response

from pdf_format.pdf_generator import shopping_list_pdf
from recipes.models.recipe import Recipe
from recipes.permissions import IsOwnerOrAdmin
from recipes.serializers.recipe import RecipeSerializer, RecipeSerializerGet
from recipes.filters import RecipeFilter
from users.models import User
from users.serializer import M2MUserRecipeSerializer


class RecipeViewSet(viewsets.ModelViewSet):
    queryset = Recipe.objects.select_related('author').prefetch_related(
        'ingredients'
    ).all()
    permission_classes = [
        permissions.IsAuthenticatedOrReadOnly,
        IsOwnerOrAdmin,
    ]
    filterset_class = RecipeFilter

    def get_serializer_class(self):
        if self.request.method in permissions.SAFE_METHODS:
            return RecipeSerializerGet
        return RecipeSerializer

    def perform_create(self, serializer):
        serializer.save(author=self.request.user)

    def perform_update(self, serializer):
        serializer.save(author=self.request.user)

    """def get_queryset(self):
        queryset = super().get_queryset()
        if self.request.query_params.get('tags'):
            need_tags = self.request.query_params.get('tags')
            queryset = Recipe.objects.filter(tags__slug=need_tags)
        if self.request.query_params.get('is_favorited'):
            queryset = queryset.filter(favorite_this=self.request.user)
        if self.request.query_params.get('is_in_shopping_cart'):
            queryset = queryset.filter(shopping_cart=self.request.user)
        return queryset"""

    @action(
        detail=False,
        methods=['get', 'delete'],
        url_path=r'(?P<id>[\d]+)/favorite',
        url_name='favorite',
        pagination_class=None,
        permission_classes=[permissions.IsAuthenticated]
    )
    def favorite(self, request, **kwargs):
        user = request.user
        recipe = get_object_or_404(Recipe, id=kwargs['id'])
        like = User.objects.filter(
            id=user.id,
            favourite_recipes=recipe
        ).exists()
        if request.method == 'GET' and not like:
            recipe.favorite_this.add(user)
            serializer = M2MUserRecipeSerializer(recipe)
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        if request.method == 'DELETE' and like:
            recipe.favorite_this.remove(user)
            return Response(status=status.HTTP_204_NO_CONTENT)
        return Response(
            {'detail': 'Действие уже выполнено'},
            status=status.HTTP_400_BAD_REQUEST
        )

    @action(
        detail=False,
        methods=['get', 'delete'],
        url_path=r'(?P<id>[\d]+)/shopping_cart',
        url_name='shopping_cart',
        pagination_class=None,
        permission_classes=[permissions.IsAuthenticated]
    )
    def shopping_cart(self, request, **kwargs):
        user = request.user
        recipe = get_object_or_404(Recipe, id=kwargs['id'])
        is_added = User.objects.filter(
            id=user.id,
            shopping_carts=recipe
        ).exists()
        if request.method == 'GET' and not is_added:
            recipe.shopping_cart.add(user)
            serializer = M2MUserRecipeSerializer(recipe)
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        if request.method == 'DELETE' and is_added:
            recipe.shopping_cart.remove(user)
            return Response(status=status.HTTP_204_NO_CONTENT)
        return Response(
            {'detail': 'Recipe have been added'},
            status=status.HTTP_400_BAD_REQUEST
        )

    @action(
        detail=False,
        methods=['get'],
        url_path='download_shopping_cart',
        url_name='download_shopping_cart',
        pagination_class=None,
        permission_classes=[permissions.IsAuthenticated]
    )
    def download_shopping_cart(self, request):
        user = request.user
        return shopping_list_pdf(user)
