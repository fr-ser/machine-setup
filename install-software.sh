#!/usr/bin/env bash

set -e

curr_dir=$(pwd)

sudo apt update
# basic utilities
sudo apt install -y \
    zsh curl sysstat jq vim git tmux fonts-powerline xsel ncdu htop dmenu direnv sqlite3 make
# packages to build python
sudo apt install --no-install-recommends build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev \
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

# docker
echo "Trying to install docker. This is a bit brittele"
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo groupadd docker || true
sudo usermod -aG docker $USER
echo "To run docker without sudo you need to log out and back in"
sudo curl -L \
    "https://github.com/docker/compose/releases/download/1.28.0/docker-compose-$(uname -s)-$(uname -m)" \
    -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
