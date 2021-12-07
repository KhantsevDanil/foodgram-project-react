from django.core.validators import RegexValidator
from django.db import models
from django.utils.html import format_html


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
