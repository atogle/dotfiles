#!/usr/bin/env fish

set exclude_us README.md LICENSE.md fish

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
ln -f -s $PWD/fish/functions/ ~/.config/fish/