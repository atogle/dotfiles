set -g fish_greeting ''

set -x EDITOR (which vim)
set -x NODE_PATH /usr/local/lib/node_modules
set -x PATH /usr/local/bin $PATH
set -x PATH /usr/local/sbin $PATH
set -x PATH $HOME/bin $PATH
set -x PATH /Applications/Postgres.app/Contents/Versions/latest/bin $PATH

source ~/.iterm2_shell_integration.(basename $SHELL)
status --is-interactive; and source (rbenv init -|psub)