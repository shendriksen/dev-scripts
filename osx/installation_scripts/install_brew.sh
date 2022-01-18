#!/bin/bash
TAPS_FILE="$1"
PACKAGES_FILE="$2"

GREEN='\033[0;32m'
NO_COLOUR='\033[0m' # No Colour

echo 'Installing Brew'
if /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; then
    echo -e "\nUpdating Brew"
    brew update
    
    echo -e "\nInstalling Brew Taps"
    while IFS= read -r tap; do
        echo -e "- ${GREEN}Tap: '$tap'${NO_COLOUR}"
        brew tap "$tap" 2>&1 < /dev/null | awk '{printf "    %s\n",$0}'
    done < "$TAPS_FILE"

    echo -e "\nInstalling Brew Packages"
    while IFS= read -r package; do
        echo -e "- ${GREEN}Package: '$package'${NO_COLOUR}"
        brew install "$package" 2>&1 < /dev/null | awk '{printf "    %s\n",$0}'
    done < "$PACKAGES_FILE"
fi