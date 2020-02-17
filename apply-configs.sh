#!/usr/bin/env bash

set -e

cp ./configs/.bash_aliases ~/.bash_aliases
cp ./configs/.gitignore_global ~/.gitignore_global
sudo cp ./git_commands/git-graph /usr/local/bin/git-graph
sudo cp ./git_commands/git-push-new /usr/local/bin/git-push-new
cp ./configs/.zshrc ~/.zshrc
cp ./configs/.prettierrc ~/.prettierrc
cp ./configs/.zshenv ~/.zshenv
cp ./configs/.vimrc ~/.vimrc
cp ./configs/.gitconfig ~/.gitconfig
cp ./configs/.default-python-packages ~/.default-python-packages
mkdir -p ~/.tmux/
cp ./configs/.tmuxline_snapshot ~/.tmux/.tmuxline_snapshot
cp ./configs/.tmux.conf ~/.tmux.conf
mkdir -p ~/.oh-my-zsh/custom/themes/
cp ./configs/robbyrussell.zsh-theme ~/.oh-my-zsh/custom/themes/robbyrussell.zsh-theme
cp -r ./configs/.gitconfs/ ~/
mkdir -p ~/.config/
cp -r ./configs/powerline/ ~/.config/
mkdir -p ~/.config/Code/User/
cp ./configs/Code/User/settings.json ~/.config/Code/User/settings.json
cp ./configs/Code/User/keybindings.json ~/.config/Code/User/keybindings.json
cp ./shell_scripts/* ~/.local/bin
sudo cp ./configs/dmenu_run /usr/bin/dmenu_run

echo "Configs applied. All good"
