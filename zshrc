# Customize to your needs...
export PATH=/usr/local/opt/python/libexec/bin:$PATH:~/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin
export EDITOR=vim

# Base16 shell
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1"  ] && [ -s $BASE16_SHELL/profile_helper.sh  ] && eval "$($BASE16_SHELL/profile_helper.sh)"
base16_tomorrow-night

fpath=( "$HOME/.zsh/zfunctions" $fpath )

# Pure prompt
autoload -U promptinit && promptinit
prompt pure

# Aliases
source ~/.zsh/aliases

# Completions
autoload -U compinit
compinit -i

# Tab completions
fpath=(~/.zsh/completion $fpath)

# Terminal history
if [ -z $HISTFILE ]; then
    HISTFILE=$HOME/.zsh_history
fi
HISTSIZE=10000
SAVEHIST=10000

# Still keep Emacs bindings for general line navigation
bindkey -e

# 10ms for key sequences
KEYTIMEOUT=1

export SHELL=/bin/zsh

# Stuff that shouldn't be in a git repository
source ~/.passwords
source ~/.envvars
source ~/.emma

# Add local dir node_modules/.bin to path
export PATH=./node_modules/.bin:$PATH

# Leiningen
alias lein="nocorrect lein"

# Winning
alias win="say \"All I Do is win win win no matter what, got money on mind i can never get enough, and everytime I step up in the building, everybody hands go up, and they stay there, and they say yeah, and they stay there, Up down, up down\""

# Git
alias git-clean="git remote prune origin && git gc && git clean -df && git stash clear"

# Vim
vs () { vim -S ~/.vim-sessions/$1.vim }

# Tmux scripts and completion
m () { tmuxp load ~/dotfiles/tmuxp/$1.yml }
_m_comp() {
    reply=($(ls -1 ~/dotfiles/tmuxp/*.yml | xargs basename -s .yml));
}
compctl -K _m_comp m

# Virtualenv
source /usr/local/bin/virtualenvwrapper.sh
source $HOME/.zsh/zfunctions/virtualenv-auto-activate.sh

