# Foodgramm final
Foodgramm final
### Описание
В этом проекте реализован Docker,
котоый позволяет создавать специальные контейнеры,
для упрощенияя работы сервера.
В проекте созданы 4 контейнера:
db_1 - заполняет базу данный postgresql
web_1 - отвечает за работу сайта
nginx_1 - работает со статикой, без него сервер будет работать,
frontend_1 - запускает React
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
