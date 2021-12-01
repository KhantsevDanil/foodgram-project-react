from rest_framework import serializers
from django.shortcuts import get_object_or_404

from .models import User


class UserSerializer(serializers.ModelSerializer):
    """    is_subscribed = serializers.SerializerMethodField()


    def get_is_subscribed(self, obj):
        request = self.context.get('request')
        author = get_object_or_404(Subscribed, id=kwargs['id'])
        if not request or not request.user.is_authenticated:
            return False
        return obj.shopping_cart.filter(user=request.user).exists()
"""

    class Meta:
        fields = ('email', 'id', 'username', 'first_name',
                  'last_name', 'password')
        model = User
        extra_kwargs = {'password': {'write_only': True}}

