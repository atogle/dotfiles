#!/usr/bin/env fish

# Source the config file
source fish/config.fish

# Check if abbreviations are defined
echo "Checking abbreviations:"
abbr -l

# Check PATH
echo -e "\nChecking PATH:"
echo $PATH

# Check EDITOR
echo -e "\nChecking EDITOR:"
echo $EDITOR

# Check NODE_PATH
echo -e "\nChecking NODE_PATH:"
echo $NODE_PATH

# Try to use an abbreviation (this won't work in a script, but we can check if it's defined)
echo -e "\nAbbreviation expansions:"
abbr -s
