#!/usr/bin/env bash

cp ~/.zshrc .zshrc
cp ~/.tmux.conf tmux.conf

git add .
message="automatic update of $date"
git commit -m "$message"