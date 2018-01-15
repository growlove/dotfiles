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

# Aliases

if [ -f $HOME/.aliases ]; then
  . $HOME/.aliases
fi

# Source .zshrc_local
#
# File contains system-specific configuration that
# doesn't belong in the repo.
# {{
if [ -f $HOME/.zshrc_local ]; then
  . $HOME/.zshrc_local
fi
# }}

# oh-my-zsh
# {{
if [ -d $HOME/.oh-my-zsh ]; then
  export ZSH=$HOME/.oh-my-zsh
  export ZSH_THEME="dracula"
  source $ZSH/oh-my-zsh.sh
fi
# }}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export GOPATH="${HOME}/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
