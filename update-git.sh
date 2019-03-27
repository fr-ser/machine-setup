#!/usr/bin/env bash

cp ~/.bash_aliases .bash_aliases
cp ~/.zshrc .zshrc
cp ~/.vimrc .vimrc
cp ~/.tmux.conf .tmux.conf
cp ~/.gitconfig .gitconfig
cp -r ~/.gitconfs/ .gitconfs/
cp ~/.gitignore_global .gitignore_global
cp ~/.oh-my-zsh/custom/themes/robbyrussell.zsh-theme robbyrussell.zsh-theme
cp -r ~/.config/powerline .

git add .
git commit

