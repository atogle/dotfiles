#!/usr/bin/env fish

# Ensure we are in the directory of the script to get absolute paths correct
cd (dirname (status -f))
set DOTFILES (pwd)
set exclude_us README.md LICENSE.md install.fish test_config.fish fish .git .DS_Store .gitignore

echo Installing all dotfiles into $USER\'s home directory...
echo "(Existing files will be overwritten)"
for file in $DOTFILES/*
    set filename (basename $file)
    if not contains $filename $exclude_us
        echo $filename
        ln -f -s $file ~/.$filename
    end
end

echo fish/config.fish
ln -f -s $DOTFILES/fish/config.fish ~/.config/fish/config.fish
echo fish/functions
# Create functions directory if it doesn't exist
mkdir -p ~/.config/fish/functions

# Link individual function files instead of the entire directory
for func in $DOTFILES/fish/functions/*.fish
    set func_name (basename $func)
    echo "  $func_name"
    ln -f -s $func ~/.config/fish/functions/$func_name
end
