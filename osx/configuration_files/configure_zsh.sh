#!/bin/bash

echo -e "\nInstalling oh-my-zsh"
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
chsh -s /usr/local/bin/zsh

echo -e "\nInstalling zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo -e "\nCopying .zshrc custom configuration over"
cat .zshrc.part >> ~/.zshrc
