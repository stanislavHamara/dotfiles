# Alex's dotfiles

## Setup
   
### Windows

1. Install [Git](https://git-scm.com/download/win)

### macOS

1. Install [Homebrew](https://brew.sh/)

1. Run
   ```
   brew install git bash-completion
   ```

## Installation

Download and run the [install script](https://gist.github.com/alextercete/73b3019dc9c057decbb2cb54cb00e88c). Alternatively, run the following:

```shell
source <(curl -s https://gist.githubusercontent.com/alextercete/73b3019dc9c057decbb2cb54cb00e88c/raw/dotfiles.sh)
```

## Configuration

Configure your Git user:

```shell
git config --file $HOME/.gitconfig.user user.name "Your Name"
```
```shell
git config --file $HOME/.gitconfig.user user.email you@example.com
```