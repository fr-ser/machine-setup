#!/usr/bin/env bash

cp ~/.bash_aliases ./configs/.bash_aliases
cp ~/.zshrc ./configs/.zshrc
cp ~/.zshenv ./configs/.zshenv
cp ~/.vimrc ./configs/.vimrc
cp ~/.prettierrc ./configs/.prettierrc
cp ~/.tmux.conf ./configs/tmux/.tmux.conf
cp ~/.tmux/.tmuxline_snapshot ./configs/tmux/.tmuxline_snapshot
cp ~/.tmux/status_cpu.zsh ./configs/tmux/status_cpu.zsh
cp ~/.tmux/status_memory.sh ./configs/tmux/status_memory.sh
cp ~/.gitconfig ./configs/.gitconfig
cp ~/.gitignore_global ./configs/.gitignore_global
cp ~/.default-python-packages ./configs/.default-python-packages
cp /usr/local/bin/git-graph ./git_commands/git-graph
cp /usr/local/bin/git-push-new ./git_commands/git-push-new
cp ~/.oh-my-zsh/custom/themes/robbyrussell.zsh-theme ./configs/robbyrussell.zsh-theme
cp -r ~/.gitconfs/* ./configs/.gitconfs/
cp ~/.config/Code/User/settings.json ./configs/Code/User/settings.json
cp ~/.config/Code/User/keybindings.json ./configs/Code/User/keybindings.json
cp /usr/bin/dmenu_run ./configs/dmenu_run
