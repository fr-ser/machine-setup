#!/usr/bin/env bash

cp ~/.zshrc .zshrc

git add .
message="automatic update of $date"
git commit -m "$message"