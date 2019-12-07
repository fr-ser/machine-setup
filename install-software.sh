#!/usr/bin/env bash

# basic utilities
sudo apt-get install -y zsh curl vim git tmux fonts-powerline xsel ncdu htop dmenu direnv jump
# developer features for pyenv
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev python-openssl git
sudo apt-get upgrade -y
sudo apt-get autoremove -y

# install pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

# install vundle (vim package manager)
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# install node-version-manager (nvm)
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

# install oh-my-zsh
rm -rf ~/.oh-my-zsh
curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash

# applying the configs, especially useful because oh-my-zsh overwrites stuff
source ./apply-configs.sh

# install vim plugins (after config copied)
vim +PluginInstall +qall

echo "You have to install docker"
