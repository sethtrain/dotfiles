fpath=( "$HOME/.zsh/zfunctions" $fpath )

autoload -U promptinit && promptinit
prompt pure

source ~/.zsh/aliases

# Completions
autoload -U compinit
compinit -i

# Colors
autoload -U colors && colors
export LSCOLORS="Gxfxcxdxbxegedabagacad"
if [ "$DISABLE_LS_COLORS" != "true" ]
then
  # Find the option for using colors in ls, depending on the version: Linux or BSD
  if [[ "$(uname -s)" == "NetBSD" ]]; then
    # On NetBSD, test if "gls" (GNU ls) is installed (this one supports colors);
    # otherwise, leave ls as is, because NetBSD's ls doesn't support -G
    gls --color -d . &>/dev/null 2>&1 && alias ls='gls --color=tty'
  else
    ls --color -d . &>/dev/null 2>&1 && alias ls='ls --color=tty' || alias ls='ls -G'
  fi
fi

# Tab completions
fpath=(~/.zsh/completion $fpath)

# Terminal history
if [ -z $HISTFILE ]; then
    HISTFILE=$HOME/.zsh_history
fi
HISTSIZE=10000
SAVEHIST=10000

# Customize to your needs...
export PATH=~/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin
export EDITOR=vim

# 10ms for key sequences
KEYTIMEOUT=1

# Tmuxinator
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
export SHELL=/bin/zsh

# Ruby/Gems
export GEM_HOME=~/.gems
export PATH=~/.gems/bin:$PATH

source ~/.passwords
source ~/.envvars

# Add NPM bins to path
export PATH=/usr/local/share/npm/bin:$PATH

# Add local dir node_modules/.bin to path
export PATH=./node_modules/.bin:$PATH

# alias to nw
alias nw="/Applications/node-webkit.app/Contents/MacOS/node-webkit"
alias lein="nocorrect lein"

# Go lang
export PATH=/usr/local/go/bin:$PATH

alias win="say \"All I Do is win win win no matter what, got money on mind i can never get enough, and everytime I step up in the building, everybody hands go up, and they stay there, and they say yeah, and they stay there, Up down, up down\""

alias git-clean="git remote prune origin && git gc && git clean -df && git stash clear"

# Vim
vs () { vim -S ~/.vim-sessions/$1.vim }

alias vimnt="vim -c :NERDTree"
alias vv="cd ~/.vim && vim ~/.vim/vimrc"
alias vm="cd ~/dotfiles/tmux-scripts && vim monolith.sh"

m () { ~/dotfiles/tmux-scripts/$1.sh }

source ~/.emma
