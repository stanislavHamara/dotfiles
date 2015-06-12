#!/bin/bash

# Default aliases
alias ls='ls --color=auto'
alias gs='git status'
alias gd='git diff'
alias gds='git diff --staged'
alias gg='git graph'
alias npm='npm -s'

# Custom (usually OS-specific) aliases
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi
