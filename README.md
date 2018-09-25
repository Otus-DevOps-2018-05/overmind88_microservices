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
