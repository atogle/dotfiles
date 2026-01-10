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

if status is-interactive
    set -g fish_greeting ''

    # Git abbreviations (faster and more flexible than aliases)
    abbr --add ga 'git add'
    abbr --add gs 'git status'
    abbr --add gb 'git branch'
    abbr --add gca 'git commit -a'
    abbr --add gcm 'git commit -m'
    abbr --add gco 'git checkout'
    abbr --add gd 'git diff'
    abbr --add gl 'git log'
    abbr --add gp 'git push'
    abbr --add gpo 'git push origin'

    # Other useful abbreviations
    abbr --add ll '/bin/ls -AFGHhl'
    abbr --add brewup 'brew update; brew upgrade; brew cleanup'
    abbr --add p 'cd ~/Projects'
    abbr --add ls '/bin/ls -FGH'
    abbr --add vi 'vim'
    abbr --add mkdir 'command mkdir -p'
    abbr --add clean 'find . -name'
end
