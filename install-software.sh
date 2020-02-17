#!/usr/bin/env bash

curr_dir=$(pwd)

# basic utilities
sudo apt-get install -y zsh curl vim git tmux fonts-powerline xsel ncdu htop dmenu direnv jump
sudo apt-get upgrade -y
sudo apt-get autoremove -y

# install vundle (vim package manager)
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# install asdf version manager
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
cd ~/.asdf
git checkout "$(git describe --abbrev=0 --tags)"
cd ${curr_dir}

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
