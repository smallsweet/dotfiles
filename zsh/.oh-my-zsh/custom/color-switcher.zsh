#ITERM_PROFILE_PATH=~/src/github/iTerm2-Color-Schemes
function tabc() {
  NAME=$1; if [ -z "$NAME" ]; then NAME="default"; fi
  # if you have trouble with this, change
  # "Default" to the name of your default theme
  #echo "setting scheme to $NAME ($1)"
  echo -e "\033]50;SetProfile=$NAME\a"
  #$ITERM_PROFILE_PATH/tools/preview.rb "$ITERM_PROFILE_PATH/schemes/$NAME.itermcolors"
}

function tab-reset() {
    NAME="Default"
    echo -e "\033]50;SetProfile=$NAME\a"
}

function colorssh() {
    if [[ -n "$ITERM_SESSION_ID" ]]; then
        scheme="default"
        trap "tab-reset" INT EXIT
        case $* in
            dev*) scheme="Fishtank"
            ;;
            *) scheme="Chalkboard"
            ;;
        esac
        tabc $scheme
    fi
    ssh $*
}
compdef _ssh tabc=ssh

function colorvim() {
    if [[ -n "$ITERM_SESSION_ID" ]]; then
        trap "tab-reset" INT EXIT
        tabc "Solarized Dark"
    fi
    vim $*
}

alias ssh="colorssh"
alias vim="colorvim"
