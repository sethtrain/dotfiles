export PATH=$HOME/bin:/usr/local/bin:$PATH:$HOME/.npm-packages/bin
export ZSH="/home/seth/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(archlinux git pyenv timer tmux zsh-completions)
autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

# Aliases
alias vv="nvim ~/.vim/vimrc"
alias vz="nvim ~/.zshrc"
alias battery="cat /sys/class/power_supply/BAT0/capacity"
alias clock="tty-clock -t -f %m/%d/%Y -b -c"
