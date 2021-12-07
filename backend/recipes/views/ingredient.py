from rest_framework import viewsets

from recipes.filters import IngredientFilter
from recipes.models.ingredient import Ingredient
from recipes.serializers.ingredient import IngredientSerializer


class IngredientsViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = Ingredient.objects.all()
    serializer_class = IngredientSerializer
    filter_backends = (IngredientFilter,)
    pagination_class = None
    search_fields = ('^name',)
