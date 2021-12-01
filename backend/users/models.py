from django.contrib.auth.models import AbstractUser
from django.db import models


class User(AbstractUser):
    first_name = models.CharField('first name', max_length=150)
    last_name = models.CharField('last name', max_length=150)
    email = models.EmailField('email address', unique=True)
    REQUIRED_FIELDS = ['username', 'first_name', 'last_name']
    USERNAME_FIELD = 'email'

    class Meta:
        ordering = ['last_name']
        verbose_name = 'Пользователь'
        verbose_name_plural = 'Пользователи'

    def __str__(self):
        return f'{self.last_name} {self.first_name}'


"""class Subscribed(models.Model):
    author = models.ForeignKey(User, on_delete=models.CASCADE,
        related_name="author_subscribed",
        verbose_name="автор подписки")
    subscriber = models.ManyToManyField(
        User,
        related_name='subsribers',
        verbose_name='подписчик'
    )"""