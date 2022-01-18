#!/bin/bash
install_shell="/bin/bash"
scripts_dir="installation_scripts"
cfg_dir="configuration_files"

# Install
$install_shell $scripts_dir/create_ssh_keypair.sh
$install_shell $scripts_dir/install_xcode.sh
$install_shell $scripts_dir/install_brew.sh brew_taps.txt brew_packages.txt

# Configure
$install_shell $cfg_dir/configure_nvm.sh
$install_shell $cfg_dir/configure_kdiff3.sh
$install_shell $cfg_dir/configure_zsh.sh

exit 0