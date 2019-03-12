#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

stty -ixon # Disable ctrl-s and ctrl-q
shopt -s autocd # Allows you to cd into directory just by typing the dir name

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"
