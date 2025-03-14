set -g fish_greeting ''

# Default editor
set -x EDITOR (command -s vim)

# Node path
set -x NODE_PATH /usr/local/lib/node_modules

# PATH manipulation using Fish 4.0 path variable type
fish_add_path /usr/local/bin
fish_add_path /usr/local/sbin
fish_add_path $HOME/bin

# Check for Apple Silicon Homebrew
if test -d /opt/homebrew
    fish_add_path /opt/homebrew/bin
    fish_add_path /opt/homebrew/sbin
end

# Git abbreviations (faster and more flexible than aliases)
abbr -a ga 'git add'
abbr -a gs 'git status'
abbr -a gb 'git branch'
abbr -a gca 'git commit -a'
abbr -a gcm 'git commit -m'
abbr -a gco 'git checkout'
abbr -a gd 'git diff'
abbr -a gl 'git log'
abbr -a gp 'git push'
abbr -a gpo 'git push origin'

# Other useful abbreviations
abbr -a ll '/bin/ls -AFGHhl'
abbr -a brewup 'brew update; brew upgrade; brew cleanup'
abbr -a p 'cd ~/Projects'
abbr -a ls '/bin/ls -FGH'
abbr -a vi 'vim'
abbr -a mkdir 'command mkdir -p'
abbr -a clean 'find . -name'
