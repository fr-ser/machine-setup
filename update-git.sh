#!/usr/bin/env bash

cp ~/.zshrc .zshrc
cp ~/.tmux.conf .tmux.conf
cp ~/.gitconfig .gitconfig
cp -r ~/.gitconfs/ .gitconfs/

git add .
now=$(date)
message="automatic update of $now"
git commit -m "$message"
