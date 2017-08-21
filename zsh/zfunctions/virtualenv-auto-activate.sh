#!/bin/bash
# virtualenv-auto-activate.sh
#
# Installation:
#   Add this line to your .bashrc or .bash-profile:
#
#       source /path/to/virtualenv-auto-activate.sh
#
#   Go to your project folder, run "virtualenv .venv", so your project folder
#   has a .venv folder at the top level, next to your version control directory.
#   For example:
#   .
#   ├── .git
#   │   ├── HEAD
#   │   ├── config
#   │   ├── description
#   │   ├── hooks
#   │   ├── info
#   │   ├── objects
#   │   └── refs
#   └── .venv
#       ├── bin
#       ├── include
#       └── lib
#
#   The virtualenv will be activated automatically when you enter the directory.

# Check for virtualenvwrapper
if type workon >/dev/null 2>&1; then
  VENV_WRAPPER=true
else
  VENV_WRAPPER=false
fi

_virtualenv_auto_activate() {
    if [ -e ".venv" ]; then
        # Check for symlink pointing to virtualenv
        if [ -L ".venv" ]; then
          _VENV_PATH=$(readlink .venv)
        # Check for directory containing virtualenv
        elif [ -d ".venv" ]; then
          _VENV_PATH=$(pwd -P)/.venv
        # Check for file containing name of virtualenv
        elif [ -f ".venv" -a $VENV_WRAPPER = "true" ]; then
          _VENV_PATH=$WORKON_HOME/$(cat .venv)
          _VENV_WRAPPER_ACTIVATE=true
        else
          return
        fi

        # Check to see if already activated to avoid redundant activating
        if [ "$VIRTUAL_ENV" != $_VENV_PATH ]; then
            _VENV_NAME=$(basename $_VENV_PATH)
            echo Activating virtualenv \"$_VENV_NAME\"...

            if $_VENV_WRAPPER_ACTIVATE; then
              workon $_VENV_NAME
            else
              VIRTUAL_ENV_DISABLE_PROMPT=1
              source .venv/bin/activate
              _OLD_VIRTUAL_PS1="$PS1"
              PS1="($_VENV_NAME)$PS1"
              export PS1
            fi
        fi
    fi
}

chpwd_functions=(_virtualenv_auto_activate)
export PROMPT_COMMAND=_virtualenv_auto_activate
