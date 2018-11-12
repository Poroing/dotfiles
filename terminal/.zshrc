# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' menu select
zstyle :compinstall filename '/home/jean/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install

alias ls='ls --color=auto'
alias la='ls --color=auto -a'
alias cp='advcp -g'
alias mv='advmv -g'
alias info='info --vi-keys'
alias desmume='primusrun desmume'
alias winejap='LC_ALL="ja_JP.utf8" wine'
alias cb='xsel | xsel -b'
alias discord='PATH="" /usr/bin/discord'
alias glances='glances --theme-white -1'

export BROWSER="/usr/bin/qutebrowser"

[[ $- = *i* ]] && source /usr/bin/liquidprompt

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
