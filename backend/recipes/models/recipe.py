from django.core.validators import MinValueValidator
from django.db import models

from users.models import User


class Recipe(models.Model):
    """The model describes recipes published by the user."""
    author = models.ForeignKey(
        User, on_delete=models.CASCADE,
        related_name="recipes",
        verbose_name="Автор публикации"
    )
    name = models.CharField("Название",
                            max_length=200,
                            unique=True,
                            default='блюдо от шефповара',
                            blank=False)
    image = models.ImageField("Картинка",
                              blank=False)
    text = models.TextField("Текстовое описание",
                            blank=False)
    tags = models.ManyToManyField("Tag",
                                  related_name="recipes",
                                  verbose_name="Теги",
                                  )
    cooking_time = models.PositiveSmallIntegerField(
        validators=[
            MinValueValidator(limit_value=1, message="Time smaller 1")
        ],
        verbose_name="Время приготовления",
        default=40,
        blank=False
    )
    favorite_this = models.ManyToManyField(
        User,
        related_name='favourite_recipes',
        verbose_name='Кому понравилось'
    )
    shopping_cart = models.ManyToManyField(
        User,
        related_name='shopping_carts',
        verbose_name='Кто хочет купить'
    )

    class Meta:
        verbose_name = "Рецепт"
        verbose_name_plural = "Рецепты"
