#!/usr/bin/env bash

curr_dir=$(pwd)

# basic utilities
sudo apt-get install -y zsh curl sysstat jq vim git tmux fonts-powerline xsel ncdu htop dmenu direnv
sudo apt-get upgrade -y
sudo apt-get autoremove -y

# install vundle (vim package manager)
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# install asdf version manager
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
cd ~/.asdf
git checkout "$(git describe --abbrev=0 --tags)"
cd ${curr_dir}

# install oh-my-zsh
rm -rf ~/.oh-my-zsh
curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash

# applying the configs, especially useful because oh-my-zsh overwrites stuff
make apply_configurations

# install vim plugins (after config copied)
vim +PluginInstall +qall

echo "You have to install docker"
