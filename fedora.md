# Main post-install actions

## Common dependencies

```
# Install common deps
sudo install -y htop glances vlc vim git zsh aria2 youtube-de ffmpeg tmux glances

# Install Zsh deps
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git .zsh-highlight

# Install Ranger
install highlight atool caca-utils poppler-utils ranger

# Install Python tools
sudo pip install --upgrade pip
sudo pip install percol

```
