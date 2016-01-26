# Работа с SSH

## Генерация SSH ключа

```
ssh-keygen -t rsa -b 4096 -C "your.mail@gmail.com"
```

## Публикация ключа

```
ssh-copy-id -i ~/.ssh/my-ssh-public-key my_user@my_host
```
