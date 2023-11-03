# .bash_profile

[ -f $HOME/.bashrc ] && . $HOME/.bashrc
[ -z $DISPLAY ] && [ $(fgconsole) -eq 1 ] && sx
