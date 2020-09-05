source ~/.antigen.zsh
source ~/.aliases

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle pip
antigen bundle ssh-agent
antigen bundle python
antigen bundle docker

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme clean

# Tell Antigen that you're done.
antigen apply

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Auto completion scripts
fpath=($fpath ~/.zsh/completion)
# source <(kubectl completion zsh)
# [[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)
