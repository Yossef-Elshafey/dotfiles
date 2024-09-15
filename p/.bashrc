# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias ls='ls --color=auto'
set -o vi
PS1='\[\e[36m\]\w\[\e[m\] >> '
alias u='doas pacman -Syu'
alias i='doas pacman -S'
alias q='doas pacman -Ss'
alias r='doas pacman -Rs'
alias vim='nvim'
alias ll='ls -la'
