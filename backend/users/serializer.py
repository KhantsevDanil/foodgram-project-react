from rest_framework import serializers

from .models import User
from api.models import Follow


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        fields = ('email', 'username', 'first_name',
                  'last_name', 'password', )
        model = User

    def get_is_subscribed(self, obj):
        user = self.context['request'].user
        if (user.is_authenticated and
                Follow.objects.filter(user=user, author=obj).exists()):
            return True
        return False