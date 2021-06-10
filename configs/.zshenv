export GOPATH="$HOME/go"

# Preferred editor for local and remote sessions
export EDITOR='vim'

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export TERM="xterm-256color"

# add kafka cli
export PATH=$PATH:~/bin:~/applications/kafka/bin

export PIPENV_VENV_IN_PROJECT=1

mkdir -p ~/zeppelin
source ~/zeppelin/.zeppelin_env.sh
