ed="vim"
if [ -x /usr/local/bin/mvim ]; then
  ed="mvim -v"
fi
export EDITOR="$ed"
export VISUAL="$EDITOR"

# Aliases
alias r="rails"
alias g="git"
alias c="clear"
alias e="$EDITOR"
alias vim="mvim -v"
alias sudoedit="sudo $EDITOR"

# dotfiles repo command
alias config='/usr/bin/git --git-dir=/Users/mark/.dotfiles/ --work-tree=/Users/mark'

if [ -x /usr/local/bin/ag ]; then
  alias ag='ag --path-to-agignore ~/.agignore'
fi

bindkey -e
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word

source /usr/local/opt/nvm/nvm.sh

export GOPATH=/Users/mark/Workspace/go
export PATH=$PATH:$GOPATH/bin

if [ -d ~/Library/Android/sdk ]; then
  export ANDROID_HOME=~/Library/Android/sdk
  export PATH=$PATH:$ANDROID_HOME/tools
fi

# oh-my-zsh loading & config
export ZSH=/Users/mark/.oh-my-zsh
export ZSH_THEME="dracula"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# antigen loading & config
source /Users/mark/.antigen.zsh
antigen use oh-my-zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen theme zenorocha/dracula-theme zsh/dracula
antigen bundle kennethreitz/autoenv
antigen apply

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
