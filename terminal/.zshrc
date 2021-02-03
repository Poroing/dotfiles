# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
alias cb='xsel | xsel -b'
alias maxima='rlwrap maxima'
alias open='xdg-open'

export BROWSER="/usr/bin/qutebrowser --qt-flag single-process"
export EDITOR="vim"

# [[ $- = *i* ]] && source /usr/bin/liquidprompt
#source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

#GPG
GPG_TTY=$(tty)
export GPG_TTY

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
