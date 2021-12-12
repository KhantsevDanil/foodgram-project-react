# Foodgram final
Продуктовый помощник
### Кратко о проекте
сайт, на котором пользователи будут публиковать рецепты, 
добавлять чужие рецепты в избранное и подписываться на публикации других авторов. 
Сервис «Список покупок» позволит пользователям создавать список продуктов, 
которые нужно купить для приготовления выбранных блюд.
### Техническое описание
В этом проекте реализован Docker,
котоый позволяет создавать специальные контейнеры,
для упрощенияя работы сервера.
В проекте созданы 4 контейнера:
db_1 - заполняет базу данный postgresql
web_1 - отвечает за работу сайта
nginx_1 - работает со статикой, без него сервер будет работать,
frontend_1 - запускает React
сайт доступен по ссылке http://84.201.153.57
### Запуск сайта локально из директории backend/
``` python manage.py runserver ```
### Запуск сервера из ubuntu осуществляется командой
``` docker-compose up ```
### команда для удаления базы данных и всех volumes
``` docker-compose down -v```
### команда для создания суперпользователя, работает только с запущенным контейнером
``` docker-compose exec web python manage.py createsuperuser ```
### Команда для заполнения ингредиентами
``` docker-compose exec web python manage.py loaddata fixtures/ingredients.json ```
### команда для заполнения проекта статикой
``` docker-compose exec web python manage.py collectstatic ```
