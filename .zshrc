export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/.zsh"
ZSH_THEME="tercete"
plugins=(git z wsl vi-mode ssh-agent gpg-agent)
source "$ZSH/oh-my-zsh.sh"

# Load local binaries
export PATH="$HOME/.local/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export PATH="$HOME/source/cagent/bin:$PATH"

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
alias gpc="gh pr checkout"
alias dotfiles="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias cdr="cd $(git rev-parse --show-toplevel)"
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"

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

alias p='pnpm'
alias wipedd='. ~/source/wipedd.sh'

export NVM_DIR="$HOME/.nvm"
lazy_load_nvm() {
  unset -f node npm npx nvm
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"
}
node() { lazy_load_nvm; node "$@"; }
npm()  { lazy_load_nvm; npm "$@"; }
npx()  { lazy_load_nvm; npx "$@"; }
nvm()  { lazy_load_nvm; nvm "$@"; }

# 1Password CLI secrets — skip when no TTY or non-interactive; requires `op` on PATH.
if [[ -o interactive ]] && [[ -t 0 ]] && [[ -t 1 ]] && command -v op >/dev/null 2>&1; then
  export GITHUB_TOKEN=$(op read "op://Employee/github_token/password")
  export HOMEBREW_GITHUB_API_TOKEN=$(op read "op://Employee/github_token/password")
  export GITHUB_PERSONAL_ACCESS_TOKEN=$(op read "op://Employee/github_personal_token/password")
  export ANTHROPIC_API_KEY=$(op read "op://Employee/anthropic_api_key/password")
  export OPENAI_API_KEY=$(op read "op://Employee/openai_api_key/password")
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
export GOPRIVATE=github.com/docker

source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
export PATH="/usr/local/codeql:$PATH"