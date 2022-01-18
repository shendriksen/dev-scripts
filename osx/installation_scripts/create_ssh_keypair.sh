#!/bin/bash

echo 'Setting up SSH Key'
SSH_KEY_DIR="$HOME/.ssh"
mkdir "$SSH_KEY_DIR"

SSH_KEY_PATH="$SSH_KEY_DIR/default_rsa"
echo 'Enter your email'
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
  IdentityFile ~/.ssh/default_rsa" > "$SSH_KEY_DIR/config"