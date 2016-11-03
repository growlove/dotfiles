ed="vim"
if [ -x /usr/local/bin/mvim ]; then
  ed="mvim -v"
  alias vim="mvim -v"
fi
export EDITOR="$ed"
export VISUAL="$EDITOR"

# Aliases
alias r="rails"
alias g="git"
alias c="clear"
alias e="$EDITOR"
alias sudoedit="sudo $EDITOR"

# dotfiles repo command
alias config='/usr/bin/git --git-dir=/Users/mark/.dotfiles/ --work-tree=/Users/mark'

if [ -x /usr/local/bin/ag ]; then
  alias ag='ag --path-to-agignore ~/.agignore'
fi

bindkey -e
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word

if [ -f /usr/local/opt/nvm/nvm.sh ]; then
  source /usr/local/opt/nvm/nvm.sh
fi

if [ -d /Users/mark/Workspace/go ]; then
  export GOPATH=/Users/mark/Workspace/go
  export PATH=$PATH:$GOPATH/bin
fi

if [ -d ~/Library/Android/sdk ]; then
  export ANDROID_HOME=~/Library/Android/sdk
  export PATH=$PATH:$ANDROID_HOME/tools
fi

# oh-my-zsh loading & config
if [ -d /Users/mark/.oh-my-zsh ]; then
  export ZSH=/Users/mark/.oh-my-zsh
  export ZSH_THEME="dracula"
  plugins=(git)
  source $ZSH/oh-my-zsh.sh
fi

# antigen loading & config
if [ -f /Users/mark/.antigen.zsh ]; then
  source /Users/mark/.antigen.zsh
  antigen use oh-my-zsh
  antigen bundle zsh-users/zsh-syntax-highlighting
  antigen theme zenorocha/dracula-theme zsh/dracula
  antigen bundle kennethreitz/autoenv
  antigen apply
fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export PATH="$HOME/.yarn/bin:$PATH"
