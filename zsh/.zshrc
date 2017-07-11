# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
setopt appendhistory autocd
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' special-dirs true
zstyle :compinstall filename ~/.zshrc

autoload -Uz compinit
compinit
# End of lines added by compinstall

[[ $TMUX = "" ]] && export TERM="xterm-256color"
[[ $COLORTERM == "roxterm" ]] && export  TERM="xterm-256color"

export CLICOLOR=1
export TIMEFMT="real:%*E user:%*U system:%*S %MkB %P %J"

# misc stuff
if [[ -d $HOME/bin ]]; then
	export PATH=$HOME/bin:$PATH
fi
if [[ -d $HOME/man ]]; then
	export MANPATH=$HOME/man:$MANPATH
fi

# for macports / brew / mac python
if [[ $(uname) == "Darwin" ]]; then
	export PATH=/usr/local/bin:$PATH
	export MANPATH=/usr/local/share/man:$MANPATH
	export EDITOR=/usr/bin/vim
	export MP_EDITOR=$HOME/bin/mvim
fi

# for virtualenvwrapper
# install with pip install virtualenvwrapper
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    export WORKON_HOME=~/.virtualenvs
    [ -d $WORKON_HOME ] && source /usr/local/bin/virtualenvwrapper.sh
fi
# for autoenv
if [ -f /usr/local/opt/autoenv/activate.sh ]; then
    source /usr/local/opt/autoenv/activate.sh
fi

if [[ -n "$GNOME_KEYRING_CONTROL" ]]; then
	export SSH_AUTH_SOCK="$GNOME_KEYRING_CONTROL/ssh"
else
    eval `keychain --eval --agents ssh --inherit any id_rsa`
fi

source ~/.aliases

source ~/.oh-my-zsh/custom/color-switcher.zsh

PROMPT="[%T] %(?..%B{%?} %b)%n%(2v.%B@%b.@)%m:%B%~%b%(!.#.>)"
