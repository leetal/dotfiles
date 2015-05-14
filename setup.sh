#!/bin/bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

## First make sure we have installed zsh and curl!
sudo apt-get -y --force-yes install zsh curl tput

## This will setup all the dotfiles where they belong!
rsync -av --progress --exclude-from 'exclude-list.txt' .* ~/

## Jump to home
pushd .
cd

## Install oh-my-zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

## Append to our .zshrc file written by oh-my-zsh
cat "${DIR}/.zshrc" >> ~/.zshrc

## Return to old dir
popd

## Print ze fancy textz!
green=`tput setaf 2 bold`
reset=`tput sgr0`

echo "${green} _____          _        _ _          _ ${reset}"
echo "${green}|_   _|        | |      | | |        | |${reset}"
echo "${green}  | | _ __  ___| |_ __ _| | | ___  __| |${reset}"
echo "${green}  | ||  _ \/ __| __/ _  | | |/ _ \/ _  |${reset}"
echo "${green} _| || | | \__ \ || (_| | | |  __/ (_| |${reset}"
echo "${green} \___/_| |_|___/\__\__,_|_|_|\___|\__,_|${reset}"

. ~/.zshrc
