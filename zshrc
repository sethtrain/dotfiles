################################################################
# Environment variables
################################################################
export GOPATH=~/projects/go
export PATH=/usr/local/opt/python/libexec/bin:$PATH:~/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin
export PATH=$GOPATH/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=./node_modules/.bin:$PATH
export PATH=/usr/local/opt/python@2/bin:$PATH
export EDITOR=nvim
export SHELL=/bin/zsh

fpath=( "$HOME/.zsh/zfunctions" $fpath )

################################################################
# Pure prompt
################################################################
autoload -U promptinit && promptinit
prompt pure

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
HISTSIZE=10000
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
source ~/.emma

################################################################
# Ruby
################################################################
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/share/gem_home/gem_home.sh

################################################################
# Leiningen
################################################################
alias lein="nocorrect lein"

################################################################
# Git
################################################################
alias git-clean="git remote prune origin && git gc && git clean -df && git stash clear"


################################################################
# Virtualenv
################################################################
source $HOME/.zsh/zfunctions/virtualenv-auto-activate.sh

################################################################
# Tmuxinator
################################################################
source $HOME/.zsh/completion/tmuxinator.zsh

################################################################
# Winning
################################################################
alias win="say \"All I Do is win win win no matter what, got money on mind i can never get enough, and everytime I step up in the building, everybody hands go up, and they stay there, and they say yeah, and they stay there, Up down, up down\""
alias easy="say -v\"Good News\" \"That was easy\""

