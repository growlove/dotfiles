# Custom commands
# {{
command_exists() {
  type "$1" &> /dev/null;
}

function pcd { cd ${PWD%/$1/*}/$1; }
# }}

# Aliases & Exports
# {{
if command_exists mvim; then
  export EDITOR="mvim -v"
  alias vim="mvim -v"
else
  export EDITOR="vim"
fi
export VISUAL="$EDITOR"

# dotfiles repo alias
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias g="git"
alias c="clear"
alias e="$EDITOR"
alias sudoedit="sudo $EDITOR"

# language-related aliases
if command_exists rails; then
  alias r="rails"
fi

# rust aliases
if command_exists cargo; then
  alias cr="cargo run"
  alias cb="cargo build"
  alias ct="cargo test"
fi

if command_exists ag; then
  alias ag='ag --hidden -p $HOME/.agignore'
fi

if command_exists yarn; then
  export PATH="$PATH:`yarn global bin`"
fi

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

if [ -d $HOME/.rvm ]; then
  export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
  export PATH="$PATH:$HOME/.cargo/bin" # Add Rust cargo to PATH
fi

[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag -g ""'

if [ -d $HOME/.opam ]; then
  . $HOME/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
fi
# }}

# oh-my-zsh
# {{
if [ -d $HOME/.oh-my-zsh ]; then
  export ZSH=$HOME/.oh-my-zsh
  export ZSH_THEME="dracula"
  plugins=(git)
  source $ZSH/oh-my-zsh.sh
fi
# }}

# tmux-specific bindings
bindkey -e
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word
