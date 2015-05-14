#!/bin/bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

## Jump to home
cd

## First make sure we have installed zsh and curl!
sudo apt-get -y --force-yes install zsh curl

## This will setup all the dotfiles where they belong!
rsync -av --progress --exclude-from 'exclude-list.txt' .* ~/

## Install oh-my-zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

## Append to our .zshrc file written by oh-my-zsh
echo "

# Enable vi-mode
bindkey -v
export KEYTIMEOUT=1
# Add some PATH variables
export PATH=~/.bin/:/usr/local/bin/:$PATH
# Sourcing from other files
source $HOME/.zsh/aliases
source $HOME/.zsh/functions
source $HOME/.zsh/prompt
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting" >> ~/.zshrc

## Restart everything!
ScriptLoc=$(readlink -f "$DIR/setup.sh")
exec $ScriptLoc
