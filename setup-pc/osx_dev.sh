#!/bin/bash

echo 'Setting up SSH Key'
SSH_KEY_DIR="$HOME/.ssh"
mkdir "$SSH_KEY_DIR"
ls -a $SSH_KEY_DIR
echo 'Enter your key name e.g. github_rsa'
read KEY_NAME
SSH_KEY_PATH="$SSH_KEY_DIR/$KEY_NAME"
echo 'Enter your Github Email'
read EMAIL
ssh-keygen -t rsa -b 4096 -C "$EMAIL" -f "$SSH_KEY_PATH"
ssh-add -K "$SSH_KEY_PATH"
echo '----SSH PUB KEY START----'
cat "$SSH_KEY_PATH.pub"
echo '----SSH PUB KEY END----'

echo 'Creating ssh config'
echo "Host *
  UseKeychain yes
  AddKeysToAgent yes
  IdentityFile ~/.ssh/$KEY_NAME" > "$SSH_KEY_DIR/config"

echo 'Installing Command Line Tools'
xcode-select --install

echo 'Installing Brew'
if /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; then

  echo 'Adding Brew to Path'
  export PATH="/usr/local/bin:$PATH"

  echo 'Updating Brew'
  brew update
  
  echo 'Installing Brew Cask'
  brew tap caskroom/cask

  echo 'Installing core utils'
  brew install coreutils

  echo 'Installing caffeine'
  brew cask install caffeine

  echo 'Installing jq'
  brew install jq

  echo 'Installing oath-toolkit'
  brew install oath-toolkit
  
  echo 'Installing Git'
  brew install git
  
  echo 'Installing NVM'
  brew install nvm
  mkdir "$HOME/.nvm"
  echo 'export NVM_DIR=~/.nvm' >> "$HOME/.bash_profile"
  echo 'source $(brew --prefix nvm)/nvm.sh' >> "$HOME/.bash_profile"
  source ~/.bash_profile
  echo $NVM_DIR
  
  echo 'Installing Node'
  echo 'What version of node would you like to install? (9.3.0)'
  read NODE_VERSION
  nvm install $NODE_VERSION
  nvm ls
  nvm use $NODE_VERSION
  
  echo 'Installing Yarn'
  brew install yarn

  echo 'Installing Zsh'
  brew install zsh zsh-completions
  curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
  chsh -s /usr/local/bin/zsh

  echo 'Installing tree'
  brew install tree

  echo 'Installing Watchman'
  brew install watchman

  echo 'Installing AWS-CLI'
  brew install awscli
  aws configure

  echo 'Installing AWS-ECS-CLI'
  brew install amazon-ecs-cli

  echo 'Installing Java'
  brew cask install java

  echo 'Installing VS Code'
  brew cask install visual-studio-code
  
  echo 'Installing Intellij IDEA'
  brew cask install intellij-idea
  
  echo 'Installing Docker'
  brew cask install docker
  
  echo 'Installing Chrome'
  brew cask install google-chrome
  
  echo 'Installing Slack'
  brew cask install slack
  
  echo 'Installing iTerm2'
  brew cask install iterm2

  echo 'Installing Virtualbox'
  brew cask install virtualbox

  echo 'Installing Vagrant'
  brew cask install vagrant
  
  echo 'Installing GraphIql'
  brew cask install graphiql

  echo 'Installing Charles'
  brew cask install charles

  echo 'Installing Dropbox'
  brew cask install dropbox

  echo 'Installing Android Studio + extras'
  brew cask install android-sdk
  brew cask install android-studio

  echo 'Installing KDiff3'
  brew cask install kdiff3
  git config --global merge.tool kdiff3

  echo 'Installing Keybase'
  brew cask install keybase

  echo 'Installing Authy'
  brew cask install authy

  echo 'Installing assume-role'
  brew install remind101/formulae/assume-role
fi

exit 0
