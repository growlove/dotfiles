command_exists() {
  type "$1" &> /dev/null;
}

# Source .scripts
# {{
if [ -d "$HOME/.scripts" ]; then
  for f in $HOME/.scripts/* $HOME/.scripts/**/*; do
    . $f
  done
fi
# }}

# Source .zshrc_local
#
# File contains system-specific configuration that
# doesn't belong in the repo.
# {{
if [ -f $HOME/.zshrc_local ]; then
  . $HOME/.zshrc_local
fi
# }}

# Aliases & Exports
# {{
if command_exists mvim; then
  export EDITOR="mvim -v"
  alias vim="mvim -v"
else
  export EDITOR="vim"
fi
export VISUAL=$EDITOR

# dotfiles repo alias
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias g="git"
alias c="clear"
alias e="$EDITOR"
alias sudoedit="sudo $EDITOR"

# oh-my-zsh
# {{
if [ -d $HOME/.oh-my-zsh ]; then
  export ZSH=$HOME/.oh-my-zsh
  export ZSH_THEME="dracula"
  plugins=(git)
  source $ZSH/oh-my-zsh.sh
fi
# }}
