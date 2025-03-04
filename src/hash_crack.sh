#!/bin/bash

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
RESET='\033[0m'

# Check for hashcat
if ! command -v hashcat &>/dev/null; then
    echo -e "${RED}Hashcat is not installed. Installing...${RESET}"
    sudo apt update && sudo apt install hashcat -y
fi

read -p "Enter the hash file: " hash_file
read -p "Enter the wordlist file: " wordlist

if [[ -f "$hash_file" && -f "$wordlist" ]]; then
    echo -e "${YELLOW}Starting hash cracking...${RESET}"
    hashcat -m 0 "$hash_file" "$wordlist" --force
    echo -e "${GREEN}Hash cracking completed!${RESET}"
else
    echo -e "${RED}Hash file or wordlist not found!${RESET}"
fi
