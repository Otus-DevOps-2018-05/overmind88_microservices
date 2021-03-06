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

# ДЗ №15

Что было сделано:
- Изучена работа драйверов для сети none, host, bridge
- Опробована конфигурация сети при которой контейнеры могут быть в разных бриджах
- Изучен docker-compose, приложение запускалось с одним бриджем и двумя
- Параметризированы порт публикации сервиса ui и версии сервисов
- Имя проекта берётся из переменной COMPOSE_PROJECT_NAME, если она не задана, в качестве базового имени проекта используется текущий каталог, из которого запускался docker-compose [1]
- Задание *
- - Создан docker-compose.override.yml в котором код каждого приложения монтируется из локального каталога в volume. Это хорошо работает для локальной разработки - файлы меняются в локальном каталоге и изменения тут же отражаются при обновлении страницы на локалхосте. При использовании docker-machine такой подход вызывает сложности - небоходимо либо копировать код каждый раз на хост с докером либо изменять код непосредственно на нём.

1. https://docs.docker.com/compose/reference/envvars/#compose_project_name

# ДЗ №16

Что было сделано:
- Сделано разворачивание инстанса gitlab через terraform и ansible по подобию
того как было сделано в docker-2. docker-compose.yml не используется,
всё заgускается через ansible
- - terraform apply
- - ansible-playbook --tags "docker-container" playbooks/site.yml
- Все задачи связанные с настройкой пайплайна в gitlab
- Задание со * по разворачиванию раннеров. Разворачивание описано в terraform и
ansible
- Задание со *. Интерграция с Slack. Канал https://devops-team-otus.slack.com/messages/CB9HGPYMA

# ДЗ №17

Что было сделано:
- расписал dev-окружение
- расписал stage и production окружения
- добавил условие, которое позволяет выкатывать в stage и на prod только помеченное тегом с версией
- добавил задание, которое определяет динамическое окружение для веток

# ДЗ №18

Что было сделано:
- докер-файл для prometeheus и конфигурация для него
- пересобраны образы сервисов
- добавлены запуск prometheus и node-exporter в docker-compose
- проверены запуск и работоспособность приложения и prometheus
- проверена работоспособность мониторинга прибиванием одного из сервисов
- Ссылка на docker hub https://hub.docker.com/u/overmind88/

# ДЗ №19

Что было сделано:
- мониторинг выделен из docker-compose в docker-compose-monitoring
- в мониторинг добавлены компоненты - cadvisor, grafana, alertmanager
- prometheus собирает метрики из cadvisor
- В grafana сделана визуализация метрик приложения, бизнес-логики, состояния хоста и контейнеров
- Ссылка на docker hub https://hub.docker.com/u/overmind88/

# ДЗ №20

Что было сделано:

 - Обновлено приложение и сотвествующие докер-контейнеры
 - развёрнут EFK
 - настроен сбор cтруктурированых логов во fluentd
 - настроена визуализация логов в kibana
 - добавлен фильтр json
 - настроен сбор неcтруктурированых логов во fluentd
 - добавлен фильтр регулярными выражениями
 - добавлен фильтр grok
 - в систему догирования добавлен трейсинг zipkin
 - в zipkin изучены некоторый трейсы запросов

# ДЗ №21

Что было сделано:

- Созданы описания подов для сервисов
- Развёрнут kubernetes по гайду the-hard-way
- Проверена запускаемость подов с сервисами в kubernetes
