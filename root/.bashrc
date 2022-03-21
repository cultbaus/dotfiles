#!/bin/bash

#
# ~/.bashrc
#

[ -f ~/.cache/pap/colors ] && . ~/.cache/pap/colors

export PS1="-> "
export XDG_DESKTOP_DIR=~/
export XDG_CONFIG_HOME=~/.config
export XDG_CACHE_HOME=~/.cache
export XDG_MUSIC_DIR=~/media/music
export XDG_VIDEOS_DIR=~/media/videos
export XDG_DOWNLOAD_DIR=~/media/downloads
export XDG_PICTURES_DIR=~/media/pictures
export XDG_DOCUMENTS_DIR=~/media/documents
export EDITOR="nvim"
export VISUAL="nvim"
export PAP_DIR=~/media/palettes
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export GPG_TTY=$(tty)

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias sudo='sudo '
alias fuck='sudo $(history -p !!)'
alias ls='ls --color=always'
alias las="ls -h --author --time-style=long-iso -dUl -- .* * | awk '{if(NR>2)print \$5, \$7, \$9}'"
alias mkdir="mkdir -pv"
alias gs="git status"
alias gslog="git shortlog"
alias glog="git log --pretty=format:'%n%ar %n%Cred%h %Cblue%an <%ae> %n%Cgreen%s%n' --name-only"
alias glogme="glog --author='\(cultbaus\)'"
alias vim="nvim"
alias orphans='sudo pacman -Qtdq | sudo pacman -Rns -'
alias ncmpcpp='ncmpcpp -b ~/.config/ncmpcpp/bindings'
alias pro="cd ~/projects/"
alias pkg="cd ~/packages"

/usr/bin/pap r
