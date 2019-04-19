#!/usr/bin/env bash

cp ./configs/.bash_aliases ~/.bash_aliases
cp ./configs/.gitignore_global ~/.gitignore_global
sudo cp ./configs/git-graph /usr/local/bin/git-graph
cp ./configs/.zshrc ~/.zshrc
cp ./configs/.zshenv ~/.zshenv
cp ./configs/.vimrc ~/.vimrc
cp ./configs/.gitconfig ~/.gitconfig
mkdir -p ~/.tmux/
cp ./configs/.tmuxline_snapshot ~/.tmux/.tmuxline_snapshot
cp ./configs/.tmux.conf ~/.tmux.conf
mkdir -p ~/.oh-my-zsh/custom/themes/
cp ./configs/robbyrussell.zsh-theme ~/.oh-my-zsh/custom/themes/robbyrussell.zsh-theme
cp -r ./configs/.gitconfs/ ~/
mkdir -p ~/.config/
cp -r ./configs/powerline/ ~/.config/

echo "Configs applied. All good"
