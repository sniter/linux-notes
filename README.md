# Заметки линуксоеда

## Содержание

* [Общие команды](./linux.md)
* [Особенности Fedora](./fedora.md)
* Специфика работы с приложениями
*  [Docker](./docker.md)
*  [Git](./git.md)
*  [Postgres](./postgres.md)
*  [SSH](./ssh.md)
* Системные службы
*  [Журналирование](./journalctl.md)

## Установка зависимостей в системе

```
curl https://raw.githubusercontent.com/sniter/linux-notes/master/fedora.sh | bash
```

## Конвертирование аудиофайлов
```
for f in ./*.m4a; do ffmpeg -i "$f" -v 5 -y -acodec libmp3lame -ac 2 -ab 192k "${f%.m4a}.mp3"; done
```

# Подтверждение различных действий в системе 

```
yes | pacman -S <My-Package>
```

# Нехватка вотчеров в системе

```
sudo sysctl fs.inotify.max_user_watches=524288
```

## Игры

### Enable CS at Ubuntu:`

```
setsebool -P selinuxuser_execheap 1
```

### Enable Eurotruck Simulator at Fedora 20:

```
sudo dnf install libtxc_dxtn
```

## Загрузка файлов

```
aria2c.exe --seed-time=0 \[rutracker.org\].t4575031.torrent
aria2c.exe --seed-time=0 die_hard_2.torrent
```

### Cкачивание видосиков

```
youtube-dl -x --audio-format mp3 --audio-quality 0 'https://www.youtube.com/watch?v=7egM-WvaNho'
youtube-dl -x --audio-format mp3 --audio-quality 0 --playlist-start 1 'https://www.youtube.com/watch?v=kX_pzzWtpYc&list=UUPd8-0dbOIaT4gYaFfQoSeQ'
```

# Отправка Growl сообщения (GNOME)

```
notify-send --app-name="<APPLICATION_NAME>" --icon="<PATH_TO_ICON>" "<TITLE>" "<MESSAGE>"
```

## Вывод Pretty JSON:

```
echo $FILE | python -m json.tool # Внимание! Utf-8 символы перекодируются
echo $FILE | ruby -r json -e 'jj JSON.parse gets'
```

## Bluetooth Менеджмент

```
bluetoothctl
bluetoothctl list
bluetoothctl scan on
bluetoothctl pair <MAC-ADDR>
bluetoothctl connect <MAC-ADDR>
bluetoothctl connect <MAC-ADDR>
```


## Отключение надоедающих нотификейшнов при подключении телефона

1. Установка dconf editor
2. Выставляем org.gnome.desktop.media-handling.autorun-never=off






	
