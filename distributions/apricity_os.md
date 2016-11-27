# Минимум для установки


```
sudo pacman -S git tmux youtube-dl jdk8-openjdk openssh aria2 tmux wget \
     dosfstools exfat-utils ntfs-3g \
     htop glances \
     ffmpeg vlc audacious audacious-plugins
```

# Установка ZSH зависимостей 

```
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git .zsh-highlight
```

# Установка Sublime Text 3
```
yaourt -S sublime-text-dev
```