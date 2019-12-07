# Path to your oh-my-zsh installation.
export ZSH="/home/sergej/.oh-my-zsh"

# Set name of the theme to load
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# User configuration

# Preferred editor for local and remote sessions
export EDITOR='vim'

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

source $ZSH/oh-my-zsh.sh

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
  git, bundler, ruby, rake, postgres, pyhton, node, tmux
)

# disable sharing of history between (tmux) terminals / panes
setopt nosharehistory

# added for autocompletion for docker
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i

# added aliases (same as in bash)
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# add golang to path
export PATH=$PATH:/usr/local/go/bin

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# add direnv hook
eval "$(direnv hook zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

eval "$(jump shell)"

