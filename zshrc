# Sources
source ~/dotfiles/pure/prompt.zsh
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

# Vim mode and prompt
bindkey -v

vim_ins_mode="%{$fg[cyan]%}-- INSERT --%{$reset_color%}"
vim_cmd_mode="%{$fg[green]%}-- NORMAL --%{$reset_color%}"
vim_mode=$vim_ins_mode

function zle-keymap-select {
  vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
    zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-finish {
  vim_mode=$vim_ins_mode
}
zle -N zle-line-finish

# bindkey -M viins 'jj' vi-cmd-mode
bindkey -M vicmd '?' history-incremental-search-backward

RPROMPT='${vim_mode}'

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

# 10ms for key sequences
KEYTIMEOUT=1

# Tmuxinator
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
export SHELL=/bin/zsh

# Ruby/Gems
export GEM_HOME=~/.gems
export PATH=~/.gems/bin:$PATH

# Emacs
alias e="open -a /Applications/Emacs.app"

# VirtualEnv
# source /usr/local/bin/virtualenvwrapper.sh

source ~/.passwords

# Add NPM bins to path
export PATH=/usr/local/share/npm/bin/:$PATH

# alias to nw
alias nw="/Applications/node-webkit.app/Contents/MacOS/node-webkit"
alias lein="nocorrect lein"

unpack-mc() {
    cd ~
    mkdir mctmp
    cd mctmp
    jar xf ~/Library/Application\ Support/minecraft/bin/minecraft.jar
    open ~/mctmp
}

pack-mc() {
    cd ~/mctmp
    rm META-INF/MOJANG_C.*
    jar uf ~/Library/Application\ Support/minecraft/bin/minecraft.jar ./
    cd ..
    rm -rf mctmp
}

# XC8
export PATH=/Applications/microchip/xc8/v1.20/bin:$PATH

# Go
export GOROOT=~/src/go
export GOPATH=~/projects/go/libraries
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# Java
export JVM_OPTS="-Xmx6g"
export JAVA_OPTS=$JVM_OPTS

# Really ansible?
export ANSIBLE_NOCOWS=1
