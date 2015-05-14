#!/bin/bash

## Jump to home
cd

## First make sure we have installed zsh and curl!
sudo apt-get -y --force-yes install zsh curl

## This will setup all the dotfiles where they belong!
rsync -av --progress --exclude-from 'exclude-list.txt' .* ~/

## Install oh-my-zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

## Append to our .zshrc file written by oh-my-zsh
echo "\n\n# Enable vi-mode\n
bindkey -v\n
export KEYTIMEOUT=1\n
# Add some PATH variables\n
export PATH=~/.bin/:/usr/local/bin/:$PATH\n
# Sourcing from other files\n
source $HOME/.zsh/aliases\n
source $HOME/.zsh/functions\n
source $HOME/.zsh/prompt\n
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting" >> ~/.zshrc

## Restart everything!
ScriptLoc=$(readlink -f "setup.sh")
exec $ScriptLoc
