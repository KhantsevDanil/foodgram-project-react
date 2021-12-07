import json

def main(dump):
    new_list = []
    i = 1
    for ingredient in dump:
        # print(ingredient)
        inner_dict = {"model": "recipes.ingredient",
                      "pk": i,
                      "fields": ingredient}
        new_list.append(inner_dict)
        i += 1
    return new_list

json_file = open('ingredients.json', 'r', encoding='utf-8')
dump = json.load(json_file)
json_file.close()
json_file = open('ingredients.json', 'w', encoding='utf-8')
json_file.write(json.dumps(main(dump), ensure_ascii=False).encode('utf-8').decode())
json_file.close()