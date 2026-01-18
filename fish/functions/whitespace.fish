function whitespace --description 'Remove trailing whitespace from all files in current directory'
    find . -not \( -name .svn -prune -o -name .git -prune \) -type f -print0 | xargs -0 sed -i "" -E "s/[[:space:]]*\$//"
end
