#!/bin/bash

GREEN="\033[1;32m"
YELLOW="\033[1;33m"
RED="\033[1;31m"
BLUE="\033[1;34m"
RESET="\033[0m"
prefix="${BLUE}::${RESET}"

echo -e "${BLUE}Anaconda installer$RESET"
read -p "Do you want to download the lastest Anaconda installer? [y/N]: " choice 
choice=${choice,,}

if [[ $choice != "y" ]];then
	echo -e "${RED}Download cancelled$RESET"
	exit 0
fi

echo -e "${prefix}Fetching the latest anaconda installer info"
latest=$(curl -s https://repo.anaconda.com/archive/ | \
         grep -o 'Anaconda3-[0-9]\{4\}\.[0-9]\{2\}-0-Linux-x86_64.sh' | \
         sort -V | tail -1)
echo -e "latest version found: ${BLUE}${latest}${RESET}"

mkdir -p "$HOME/Downloads"
DOWNLOAD_PATH="$HOME/Downloads/$latest"

link="https://repo.anaconda.com/archive/$latest"
echo -e "${prefix}${YELLOW}Downloading...${RESET}"

wget -q --show-progress "$link" -O "$DOWNLOAD_PATH"

if [[ $? != 0 ]]; then
	echo -e "${RED}Download Failed${RESET}"
	exit 1
fi

echo -e "$prefix ${GREEN}Download completed${RESET}"
echo -e "${GREEN}>>${RESET} File Saved at: ${YELLOW}${DOWNLOAD_PATH}${RESET}"
