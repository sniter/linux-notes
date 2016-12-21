# Linux 

## Perfomance Tools


![Linux Perfomance Tools](https://github.com/sniter/linux-notes/blob/master/images/linux_perfomance_tools.png)


## Открытые порты

```
netstat -tuplen 
```

## Замена строк

```
sed -i.bak s/some\ regexp\ here/replace\ with\ string/g /path/to/your/file
```

## Подстанов переменных окружения в строки

``` shell
echo '$USER' > in.log
cat in.log | envsubst > out.log
cat out.log # ilya
```

Можно использовать следующие способы обозначения переменных
``` shell
$USER
${USER}
```

**ВНИМАНИЕ!**
Выражения `$(date)` обрабатываться командой `envsubst` не будут!

### Экранирование

Когда количество переменных велико - экранировать можно символ доллар через явное объявление переменной
``` shell
export DLR='$'; echo '${DLR}http_server $USER' | envsubst # $http_server ilya
```

Когда количество переменных которыми мы оперируем конечно, то в таком случае можно использовать параметр функции `envsubst`
``` shell
echo '$http_server $USER' | envsubst "$USER"            # $http_server ilya
echo '$http_server $USER' | envsubst "$USER,$USERNAME"  # $http_server ilya
echo '$http_server $USER' | envsubst "$USER,$USERNAME"  # $http_server ilya
```

## Grep

Поиск подстроки/Regexp в папке с файлами
``` shell
grep -nr $YOUR_STRING_OR_REGEXP $PATH
```

Использование Regexp
``` shell
env | grep -P 'USER\w*' 

# Will find:
# USERNAME=ilya
# USER=ilya
```

Вывод только того, что соответствует Регулярному выражению
``` shell
env | grep -oP 'USER\w*'

# Will find:
# USERNAME
# USER
```

Отображать только то, что не соответствует выражению
``` shell
env | grep USER | grep -v NAME

# Will find:
# USER=ilya
```

# Отправка почты (для тестирования отправки почты, например)

``` shell
echo "This is Email Body" | mailx -v -s "This is subject" -S smtp="smtp://localhost:1025" -S from="sender@any.smtp.server.com" recipient@any.smtp.server.com
```

Ответ программы будет приблизительно следующим

```
Resolving host localhost . . . done.
Connecting to 127.0.0.1:1025 . . . connected.
220 41df78f207b4 ESMTP
>>> HELO gigabyte
250 OK: Nice to meet you [172.25.0.1]
>>> MAIL FROM:<sender@any.smtp.server.com>
250 Accepted
>>> RCPT TO:<recipient@any.smtp.server.com>
250 Accepted
>>> DATA
354 End data with <CR><LF>.<CR><LF>
>>> .
250 Message queued as 0pddHCLB
>>> QUIT
```

## Конвертирование кодировки файлов CP1251 -> UTF-8 

```
iconv -f CP1251 -t UTF-8 file.in > file.out
```

## Подсчет занимаемого диска

```
du -hcs
du -ha
```

## Дерево файлов

```
tree -hups --du -F --dirsfirst
```

## Подсчет файлов в директории

```
ll | wc -l
```

## Форматирование USB

```
sudo unmount /dev/sdb
sudo dd if=/dev/zero of=/dev/sdb bs=4k && sync
```

## Запись образа на USB

```
sudo unmount /dev/sdb
sudo dd bs=4M if=Fedora-Server-DVD-x86_64-22.iso of=/dev/sdb
```

## Смена оболочки с Bash на Fish

```
chsh -s /usr/bin/fish
```

# Подтверждение различных действий в системе 

```
yes | pacman -S <My-Package>
```
