################################################################
# Environment variables
################################################################
export PATH=$PATH:~/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin
export PATH=./node_modules/.bin:$PATH
export EDITOR=vim
export SHELL=/bin/zsh

fpath=( "$HOME/.zsh/zfunctions" $fpath )

################################################################
# Aliases
################################################################
source ~/.zsh/aliases

################################################################
# Completions
################################################################
autoload -U compinit
compinit -i
fpath=(~/.zsh/completion $fpath)

################################################################
# Terminal history
################################################################
if [ -z $HISTFILE ]; then
    HISTFILE=$HOME/.zsh_history
fi
SAVEHIST=10000

################################################################
# Still keep Emacs bindings for general line navigation
################################################################
bindkey -e

################################################################
# 10ms for key sequences
################################################################
KEYTIMEOUT=1

################################################################
# Stuff that shouldn't be in a git repository
################################################################
source ~/.passwords
source ~/.envvars

################################################################
# Git
################################################################
alias git-clean="git remote prune origin && git gc && git clean -df && git stash clear"

################################################################
# Virtualenv
################################################################
source $HOME/.zsh/zfunctions/virtualenv-auto-activate.sh

################################################################
# Pyenv
################################################################
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

