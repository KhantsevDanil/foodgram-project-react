from rest_framework import viewsets, status
from rest_framework.response import Response

from .models import User
from .serializer import (
    UserSerializer
)


class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer

    def me(self, request):
        serializer = self.get_serializer_class()
        data = serializer(request.user).data
        return Response(data, status=status.HTTP_200_OK)


