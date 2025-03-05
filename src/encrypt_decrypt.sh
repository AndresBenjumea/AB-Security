#!/bin/bash

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
RESET='\033[0m'

# Encryption algorithm
ENCRYPTION_ALGO="AES-256-CBC with PBKDF2"

# Function to encrypt text
encrypt_text() {
    echo -e "${YELLOW}Using encryption: $ENCRYPTION_ALGO${RESET}"
    read -p "Enter text to encrypt: " plaintext
    encrypted=$(echo -n "$plaintext" | openssl enc -aes-256-cbc -a -salt -pbkdf2 -pass pass:defaultkey 2>/dev/null)

    if [[ $? -ne 0 ]]; then
        echo -e "${RED}Encryption failed!${RESET}"
    else
        echo -e "${GREEN}Encrypted Text:${RESET}\n$encrypted"
    fi
}

# Function to decrypt text
decrypt_text() {
    echo -e "${YELLOW}Using encryption: $ENCRYPTION_ALGO${RESET}"
    read -p "Enter encrypted text: " encrypted_text
    decrypted=$(echo "$encrypted_text" | openssl enc -aes-256-cbc -a -d -salt -pbkdf2 -pass pass:defaultkey 2>/dev/null)

    if [[ $? -ne 0 ]]; then
        echo -e "${RED}Decryption failed! Invalid text or incorrect encryption.${RESET}"
    else
        echo -e "${GREEN}Decrypted Text:${RESET}\n$decrypted"
    fi
}

# Menu function
main_menu() {
    while true; do
        echo -e "${YELLOW}Select an option:"
        echo -e "1) Encrypt Text"
        echo -e "2) Decrypt Text"
        echo -e "3) Exit${RESET}"
        read -r -p "Choose an option: " choice

        case "$choice" in
            1) encrypt_text ;;
            2) decrypt_text ;;
            3) echo -e "${RED}Exiting...${RESET}"; exit 0 ;;
            *) echo -e "${RED}Invalid choice! Please enter 1, 2, or 3.${RESET}" ;;
        esac
    done
}

# Ensure OpenSSL is installed
if ! command -v openssl &>/dev/null; then
    echo -e "${RED}OpenSSL is not installed. Installing...${RESET}"
    sudo apt update && sudo apt install openssl -y
fi

# Start script
main_menu
