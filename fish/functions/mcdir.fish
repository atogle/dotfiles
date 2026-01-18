function mcdir --description 'Create directory and cd into it'
    mkdir -p $argv
    and cd $argv
end
