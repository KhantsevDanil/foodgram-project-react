from django.core.validators import MinValueValidator
from django.db import models
from django.db.models.constraints import UniqueConstraint

from .ingredient import Ingredient
from .recipe import Recipe


class IngredientAmount(models.Model):
    """Model for describing the amount of ingredients."""
    ingredient = models.ForeignKey(
        Ingredient,
        on_delete=models.CASCADE,
        related_name="ingredient_amount",
        verbose_name="Ингредиент"
    )
    recipe = models.ForeignKey(
        Recipe, on_delete=models.CASCADE,
        related_name="ingredients",
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
        constraints = [
            UniqueConstraint(
                fields=['ingredient', 'recipe'],
                name='unique_ingredient'
            )
        ]
        verbose_name = "Количество ингредиента"
        verbose_name_plural = "Количества ингредиентов"

    def __str__(self) -> str:
        return self.ingredient.name
