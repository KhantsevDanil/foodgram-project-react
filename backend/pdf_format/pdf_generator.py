from django.db.models import Sum
from django.http import HttpResponse
from reportlab.pdfbase import pdfmetrics
from reportlab.pdfbase.ttfonts import TTFont
from reportlab.pdfgen.canvas import Canvas

from recipes.models.ingredient_amount import IngredientAmount

def shopping_list_pdf(user):
    shopping_list = IngredientAmount.objects.filter(
        recipe__shopping_cart=user).values(
            'ingredient__name',
            'ingredient__measurement_unit'
    ).annotate(amount=Sum('amount')).order_by()
    response = HttpResponse(content_type=shopping_list)
    response['Content-Disposition'] = (
        'attachment; filename="shopping_list.pdf"'
    )
    pdfmetrics.registerFont(
        TTFont('DejaVuSerif', 'DejaVuSerif.ttf', 'UTF-8')
    )
    page = Canvas(filename=response)
    page.setFont('DejaVuSerif', 24)
    page.drawString(210, 800, 'Список покупок')
    page.setFont('DejaVuSerif', 16)
    height = 760
    new_page = 0
    for i in range(50):
        new_page += 1
        page.drawString(60, height, text=(
            f'{i}'
        ))
        height -= 30
        if new_page == 20:
            page.drawString(60, height, text=(
                f'{i}'
            ))
            page.showPage()
            new_page = 0
    page.save()
    return response
