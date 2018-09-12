# overmind88_microservices
overmind88 microservices repository

# ДЗ №12

Что было сделано:
- Настроены travis и оповещения в slack
- Установлены docker, docker-compose, docker-machine
- Использованы основные команды docker по управлению контейнерами и образами

# ДЗ №13

Что было сделано:
- Настроил docker-machine на GCP
- Сравнил выводы docker run --rm -ti tehbilly/htop и docker run --rm --pid host -ti tehbilly/htop, во втором случае htop отображается для хоста
- Собрал образ dind, запустил его, запустил в нём контейнер hello-world
- Собрал образ для приложения, запустил контейнер с приложением, залил образ в docker-hub, проверил работоспособность образа в локальном докере
- Задание со звёздочкой: инфраструктурный репозиторий с packer, ansible и terraform

# ДЗ №14

Что было сделано:
- Контейнеры для каждого сервиса
- Оптимизирован размер UI контейнера
- Ко всем Docker-файлам применены рекомендации hadolint
- Задание со *
```
docker run -d --network=reddit --network-alias=mongo_database_post --network-alias=mongo_database_comment -v reddit_db:/data/db mongo:latest

docker run -d --env POST_DATABASE_HOST=mongo_database_post --network=reddit --network-alias=reddit_post overmind88/post:1.0

docker run -d --env COMMENT_DATABASE_HOST=mongo_database_comment --network=reddit --network-alias=reddit_comment overmind88/comment:1.0

docker run -d --env COMMENT_SERVICE_HOST=reddit_comment --env POST_SERVICE_HOST=reddit_post --network=reddit -p 9292:9292 overmind88/ui:1.0
```

- Для контейнеров UI и comment написаны Dockerfile.1 с созданием образа на основе alpine
- В .travis.yml добавдена проверка hadolint

# ДЗ №14

Что было сделано:
- Изучена работа драйверов для сети none, host, bridge
- Опробована конфигурация сети при которой контейнеры могут быть в разных бриджах
- Изучен docker-compose, приложение запускалось с одним бриджем и двумя
- Параметризированы порт публикации сервиса ui и версии сервисов
- Имя проекта берётся из переменной COMPOSE_PROJECT_NAME, если она не задана, в качестве базового имени проекта используется текущий каталог, из которого запускался docker-compose [1]
- Задание *
- - Создан docker-compose.override.yml в котором код каждого приложения монтируется из локального каталога в volume. Это хорошо работает для локальной разработки - файлы меняются в локальном каталоге и изменения тут же отражаются при обновлении страницы на локалхосте. При использовании docker-machine такой подход вызывает сложности - небоходимо либо копировать код каждый раз на хост с докером либо изменять код непосредственно на нём.

1. https://docs.docker.com/compose/reference/envvars/#compose_project_name

# ДЗ №14

Что было сделано:
- Сделано разворачивание инстанса gitlab через terraform и ansible
- - terraform apply
- - ansible-playbook --tags "docker-host"  playbooks/site.yml
