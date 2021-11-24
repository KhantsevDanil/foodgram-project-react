from rest_framework import authentication

from .models import UserConfirmCode


class ConfirmUserRegistrationAuthentication(authentication.BaseAuthentication):
    def authenticate(self, request, email=None, confirmation_code=None):
        user = UserConfirmCode.objects.filter(
            email=email,
            confirmation_code=confirmation_code,
        ).first()
        return user
