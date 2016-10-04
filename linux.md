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

## Поиск подстроки/Regexp в папке с файлами

```
grep -nr $YOUR_STRING_OR_REGEXP $PATH
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
