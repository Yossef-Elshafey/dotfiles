# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias ls='ls --color=auto'
set -o vi
PS1='\[\e[36m\]\w\[\e[m\] >> '
alias i='doas xbps-install -S'
alias u='i; doas xbps-install -u xbps; doas xbps-install -u'
alias q='doas xbps-query -Rs'
alias r='doas xbps-remove -R'
alias vim='nvim'
alias ll='ls -la'
