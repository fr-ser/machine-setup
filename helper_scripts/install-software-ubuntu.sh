#!/usr/bin/env bash

set -e

curr_dir=$(pwd)

sudo apt update
# basic utilities
sudo apt install -y \
    zsh curl sysstat jq vim git tmux fonts-powerline xsel ncdu htop dmenu direnv sqlite3 make \
    chrome-gnome-shell
# packages to build python
sudo apt install -y --no-install-recommends \
    build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev \
    libreadline-dev libffi-dev wget python3-dev libsqlite3-dev libbz2-dev llvm xz-utils tk-dev \
    libxml2-dev libxmlsec1-dev liblzma-dev

sudo apt upgrade -y
sudo apt autoremove -y

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

echo "What else to install manually: Docker"
echo ""
