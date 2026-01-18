function fish_prompt --description 'Write out the prompt'
    set -l last_status $status

    # User@host
    set_color $fish_color_user
    echo -n $USER
    set_color normal
    echo -n '@'
    set_color $fish_color_host
    echo -n (prompt_hostname)
    set_color normal
    echo -n ' '

    # Current directory
    set_color $fish_color_cwd
    echo -n (prompt_pwd)
    set_color normal

    # Git status
    set_color -o yellow
    echo -n (fish_vcs_prompt)
    set_color normal

    # Status indicator
    if test $last_status -ne 0
        set_color $fish_color_status
        echo -n " [$last_status]"
        set_color normal
    end

    echo -n ' > '
end
