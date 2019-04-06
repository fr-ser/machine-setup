# Path to your oh-my-zsh installation.
  export ZSH="/home/sergej/.oh-my-zsh"

# Set name of the theme to load 
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# User configuration

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export TERM="xterm-256color"

ZSH_TMUX_AUTOSTART=false
# start tmux if a session is unattached and connect to the first unattached session
if [ -z "$TMUX" ]; then
    attach_session=$(tmux 2> /dev/null ls -F \
        '#{session_attached} #{?#{==:#{session_last_attached},},1,#{session_last_attached}} #{session_id}' |
        awk '/^0/ { if ($2 > t) { t = $2; s = $3 } }; END { if (s) printf "%s", s }')

    if [ -n "$attach_session" ]; then
        tmux attach -t "$attach_session"
    else
	tmux
    fi
fi

DISABLE_UPDATE_PROMPT=true
DISABLE_AUTO_UPDATE=true

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git, bundler, ruby, rake, postgres, pyhton, node, tmux
)

source $ZSH/oh-my-zsh.sh

# nvm plugin with auto detection of nvmrc files

export NVM_AUTO_USE=true
source ~/.zsh-plugins/.zsh-nvm/zsh-nvm.plugin.zsh

# disable sharing of history between (tmux) terminals / panes
setopt nosharehistory

# added for autocompletion for docker
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i

# added aliases (same as in bash)
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

