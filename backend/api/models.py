from django.db import models
from django.core.validators import MinValueValidator, RegexValidator
from users.models import User
from django.utils.html import format_html


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
    ingredients = models.ManyToManyField("Ingredient",
                                         through="IngredientAmount",
                                         related_name="recipes",
                                         verbose_name="Ингридиенты",
    )
    cooking_time = models.PositiveSmallIntegerField(
        validators=[
            MinValueValidator(limit_value=1, message="Time smaller 1")
        ],
        verbose_name="Время приготовления",
        default = 40,
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


class Tag(models.Model):
    """The model describes the tags for fetching by recipes."""
    name = models.CharField("Название", max_length=200)
    hexcolor_regex = RegexValidator(
        regex=r'^#(?:[0-9a-fA-F]{3}){1,2}$',
        message=(
            'Enter valid hex color number'
        )
    )
    color = models.CharField(
        max_length=7,
        unique=True,
        validators=[hexcolor_regex],
        verbose_name='Цвет'
    )
    slug = models.SlugField(
        "Ярлык", unique=True,
        max_length=200,
        blank=False
    )

    def colored_name(self):
        """Color in format HEX."""
        return format_html(
            '<span style="color: #{};">{}</span>',
            self.color,
        )

    class Meta:
        verbose_name = "Тег"
        verbose_name_plural = "Теги"

    def __str__(self):
        return self.name


class Ingredient(models.Model):
    """The model describes the recipe ingredient."""
    name = models.CharField("Название",
                            max_length=200,
                            default='some love',
                            blank=False)
    
    measurement_unit = models.CharField(
        "Единицы измерения",
        max_length=20,
        default="шт",
        blank=False
    )

    class Meta:
        ordering = ['name']
        verbose_name = "Ингредиент"
        verbose_name_plural = "Ингредиенты"

    def __str__(self):
        return self.name


class IngredientAmount(models.Model):
    """Model for describing the amount of ingredients."""
    ingredient = models.ForeignKey(
        Ingredient,
        on_delete=models.CASCADE,
        related_name="ingredients_amount",
        verbose_name="Ингредиент"
    )
    recipe = models.ForeignKey(
        Recipe, on_delete=models.CASCADE,
        related_name="ingredients_amount",
        verbose_name="Рецепт"
    )
    amount = models.PositiveSmallIntegerField(
                                     blank=False,
        validators=[
            MinValueValidator(limit_value=0, message="Amount can`t be smaller then 0")
        ],
        verbose_name="Количество"
    )

    class Meta:
        verbose_name = "Количество ингредиента"
        verbose_name_plural = "Количества ингредиентов"

    def __str__(self) -> str:
        return self.ingredient.name


class Follow(models.Model):
    author = models.ForeignKey(User,
                               related_name='follower',
                               on_delete=models.CASCADE,
                               verbose_name='follower')

    subscriber = models.ManyToManyField(User,
                                        related_name="follows",
                                        verbose_name="People_who_u_subscribed",
                                        )
"""

class ShoppingCart(models.Model):
    author = models.OneToOneField(User,
                               related_name='shopping_carts',
                               on_delete=models.CASCADE,
                               verbose_name='author shopping cart')

    recipes = models.ManyToManyField(Recipe,
                                        related_name="shopping_carts",
                                        verbose_name="recipes in shopping cart",
                                        )
"""