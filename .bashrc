#!/bin/bash


export PATH
export PS1='> '
export EDITOR=nvim
export CFLAGS='-O3 -pipe -march=native'
export CXXFLAGS='$CFLAGS'
export MAKEFLAGS='-j$(nproc)'
export HISTFILE=/tmp/bash_history.$(whoami)
export LESSHISTFILE=/tmp/less_history.$(whoami)

PATH=$PATH:$HOME/.local/share/bin
PATH=$PATH:$HOME/.go/bin
PATH=$PATH:$HOME/.bin

unset MOZ_PLUGIN_PATH
unset MOTD_SHOWN
unset LS_COLORS
unset MAIL

function dots { git --git-dir=$HOME/.dotfiles --work-tree=$HOME "$@"; }
function mksh { printf '#!/bin/bash\n' > "$1" && chmod +x "$1"; }
function mkcd { mkdir -p "$@" && cd "$_"; }
function pb { nc termbin.com 9999; }
function ds { dots status; }
function gs { git status; }
function .. { cd ../; }
function ... { ..; ..; }
