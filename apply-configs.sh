#!/usr/bin/env bash

cp ./configs/.bash_aliases ~/.bash_aliases
cp ./configs/.gitignore_global ~/.gitignore_global
sudo cp ./git_commands/git-graph /usr/local/bin/git-graph
sudo cp ./git_commands/git-push-new /usr/local/bin/git-push-new
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
mkdir -p ~/.config/Code/User/
cp -r ./configs/Code/User/settings.json ~/.config/Code/User/settings.json

echo "Configs applied. All good"
