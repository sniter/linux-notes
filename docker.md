# Docker

## Получить IP хоста для проброса в докер

``` shell
ifconfig docker0 | grep 'inet' | awk '{print $2}' | sed 's/addr://'
```

## Генерация образа

``` shell
docker build --no-cache=true --rm=true -t <CONTAINER_NAME> .
```

## Запуск контейнера

Запуск в бэкграунде

```
docker run -d \
  --name <CONTAINER_NAME> \
  --link <ANOTHER_CONTAINER_NAME>:<ANOTHER_CONTAINER_DOMAIN> \
  -p <HOST_PORT>:<CONTAINER_PORT> \
  -v <HOST_PATH>:<CONTAINER_PATH>[:ro|:rw] 
  <IMAGE_NAME>[:<IMAGE_VERSION>|latest]
```

Запуск контейнера для конкретной задачи

```
docker run --name <CONTAINER_NAME> \
  -i -t -v \
  --link <ANOTHER_CONTAINER_NAME>:<ANOTHER_CONTAINER_DOMAIN> \
  -p <HOST_PORT>:<CONTAINER_PORT> \
  -v <HOST_PATH>:<CONTAINER_PATH>[:ro|:rw] \
  <IMAGE_NAME>[:<IMAGE_VERSION>|latest] \
  bash -c '<YOUR_COMMAND>'
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

## Просмотр журнала контейнера

```
journalctl -f CONTAINER_NAME=<CONTAINER_NAME>
```