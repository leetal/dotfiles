# Enable completion
autoload -U compinit
compinit

# Save a ton of history
HISTFILE=~/.zsh_history
HISTSIZE=20000
SAVEHIST=20000

# Enable vi-mode
bindkey -v
export KEYTIMEOUT=1

# Add some PATH variables
export PATH=~/.bin/:/usr/local/bin/:$PATH

# Sourcing from other files
source $HOME/.zsh/aliases
source $HOME/.zsh/functions
source $HOME/.zsh/prompt

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
