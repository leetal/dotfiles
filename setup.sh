#!/bin/bash

## Jump to home
cd

## First make sure we have installed zsh and curl!
sudo apt-get -y --force-yes install zsh curl

## This will setup all the dotfiles where they belong!
rsync -av --progress --exclude-from 'exclude-list.txt' .* ~/

## Install oh-my-zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

## Restart everything!
ScriptLoc=$(readlink -f "$0")
exec $ScriptLoc
