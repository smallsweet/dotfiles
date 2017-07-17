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
    command vim $argv
    tab-reset
end

function colorpick
    set scheme "Default"
    switch $argv[1]
        case '*dev*'
            set scheme "Fishtank"
        case '*'
            set scheme "Chalkboard"
    end
    tabc $scheme
end
    
function ssh -w ssh
    colorpick $argv
    command ssh $argv
    tab-reset
end

function ssh2hc -w ssh
    colorpick $argv
    command ssh2hc $argv
    tab-reset
end

function ssh2rds -w ssh
    colorpick $argv
    command ssh2rds $argv
    tab-reset
end

set fish_greeting ""

set PATH ~/bin $PATH

# install with pip install virtualfish
eval (python3 -m virtualfish compat_aliases)
