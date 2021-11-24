from django_filters import CharFilter
from django_filters import FilterSet as DefaultFilterSet


class IngredientFilter(DefaultFilterSet):
    name = CharFilter(
        field_name='name', lookup_expr='startswith'
    )