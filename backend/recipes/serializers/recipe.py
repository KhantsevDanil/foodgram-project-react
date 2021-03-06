from django.core.exceptions import ValidationError
from drf_extra_fields.fields import Base64ImageField
from rest_framework import serializers

from recipes.models.ingredient_amount import IngredientAmount
from recipes.models.recipe import Recipe
from recipes.serializers.ingredient_amount import IngredientAmountSerializer
from recipes.serializers.tag import TagSerializer
from users.serializer import UserSerializer


class RecipeSerializer(serializers.ModelSerializer):
    author = UserSerializer(read_only=True)
    image = Base64ImageField()
    ingredients = IngredientAmountSerializer(many=True)

    def to_representation(self, instance):
        self.fields['tags'] = TagSerializer(many=True)
        return super().to_representation(instance)

    def validate(self, data):
        """Validate
        ingredient amount can`t be less then 0
        ingredients are unique
        cooking time can`t be less then 0"""

        ingredients = data['ingredients']
        existing_ingredients = {}
        for ingredient in ingredients:
            if ingredient['amount'] <= 0:
                raise ValidationError(
                    'Количество ингредиента должно быть больше нуля'
                )
            if (
                    ingredient['ingredient']
            ) not in existing_ingredients:
                instance = ingredient['ingredient']
                existing_ingredients[instance] = True
            else:
                raise ValidationError(
                    'Ингредиенты не должны повторяться'
                )
        if data['cooking_time'] <= 0:
            raise ValidationError(
                'Время готовки должно быть больше нуля'
            )
        tags = data['tags']
        existing_tags = {}
        for tag in tags:
            if tag in existing_tags:
                raise ValidationError(
                    'Повторяющиеся теги недопустимы'
                )
            existing_tags['tag'] = True
        return data

    @staticmethod
    def add_ingredients(instance, ingredients):
        for ingredient in ingredients:
            IngredientAmount.objects.get_or_create(
                ingredient=ingredient['ingredient'],
                amount=ingredient['amount'],
                recipe=instance
            )

    def create(self, validated_data):
        if 'tags' in validated_data:
            tags = validated_data.pop('tags')
        if 'ingredients' in validated_data:
            ingredients = validated_data.pop('ingredients')
        recipe = Recipe.objects.create(**validated_data)
        recipe.tags.add(*tags)
        self.add_ingredients(recipe, ingredients)
        return recipe

    def update(self, instance, validated_data):
        if 'tags' in validated_data:
            tags = validated_data.pop('tags')
            instance.tags.clear()
            instance.tags.add(*tags)
        if 'ingredients' in validated_data:
            ingredients = validated_data.pop('ingredients')
            IngredientAmount.objects.filter(recipe=instance).delete()
            self.add_ingredients(instance, ingredients)
        super().update(instance, validated_data)
        return instance

    class Meta:
        model = Recipe
        fields = [
            'id',
            'tags',
            'ingredients',
            'name',
            'image',
            'text',
            'cooking_time',
            'author'
        ]


class RecipeSerializerGet(RecipeSerializer):
    author = UserSerializer()
    image = Base64ImageField()
    ingredients = serializers.SerializerMethodField()
    is_favorited = serializers.SerializerMethodField()
    is_in_shopping_cart = serializers.SerializerMethodField()

    def get_ingredients(self, obj):
        return IngredientAmountSerializer(
            IngredientAmount.objects.filter(recipe=obj).all(), many=True
        ).data

    def get_is_favorited(self, obj):
        request = self.context.get('request')
        if not request or not request.user.is_authenticated:
            return False
        return obj.favorite_this.filter(id=request.user.id).exists()

    def get_is_in_shopping_cart(self, obj):
        request = self.context.get('request')
        if not request or not request.user.is_authenticated:
            return False
        return obj.shopping_cart.filter(id=request.user.id).exists()

    class Meta:
        model = Recipe
        fields = [
            'id',
            'tags',
            'author',
            'ingredients',
            'is_favorited',
            'is_in_shopping_cart',
            'name',
            'image',
            'text',
            'cooking_time'
        ]
