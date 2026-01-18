# Default editor
set -x EDITOR vim

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
    abbr --add-global ga 'git add'
    abbr --add-global gs 'git status'
    abbr --add-global gb 'git branch'
    abbr --add-global gca 'git commit -a'
    abbr --add-global gcm 'git commit -m'
    abbr --add-global gco 'git checkout'
    abbr --add-global gd 'git diff'
    abbr --add-global gl 'git log'
    abbr --add-global gp 'git push'
    abbr --add-global gpo 'git push origin'

    # Other useful abbreviations
    abbr --add-global ll '/bin/ls -AFGHhl'
    abbr --add-global brewup 'brew update; brew upgrade; brew cleanup'
    abbr --add-global p 'cd ~/Projects'
    abbr --add-global ls '/bin/ls -FGH'
    abbr --add-global vi 'vim'
    abbr --add-global mkdir 'command mkdir -p'
end
