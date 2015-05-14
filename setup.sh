#!/bin/bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

## First make sure we have installed zsh and curl!
sudo apt-get -y --force-yes install zsh curl

## This will setup all the dotfiles where they belong!
rsync -av --progress --exclude-from 'exclude-list.txt' .* ~/

## Jump to home
pushd .
cd

## Install oh-my-zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

## Append to our .zshrc file written by oh-my-zsh
cat "$DIR/.zshrc" >> ~/.zshrc

popd

set -e

echo "\033[0;32m"' _____          _        _ _          _ '"\033[0m"
echo "\033[0;32m"'|_   _|        | |      | | |        | |'"\033[0m"
echo "\033[0;32m"'  | | _ __  ___| |_ __ _| | | ___  __| |'"\033[0m"
echo "\033[0;32m"'  | ||  _ \/ __| __/ _  | | |/ _ \/ _  |'"\033[0m"
echo "\033[0;32m"' _| || | | \__ \ || (_| | | |  __/ (_| |'"\033[0m"
echo "\033[0;32m"' \___/_| |_|___/\__\__,_|_|_|\___|\__,_|'"\033[0m"
echo "\033[0;32m"'                                        '"\033[0m"
