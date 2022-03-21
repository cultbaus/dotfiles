#!/bin/bash

#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH=~/.ghcup/bin:~/.bin:~/.npm/bin:~/.npm-global/bin:~/.yarn/bin:~/.local/bin:~/.cargo/bin:~/.go/bin:/usr/local/go/bin:~/packages/lua-language-server/bin/Linux:$GEM_HOME/bin:$PATH

[ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ] && {
  startx
}
