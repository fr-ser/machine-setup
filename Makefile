.PHONY: help apply_configurations copy_configurations_to_git install_software

help:
	@grep -B1 -E "^[a-zA-Z0-9_-]+\:([^\=]|$$)" Makefile \
		| grep -v -- -- \
		| sed 'N;s/\n/###/' \
		| sed -n 's/^#: \(.*\)###\(.*\):.*/\2:###\1/p' \
		| column -t  -s '###'

#: Applies the configuration from this repo to the machine
apply_configurations:
	@# shell configuration
	cp ./configs/.bash_aliases ~/.bash_aliases
	cp ./configs/.bashrc ~/.bashrc
	cp ./configs/.zshrc ~/.zshrc
	cp ./configs/.zshenv ~/.zshenv
	mkdir -p ~/.oh-my-zsh/custom/themes/
	cp ./configs/robbyrussell.zsh-theme ~/.oh-my-zsh/custom/themes/robbyrussell.zsh-theme

	@# git configuration
	cp ./configs/.gitignore_global ~/.gitignore_global
	sudo cp ./git_commands/git-graph /usr/local/bin/git-graph
	sudo cp ./git_commands/git-push-new /usr/local/bin/git-push-new
	cp ./configs/.gitconfig ~/.gitconfig
	
	@# tmux configuration
	mkdir -p ~/.tmux/
	cp ./configs/tmux/.tmux.conf ~/.tmux.conf
	cp ./configs/tmux/.tmuxline_snapshot ~/.tmux/.tmuxline_snapshot
	cp ./configs/tmux/status_cpu.zsh ~/.tmux/status_cpu.zsh
	cp ./configs/tmux/status_memory.sh ~/.tmux/status_memory.sh
	
	cp ./configs/.prettierrc ~/.prettierrc
	cp ./configs/.vimrc ~/.vimrc
	cp ./configs/.default-python-packages ~/.default-python-packages
	
	@# dmenu configuration and scripts
	mkdir -p ~/.local/bin
	cp ./dmenu/*.sh ~/.local/bin
	sudo cp ./dmenu/dmenu_run /usr/bin/dmenu_run

	@echo "Configs applied. All good"

#: Copies the currently aplied configuration from this machine to this repo
copy_configurations_to_git:
	cp ~/.bash_aliases ./configs/.bash_aliases
	cp ~/.bashrc ./configs/.bashrc
	cp ~/.zshrc ./configs/.zshrc
	cp ~/.zshenv ./configs/.zshenv
	cp ~/.vimrc ./configs/.vimrc
	cp ~/.prettierrc ./configs/.prettierrc
	cp ~/.tmux.conf ./configs/tmux/.tmux.conf
	cp ~/.tmux/.tmuxline_snapshot ./configs/tmux/.tmuxline_snapshot
	cp ~/.tmux/status_cpu.zsh ./configs/tmux/status_cpu.zsh
	cp ~/.tmux/status_memory.sh ./configs/tmux/status_memory.sh
	cat ~/.gitconfig | sed -r '/(name|email|user)/d' > ./configs/.gitconfig
	cp ~/.gitignore_global ./configs/.gitignore_global
	cp ~/.default-python-packages ./configs/.default-python-packages
	cp /usr/local/bin/git-graph ./git_commands/git-graph
	cp /usr/local/bin/git-push-new ./git_commands/git-push-new
	cp ~/.oh-my-zsh/custom/themes/robbyrussell.zsh-theme ./configs/robbyrussell.zsh-theme
	cp /usr/bin/dmenu_run ./dmenu/dmenu_run

install_software:
	.helper_scripts/install-software.sh
