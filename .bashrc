# Load aliases
source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s histappend
shopt -s checkwinsize

PS1="\[\033[38;5;166m\][\w\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')]\[$(tput sgr0)\] \[$(tput sgr0)\]"
