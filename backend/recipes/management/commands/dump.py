from django.core.management.base import BaseCommand
import json


class Command(BaseCommand):
    help = 'create the dump json for ingredients'

    def main(self, dump):
        new_list = []
        i = 1
        for ingredient in dump:
            inner_dict = {"model": "recipes.ingredient",
                          "pk": i,
                          "fields": ingredient}
            new_list.append(inner_dict)
            i += 1
        return new_list

    def handle(self, *args, **options):
        json_file = open('ingredients.json', 'r', encoding='utf-8')
        dump = json.load(json_file)
        json_file.close()
        json_file = open('ingredients.json', 'w', encoding='utf-8')
        json_file.write(json.dumps(
            self.main(dump),
            ensure_ascii=False).encode('utf-8').decode())
        json_file.close()
