#!/bin/bash

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
RESET='\033[0m'

# Check for OpenSSL
if ! command -v openssl &>/dev/null; then
    echo -e "${RED}OpenSSL is not installed. Installing...${RESET}"
    sudo apt update && sudo apt install openssl -y
fi

encrypt_file() {
    read -p "Enter the file to encrypt: " file
    if [[ -f "$file" ]]; then
        openssl enc -aes-256-cbc -salt -in "$file" -out "$file.enc"
        echo -e "${GREEN}File encrypted successfully: $file.enc${RESET}"
    else
        echo -e "${RED}File not found!${RESET}"
    fi
}

decrypt_file() {
    read -p "Enter the file to decrypt: " file
    if [[ -f "$file" ]]; then
        openssl enc -aes-256-cbc -d -salt -in "$file" -out "${file%.enc}"
        echo -e "${GREEN}File decrypted successfully: ${file%.enc}${RESET}"
    else
        echo -e "${RED}File not found!${RESET}"
    fi
}

echo -e "${YELLOW}1) Encrypt a file"
echo -e "2) Decrypt a file"
echo -e "3) Exit${RESET}"
read -p "Choose an option: " option

case $option in
    1) encrypt_file ;;
    2) decrypt_file ;;
    3) exit 0 ;;
    *) echo -e "${RED}Invalid option!${RESET}" ;;
esac
