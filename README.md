# Заметки линуксоеда

## Удаление репозитория
```
cd /etc/yum.repos.d/ - там удалить ненужный реп
```

# Нехватка вотчеров в системе
```
sudo sysctl fs.inotify.max_user_watches=524288
```

## Журналирование
```
#!bash
journalctl
```

### Размер журнала
```
#!bash
journalctl --disk-usage
```

### Просмотр журнала контейнера
```
#!bash
journalctl -f CONTAINER_NAME=db
```

## Журнал последней сессии

```
#!bash
journalctl -b
```

## Игры

### Enable CS at Ubuntu:
setsebool -P selinuxuser_execheap 1

### Enable Eurotruck Simulator at Fedora 20:
sudo yum install libtxc_dxtn
 

## Загрузка файлов

aria2c.exe --seed-time=0 \[rutracker.org\].t4575031.torrent
aria2c.exe --seed-time=0 die_hard_2.torrent
		
## Установка приложений
sudo dnf install -y git htop nmon bmon vlc zsh tmux vim aria2 docker ansible 
# Python installation
sudo dnf install -y python-pip python-ipython rpm-build python-devel
sudo pip install petl xlrd xlwt-future openpyxl
# Ruby RVM
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
gpg2 --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable
source ~/.profile
rvm install 2.2.3
gem install ruby-fann tmuxinator

Запись образа на USB
sudo unmount /dev/sdb
sudo dd bs=4M if=Fedora-Server-DVD-x86_64-22.iso of=/dev/sdb

Форматирование USB
sudo unmount /dev/sdb
sudo dd if=/dev/zero of=/dev/sdb bs=4k && sync

Отправка Growl сообщения
notify-send --app-name="Blinks" --icon="/home/ilya/projects/blinks-parser/assets/icon.png" "Blinks Parser" "Hello, World!"

Генерация SSH ключа
ssh-keygen -t rsa -C "sniter@gmail.com"

Публикация ключа
ssh-copy-id -i ~/.ssh/my-ssh-public-key my_user@my_host

Смена оболочки с Bash на Fish
chsh -s /usr/bin/fish

Вывод Pretty JSON:
echo $FILE | python -m json.tool # Внимание! Utf-8 символы перекодируются
echo $FILE | ruby -r json -e 'jj JSON.parse gets'

Подсчет файлов в директории
ll | wc -l


Подсчет занимаемого диска
du -hcs
du -ha

Определить к какому пакету относится файл
rpm -qf /usr/bin/fish

bluetooth Менеджмент
bluetoothctl
bluetoothctl list
bluetoothctl scan on
bluetoothctl pair <MAC-ADDR>
bluetoothctl connect <MAC-ADDR>
bluetoothctl connect <MAC-ADDR>

Открытые порты
netstat -tuplen 

Cкачивание видосиков
youtube-dl -x --audio-format mp3 --audio-quality 0 'https://www.youtube.com/watch?v=7egM-WvaNho'
youtube-dl -x --audio-format mp3 --audio-quality 0 --playlist-start 1 'https://www.youtube.com/watch?v=kX_pzzWtpYc&list=UUPd8-0dbOIaT4gYaFfQoSeQ'

Конвертирование кодировки файлов
# CP1251 -> UTF-8
iconv -f CP1251 -t UTF-8 file.in > file.out

Отключение надоедающих нотификейшнов при подключении телефона
1. Установка dconf editor
2. Выставляем org.gnome.desktop.media-handling.autorun-never=off

Выключение Selinux
sudo vim /etc/selinux/config
SELINUX=disabled
# Или в одну строку
sudo sed -i.bak s/SELINUX=enforcing/SELINUX=disabled/g /etc/selinux/config



Замена строк в Linux
sed -i.bak s/some\ regexp\ here/replace\ with\ string/g /path/to/your/file

Поиск подстроки/Regexp в папке с файлами
grep -nr $YOUR_STRING_OR_REGEXP $PATH
