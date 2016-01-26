# Docker

## Генерация образа

```
docker build --no-cache=true --rm=true -t <CONTAINER_NAME> .
```

## Запуск контейнера

Запуск в бэкграунде

```
docker run --name <CONTAINER_NAME> -d --link <ANOTHER_CONTAINER_NAME>:<ANOTHER_CONTAINER_DOMAIN> -p <HOST_PORT>:<CONTAINER_PORT> -v <HOST_PATH>:<CONTAINER_PATH>[:ro|:rw] <IMAGE_NAME>
```

Запуск контейнера для конкретной задачи

```
docker run --name <CONTAINER_NAME> -i -t -v --link <ANOTHER_CONTAINER_NAME>:<ANOTHER_CONTAINER_DOMAIN> -p <HOST_PORT>:<CONTAINER_PORT> -v <HOST_PATH>:<CONTAINER_PATH>[:ro|:rw] <IMAGE_NAME> bash -c '<YOUR_COMMAND>'
```

## Список образов

```
docker images
```

## Удаление образа

```
docker rmi -f <IMAGE_ID>
```

## Убить контейнер

```
docker rm -f -v <IMAGE_ID>
```

## Убить все контейнеры, даже остановленные

```
sudo docker ps -qa | xargs -ig sudo docker rm -f g
```