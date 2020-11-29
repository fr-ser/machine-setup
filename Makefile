apply_configurations:
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
	cp ./configs/tmux/.tmux.conf ~/.tmux.conf
	cp ./configs/tmux/.tmuxline_snapshot ~/.tmux/.tmuxline_snapshot
	cp ./configs/tmux/status_cpu.zsh ~/.tmux/status_cpu.zsh
	cp ./configs/tmux/status_memory.sh ~/.tmux/status_memory.sh
	mkdir -p ~/.oh-my-zsh/custom/themes/
	cp ./configs/robbyrussell.zsh-theme ~/.oh-my-zsh/custom/themes/robbyrussell.zsh-theme
	cp -r ./configs/.gitconfs/ ~/
	mkdir -p ~/.config/
	mkdir -p ~/.config/Code/User/
	cp ./configs/Code/User/settings.json ~/.config/Code/User/settings.json
	cp ./configs/Code/User/keybindings.json ~/.config/Code/User/keybindings.json
	cp ./shell_scripts/* ~/.local/bin
	sudo cp ./configs/dmenu_run /usr/bin/dmenu_run

	@echo "Configs applied. All good"

copy_configurations_to_git:
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

install_software:
	./install-software.sh
