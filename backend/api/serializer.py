from rest_framework import serializers
from drf_extra_fields.fields import Base64ImageField
from users.serializer import UserSerializer
from django.shortcuts import get_object_or_404

from rest_framework import serializers

from .models import Ingredient, IngredientAmount


from .models import (Ingredient,
                     Tag,
                     Recipe,
                     Favorite,
                     IngredientAmount,
                     ShoppingCart,
                     IngredientInRecipe,
                     Follow)
from users.models import User



"""class IngredientSerializer(serializers.ModelSerializer):
    amount = serializers.IntegerField(source="recipes.ingredients_amount.amount", default=1)
    id = serializers.IntegerField()

    class Meta:
        fields = ("id", "name", "measurement_unit", "amount")
        model = Ingredient


class IngredientAmountSerializer(serializers.ModelSerializer):

    class Meta:
        fields = ("amount")
        model = IngredientAmount
"""

class IngredientAmountSerializer(serializers.ModelSerializer):
    id = serializers.SlugRelatedField(
        source='ingredient',
        slug_field='id',
        queryset=Ingredient.objects.all()
    )
    name = serializers.SlugRelatedField(
        source='ingredient',
        slug_field='name',
        read_only=True
    )
    measurement_unit = serializers.SlugRelatedField(
        source='ingredient',
        slug_field='measurement_unit',
        read_only=True
    )

    class Meta:
        model = IngredientAmount
        fields = ['id', 'name', 'measurement_unit', 'amount']


class IngredientSerializer(serializers.ModelSerializer):
    class Meta:
        model = Ingredient
        fields = ['id', 'name', 'measurement_unit']


class TagSerializer(serializers.ModelSerializer):

    class Meta:
        fields = ("id", "name", "color", "slug")
        model = Tag

class RecipeImageSerializer(serializers.ModelSerializer):
    """
    We want to get absolute url for image, instance  web:8000/image-path
    more information:
    https://stackoverflow.com/questions/51401675/how-to-make-imagefield-returns-relative-path
    """
    image = Base64ImageField()

    def to_representation(self, instance):
        """get relative url instead of absolute"""
        response = super(
            RecipeImageSerializer,
            self
        ).to_representation(instance)
        if instance.image:
            response['image'] = instance.image.url
        return response

    class Meta:
        model = Recipe
        fields = ['id', 'name', 'image', 'cooking_time']


class RecipeSerializer(RecipeImageSerializer):
    author = UserSerializer(read_only=True)
    ingredients = IngredientSerializer(
        source="recipes_amount",
        many=True
    )
    tags = TagSerializer(many=True)
    author = UserSerializer()
    is_favorited = serializers.SerializerMethodField()
    is_in_shopping_cart = serializers.SerializerMethodField()

    def get_is_favorited(self, recipe):
        try:
            if self.context['request'].user.is_anonymous:
                return False
            else:
                user = get_object_or_404(
                    User,
                    id=self.context['request'].user.id
                )
                return Favorite.objects.filter(
                    recipe_id=recipe.id,
                    user_id=user.id
                ).exists()
        except AttributeError:
            return False


    def get_is_in_shopping_cart(self, recipe):
        try:
            if self.context['request'].user.is_anonymous:
                return False
            else:
                user = get_object_or_404(
                    User,
                    id=self.context['request'].user.id
                )
                return ShoppingCart.objects.filter(
                    recipes__id=recipe.id,
                    users__id=user.id
                ).exists()
        except AttributeError:
            return False

    class Meta:
        fields = (
            "id",
            'tags',
            'is_in',
            "is_favorited",
            "is_in_shopping_cart",
            "author",
            "ingredients",
            "image",
            "name",
            "text",
            "cooking_time"
        )
        model = Recipe


class RecipeCreateSerializer(RecipeSerializer):
    """
    Main Serializer for Creating & Updating Recipes
    Needed for minified jsons in creation/update
    """
    tags = serializers.PrimaryKeyRelatedField(
        many=True,
        queryset=Tag.objects.all()
    )

    def validate(self, data):
        """
        Check:
        1. Cooking time >= 1
        2. Ingredient amount >= 0
        3. Only unique Ingredients
        4. Only unique Tags
        """
        if data.get('cooking_time') < 1:
            raise serializers.ValidationError(
                'Cooking Time cannot be less than 1 min'
            )

        unique_ingredients = dict()
        for ingredient in data.get('ingredientinrecipe_set'):
            if ingredient['amount'] < 0:
                raise serializers.ValidationError(
                    'Ingredient amount cannot be less than 0'
                )
            if ingredient['ingredient']['id'] in unique_ingredients:
                raise serializers.ValidationError(
                    'Ingredients should be unique'
                )
            else:
                unique_ingredients[ingredient['ingredient']['id']] = 1

        unique_tags = dict()
        for tag in data.get('tags'):
            if tag.id in unique_tags:
                raise serializers.ValidationError(
                    'Tags should be unique'
                )
            else:
                unique_tags[tag.id] = 1

        return data

    def fill_ingredients_in_recipe(self, instance):
        ingredient_list = []
        for ingredient in self.context['request'].data['ingredients']:
            ingredient_list.append(
                IngredientInRecipe(
                    recipe=instance,
                    ingredient=get_object_or_404(
                        Ingredient,
                        id=ingredient['id']
                    ),
                    amount=ingredient['amount']
                )
            )
        IngredientInRecipe.objects.bulk_create(ingredient_list)

    def create(self, validated_data):
        ingredients = validated_data.pop('ingredientinrecipe_set')
        tags = validated_data.pop('tags')
        instance = Recipe.objects.create(
            author=self.context['request'].user,
            **validated_data
        )
        instance.tags.set(tags)
        self.fill_ingredients_in_recipe(instance, ingredients)
        return instance

    def update(self, instance, validated_data):
        ingredients = validated_data.pop('ingredientinrecipe_set')
        tags = validated_data.pop('tags')
        instance = super().update(instance, validated_data)
        instance.tags.clear()
        instance.tags.add(*tags)
        Recipe.objects.filter(recipes__id=instance.id).delete()
        self.fill_ingredients_in_recipe(instance, ingredients)
        return instance

    class Meta:
        model = Recipe
        fields = (
            'ingredients',
            'tags',
            'image',
            'name',
            'text',
            'cooking_time'
        )


class FavoriteSerializer(serializers.ModelSerializer):
    class Meta:
        fields = '__all__'
        model = Favorite
    def validate(self, data):
        if data['user'] == data['favorites']:
            raise serializers.ValidationError(
                'Слишком самовлюблённо, вам не может понравится ваш же рецепт')
        return data


class FollowSerializer(serializers.ModelSerializer):
    user = serializers.CharField(
        read_only=True, default=serializers.CurrentUserDefault()
    )
    following = serializers.SlugRelatedField(
        slug_field="username",
        queryset=User.objects.all()
    )

    class Meta:
        fields = ("user", "following")
        model = Follow