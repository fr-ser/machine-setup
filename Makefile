.DEFAULT_GOAL := help

# Show this help prompt.
help:
	@ echo '  Usage:'
	@ echo '    make <target>'
	@ echo ''
	@ echo '  Targets:'
	@ awk '/^#/{ comment = substr($$0,3) } comment && /^[a-zA-Z][a-zA-Z0-9_-]+ ?:/{ print "   ", $$1, comment }' $(MAKEFILE_LIST) | column -t -s ':'

# Applies the configuration from this repo to the machine
apply-configurations:
	@# shell configuration
	cp ./configs/.bash_aliases ~/.bash_aliases
	cp ./configs/.bashrc ~/.bashrc
	cp ./configs/.zshrc ~/.zshrc
	cp ./configs/.zshenv ~/.zshenv
	mkdir -p ~/.oh-my-zsh/custom/themes/
	cp ./configs/robbyrussell.zsh-theme ~/.oh-my-zsh/custom/themes/robbyrussell.zsh-theme

	@# git configuration
	@# The stored .gitconfig contains only portable settings (no identity, no machine-specific
	@# paths). Any [includeIf] blocks already in ~/.gitconfig are preserved across applies so
	@# that per-folder identity files (e.g. ~/.gitconfig-work, ~/.gitconfig-private) keep working.
	@# On a fresh machine those files don't exist yet — create them manually after the first apply
	@# and add the matching [includeIf] entries to ~/.gitconfig. See README for details.
	cp ./configs/.gitignore_global ~/.gitignore_global
	@grep -A1 '^\[includeIf' ~/.gitconfig > /tmp/gitconfig-includes 2>/dev/null || true
	cp ./configs/.gitconfig ~/.gitconfig
	@cat /tmp/gitconfig-includes >> ~/.gitconfig
	
	@# tmux configuration
	mkdir -p ~/.tmux/
	cp ./configs/tmux/.tmux.conf ~/.tmux.conf
	cp ./configs/tmux/.tmuxline_snapshot ~/.tmux/.tmuxline_snapshot
	
	cp ./configs/.prettierrc ~/.prettierrc
	cp ./configs/.vimrc ~/.vimrc
	cp ./configs/.default-python-packages ~/.default-python-packages

	@# claude code configuration
	mkdir -p ~/.claude
	sed "s|~/.claude|$(HOME)/.claude|g" ./configs/claude/settings.json > ~/.claude/settings.json

	@# vscode configuration
	cp ./configs/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
	cp ./configs/vscode/mcp.json ~/Library/Application\ Support/Code/User/mcp.json

	@# copilot configuration
	mkdir -p ~/.copilot/hooks ~/.copilot/instructions ~/.copilot/utils
	cp ./configs/copilot/hooks/nudge.json ~/.copilot/hooks/nudge.json
	cp ./configs/copilot/instructions/nudge-me.instructions.md ~/.copilot/instructions/nudge-me.instructions.md
	cp ./configs/copilot/utils/nudge-me.sh ~/.copilot/utils/nudge-me.sh
	chmod +x ~/.copilot/utils/nudge-me.sh

ifeq ($(shell uname -s), Linux)
	@# dmenu configuration and scripts
	mkdir -p ~/.local/bin
	cp ./dmenu/*.sh ~/.local/bin
	sudo cp ./dmenu/dmenu_run /usr/bin/dmenu_run

	@# tmux configuration
	cp ./configs/tmux/linux/status_cpu.sh ~/.tmux/status_cpu.sh
	cp ./configs/tmux/linux/status_memory.sh ~/.tmux/status_memory.sh
else ifeq ($(shell uname -s), Darwin)
	@# tmux configuration
	cp ./configs/tmux/macos/status_cpu.sh ~/.tmux/status_cpu.sh
	cp ./configs/tmux/macos/status_memory.sh ~/.tmux/status_memory.sh
else
	echo "Unsupported system"
	exit 1
endif
	@echo "Configs applied. All good"

# Copies the currently applied configuration from this machine to this repo
copy-configurations-to-git:
	cp ~/.bash_aliases ./configs/.bash_aliases
	cp ~/.bashrc ./configs/.bashrc
	cp ~/.zshrc ./configs/.zshrc
	cp ~/.zshenv ./configs/.zshenv
	cp ~/.vimrc ./configs/.vimrc
	cp ~/.prettierrc ./configs/.prettierrc

	@# tmux configuration
	cp ~/.tmux.conf ./configs/tmux/.tmux.conf
	cp ~/.tmux/.tmuxline_snapshot ./configs/tmux/.tmuxline_snapshot

	@# Strip identity (name/email/user), [includeIf] blocks, and paths to per-identity files
	@# before saving — none of that belongs in the repo.
	cat ~/.gitconfig | sed -r '/(name|email|user|includeIf|\.gitconfig-)/d' > ./configs/.gitconfig
	cp ~/.gitignore_global ./configs/.gitignore_global
	cp ~/.default-python-packages ./configs/.default-python-packages
	cp ~/.oh-my-zsh/custom/themes/robbyrussell.zsh-theme ./configs/robbyrussell.zsh-theme

	@# claude code configuration
	cp ~/.claude/settings.json ./configs/claude/settings.json

	@# vscode configuration
	cp ~/Library/Application\ Support/Code/User/settings.json ./configs/vscode/settings.json
	cp ~/Library/Application\ Support/Code/User/mcp.json ./configs/vscode/mcp.json

	@# copilot configuration
	cp ~/.copilot/hooks/nudge.json ./configs/copilot/hooks/nudge.json
	cp ~/.copilot/instructions/nudge-me.instructions.md ./configs/copilot/instructions/nudge-me.instructions.md
	cp ~/.copilot/utils/nudge-me.sh ./configs/copilot/utils/nudge-me.sh

ifeq ($(shell uname -s), Linux)
	@# dmenu configuration and scripts
	cp /usr/bin/dmenu_run ./dmenu/dmenu_run

	@# tmux configuration
	cp ~/.tmux/status_cpu.sh ./configs/tmux/linux/status_cpu.sh
	cp ~/.tmux/status_memory.sh ./configs/tmux/linux/status_memory.sh
else ifeq ($(shell uname -s), Darwin)
	@# tmux configuration
	cp ~/.tmux/status_cpu.sh ./configs/tmux/macos/status_cpu.sh
	cp ~/.tmux/status_memory.sh ./configs/tmux/macos/status_memory.sh
else
	echo "Unsupported system"
	exit 1
endif

# Install software
install-software:
ifeq ($(shell uname -s), Linux)
	./helper_scripts/install-software-ubuntu.sh
else ifeq ($(shell uname -s), Darwin)
	./helper_scripts/install-software-mac.sh
else
	echo "Unsupported system"
	exit 1
endif
