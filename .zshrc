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
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=/Users/mark'

# rust aliases
if [ -x /usr/local/bin/cargo ]; then
  alias cr="cargo run"
  alias cb="cargo build"
  alias ct="cargo test"
fi

function pcd { cd ${PWD%/$1/*}/$1; }

if [ -x /usr/local/bin/ag ]; then
  alias ag='ag -p $HOME/.agignore'
fi

bindkey -e
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word

if [ -f /usr/local/opt/nvm/nvm.sh ]; then
  source /usr/local/opt/nvm/nvm.sh
fi

if [ -d $HOME/Workspace/go ]; then
  export GOPATH=$HOME/Workspace/go
  export PATH=$PATH:$GOPATH/bin
fi

if [ -d $HOME/Library/Android/sdk ]; then
  export ANDROID_HOME=$HOME/Library/Android/sdk
  export PATH=$PATH:$ANDROID_HOME/tools
fi

# oh-my-zsh loading & config
if [ -d $HOME/.oh-my-zsh ]; then
  export ZSH=$HOME/.oh-my-zsh
  export ZSH_THEME="dracula"
  plugins=(git)
  source $ZSH/oh-my-zsh.sh
fi

# antigen loading & config
if [ -f $HOME/.antigen.zsh ]; then
  source $HOME/.antigen.zsh
  antigen use oh-my-zsh
  antigen theme zenorocha/dracula-theme zsh/dracula
  antigen bundle kennethreitz/autoenv
  antigen apply
fi

if [[ -z ${INSIDE_EMACS} ]]; then
  # Don't load inside emacs
  # Breaks multiterm
  antigen bundle zsh-users/zsh-syntax-highlighting
fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.cargo/bin" # Add Rust cargo to PATH

# import yarn binaries if installed through brew
[ - ]
if [ -x /usr/local/bin/yarn ]; then
  export PATH="$PATH:`yarn global bin`"
fi

# OPAM configuration
. $HOME/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag -g ""'
