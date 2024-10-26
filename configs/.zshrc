# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# Set name of the theme to load
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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
  git, bundler, postgres, python, node, tmux
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

# path for golang installs
export PATH=$PATH:/usr/local/go/bin:~/go/bin

# path for global yarn/npm packages
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# fix for Apple M1 librdkafka dependency
export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include"
export C_INCLUDE_PATH=/opt/homebrew/Cellar/librdkafka/1.9.2/include
export LIBRARY_PATH=/opt/homebrew/Cellar/librdkafka/1.9.2/lib

# add direnv hook
eval "$(direnv hook zsh)"

. $HOME/.asdf/asdf.sh

# set node path correctly - relevant for different nodejs versions with asdf
export NODE_PATH=$NODE_PATH:`npm root -g`

