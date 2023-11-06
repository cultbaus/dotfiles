# .bash_profile

[ -f $HOME/.config/secrets/.secretsrc ] && . $HOME/.config/secrets/.secretsrc
[ -f $HOME/.bashrc ] && . $HOME/.bashrc

[ ! -f /tmp/bash_history.$(whoami) ] && touch /tmp/bash_history.$(whoami)
[ ! -f /tmp/less_history.$(whoami) ] && touch /tmp/less_history.$(whoami)

[ -z $DISPLAY ] && [ $(fgconsole) -eq 1 ] && sx
