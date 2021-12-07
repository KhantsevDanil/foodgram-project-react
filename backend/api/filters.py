from rest_framework.filters import SearchFilter
from django_filters.rest_framework import filters, FilterSet
from users.models import User
from .models import Recipe


class RecipeFilter(FilterSet):
    author = filters.ModelChoiceFilter(queryset=User.objects.all())
    tags = filters.AllValuesMultipleFilter(field_name='tags__slug')

    class Meta:
        model = Recipe
        fields = ['author', 'tags']

class IngredientFilter(SearchFilter):
    search_param = 'name'