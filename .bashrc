#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
export PATH="/home/yossef/.cargo/bin/:$PATH"
alias ls='ls --color=auto'
export PS1="\[\e[36m\]\w\[\e[m\] >> "
alias u='doas pacman -Syu; doas pacman -S'
alias q='doas pacman -Ss'
alias r='doas pacman -R'
alias i='doas pacman -S'
alias shafter='python $HOME/life/scripts/shutdown.py'
alias vim='nvim'
alias ll='ls -la'
