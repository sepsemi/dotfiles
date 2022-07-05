case $- in
    *i*) ;;
      *) return;;
esac

HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

HISTSIZE=1000
HISTFILESIZE=2000
source $XDG_CONFIG_HOME/shell/aliasrc
source $XDG_CONFIG_HOME/shell/functions

shopt -s checkwinsize

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# ssh agent
if [ -d $HOME/.ssh ]; then
    if [ ! -S $HOME/.ssh/ssh_auth_sock ]; then
	eval `ssh-agent` &> /dev/null
	ln -sf "$SSH_AUTH_SOCK" $HOME/.ssh/ssh_auth_sock
    fi
fi

# Set the PS1 prompt
export PS1="\[\033[38;5;202m\][\w\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')] \[$(tput sgr0)\]"
