#!/usr/bin/env fish

# Ensure we are in the directory of the script to get absolute paths correct
cd (dirname (status -f))
set DOTFILES (pwd)
set exclude_us README.md LICENSE.md install.fish test_config.fish fish .git .DS_Store .gitignore Brewfile CLAUDE.md

echo "Installing dotfiles for $USER..."
echo "(Existing files will be overwritten)"
echo

# Brewfile first - installs Fish and other dependencies
echo "=== Homebrew Packages ==="
echo Brewfile
ln -f -s $DOTFILES/Brewfile ~/.Brewfile
echo "Running brew bundle to install packages..."
brew bundle install --global
echo

echo "=== Dotfiles ==="
for file in $DOTFILES/*
    set filename (basename $file)
    if not contains $filename $exclude_us
        echo $filename
        ln -f -s $file ~/.$filename
    end
end

# Claude Code global instructions
echo CLAUDE.md
mkdir -p ~/.claude
ln -f -s $DOTFILES/CLAUDE.md ~/.claude/CLAUDE.md

echo
echo "=== Fish Shell ==="
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

echo
echo "=== Default Shell ==="

# Get the path to Fish
set FISH_PATH (which fish)

# Check if Fish is already in /etc/shells
if not grep -q "^$FISH_PATH\$" /etc/shells
    echo "Adding $FISH_PATH to /etc/shells (requires sudo)..."
    echo $FISH_PATH | sudo tee -a /etc/shells > /dev/null
else
    echo "Fish is already in /etc/shells"
end

# Check if Fish is already the default shell
if test "$SHELL" != "$FISH_PATH"
    echo "Changing default shell to Fish (requires password)..."
    chsh -s $FISH_PATH
    echo "✓ Default shell changed to Fish"
    echo "  Restart your terminal for this to take effect"
else
    echo "Fish is already your default shell"
end

echo
echo "=== Complete ==="
echo "✓ Installation complete!"
echo
echo "Reloading Fish configuration..."
source ~/.config/fish/config.fish
echo "✓ Configuration reloaded - all abbreviations and settings are now active!"
