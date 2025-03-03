export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/.zsh"
ZSH_THEME="tercete"
plugins=(git nvm z wsl vi-mode ssh-agent gpg-agent)
source "$ZSH/oh-my-zsh.sh"

# Load local binaries
export PATH="$HOME/.local/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"

# Use Vim as the default editor
export EDITOR=vim
export VISUAL=vim

# Customize `ls` colours
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd

# Set aliases
alias gs="git status -sb"
alias gd="git diff"
alias gds="git diff --staged"
alias gg="git graph"
alias gf="git fetch --prune"
alias dotfiles="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias cdr="cd $(git rev-parse --show-toplevel)"

# Docker specific aliases
alias yl="yarn run lint --fix"
alias a='export AWS_PROFILE=$(aws configure list-profiles | fzf)'
alias k="kubectl"
alias d="docker"
alias h="docker harmonia"
alias kn="kubens"
alias ar='infra-cli aws init -y'
alias al='infra-cli aws login -y'
alias ac='eval $(aws configure export-credentials --format env)'
alias aws-sso-init='infra-cli aws init'
alias aws-sso-login='infra-cli aws login'
alias aws-sso-temp-creds='eval $(aws configure export-credentials --format env)'
alias eks='infra-cli aws configEks'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
