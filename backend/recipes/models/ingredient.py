from django.db import models


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
