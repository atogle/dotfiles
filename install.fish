#!/usr/bin/env fish

set exclude_us README.md LICENSE.md install.fish fish

echo Installing all dotfiles into $USER\'s home directory...
for file in *
    if not contains $file $exclude_us
        echo $file
        ln -f -s $PWD/$file ~/.$file
    end
end

echo fish/config.fish
ln -f -s $PWD/fish/config.fish ~/.config/fish/config.fish
echo fish/functions
# Create functions directory if it doesn't exist
mkdir -p ~/.config/fish/functions

# Link individual function files instead of the entire directory
for func in fish/functions/*.fish
    set func_name (basename $func)
    echo "  $func_name"
    ln -f -s $PWD/$func ~/.config/fish/functions/$func_name
end
