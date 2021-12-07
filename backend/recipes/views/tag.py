from rest_framework import viewsets

from recipes.models.tag import Tag
from recipes.serializers.tag import TagSerializer


class TagViewSet(viewsets.ModelViewSet):
    queryset = Tag.objects.all()
    serializer_class = TagSerializer
    pagination_class = None
