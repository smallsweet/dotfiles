function tab-reset
    set profile "Default"
    echo -n -e "\033]50;SetProfile=$profile\a"
end

function tabc --argument-names profile
    if not test -n profile
        set profile "Default"
    end
    echo -n -e "\033]50;SetProfile=$profile\a"
end

function vim -w vim
    tabc "Solarized Dark"
    set vimbin (which vim)
    command vim $argv
    tab-reset
end

function ssh -w ssh
    set scheme "Default"
    switch $argv[1]
        case '*dev*'
            tabc "Fishtank"
        case '*'
            tabc "Chalkboard"
    end
    command ssh $argv
    tab-reset
end

set fish_greeting ""

set PATH ~/bin $PATH

# install with pip install virtualfish
eval (python3 -m virtualfish compat_aliases)
