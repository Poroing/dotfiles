#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias info='info --vi-keys'
alias desmume='primusrun desmume'
alias winejap='LC_ALL="ja_JP.utf8" wine'
alias cb='xsel | xsel -b'

export PATH=/opt/android-sdk/platform-tools/:$PATH

RED_FOREGROUND="\[$(tput setaf 9)\]"
RED_BACKGROUND="\[$(tput setab 9)\]"
WHITE_FOREGROUND="\[$(tput setaf 15)\]"
WHITE_BACKGROUND="\[$(tput setaf 15)\]"
RESET="\[$(tput sgr0)\]"

BROWSER=/usr/bin/firefox

#PS1="${RED_BACKGROUND}${WHITE_FOREGROUND}▓▒░ \W ░▒▓${RESET} "

[[ $- = *i* ]] && source /usr/bin/liquidprompt
