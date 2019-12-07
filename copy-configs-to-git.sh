#!/usr/bin/env bash

cp ~/.bash_aliases ./configs/.bash_aliases
cp ~/.zshrc ./configs/.zshrc
cp ~/.zshenv ./configs/.zshenv
cp ~/.vimrc ./configs/.vimrc
cp ~/.prettierrc ./configs/.prettierrc
cp ~/.tmux.conf ./configs/.tmux.conf
cp ~/.tmux/.tmuxline_snapshot ./configs/.tmuxline_snapshot
cp ~/.gitconfig ./configs/.gitconfig
cp ~/.gitignore_global ./configs/.gitignore_global
cp /usr/local/bin/git-graph ./git_commands/git-graph
cp /usr/local/bin/git-push-new ./git_commands/git-push-new
cp ~/.oh-my-zsh/custom/themes/robbyrussell.zsh-theme ./configs/robbyrussell.zsh-theme
cp -r ~/.gitconfs/* ./configs/.gitconfs/
cp -r ~/.config/powerline/* ./configs/powerline/
cp ~/.config/Code/User/settings.json ./configs/Code/User/settings.json
cp /usr/bin/dmenu_run ./configs/dmenu_run
