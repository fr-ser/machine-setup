#!/usr/bin/env bash

sudo apt-get install -y zsh docker curl vim git tmux fonts-powerline xsel ncdu
sudo apt-get upgrade -y
sudo apt-get autoremove
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
