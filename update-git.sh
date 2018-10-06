#!/usr/bin/env bash

cp ~/.zshrc .zshrc
cp ~/.tmux.conf .tmux.conf
cp ~/.gitconfig .gitconfig
cp -r ~/.gitconfs/ .gitconfs/

git add .
message="automatic update of $date"
git commit -m "$message"