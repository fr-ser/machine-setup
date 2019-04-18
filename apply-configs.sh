#!/usr/bin/env bash

cp .bash_aliases ~/.bash_aliases
cp .gitignore_global ~/.gitignore_global
cp .zshrc ~/.zshrc
cp .vimrc ~/.vimrc
cp .gitconfig ~/.gitconfig
mkdir -p ~/.tmux/
cp .tmuxline_snapshot ~/.tmux/.tmuxline_snapshot
cp .tmux.conf ~/.tmux.conf
mkdir -p ~/.oh-my-zsh/custom/themes/
cp ./robbyrussell.zsh-theme ~/.oh-my-zsh/custom/themes/robbyrussell.zsh-theme 
cp -r .gitconfs/ ~/.gitconfs/
mkdir -p ~/.config/
cp -r ./powerline/ ~/.config/powerline
