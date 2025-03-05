#!/bin/bash
echo "Script is running..."
# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
RESET='\033[0m'

# Function to encrypt text
encrypt_text() {
    read -sp "Enter a password: " password
    echo
    read -p "Enter text to encrypt: " plaintext
    encrypted=$(echo -n "$plaintext" | openssl enc -aes-256-cbc -a -salt -pass pass:"$password")
    echo -e "${GREEN}Encrypted Text:${RESET} $encrypted"
}

# Function to decrypt text
decrypt_text() {
    read -sp "Enter the password: " password
    echo
    read -p "Enter encrypted text: " encrypted_text
    decrypted=$(echo -n "$encrypted_text" | openssl enc -aes-256-cbc -a -d -salt -pass pass:"$password" 2>/dev/null)
    
    if [[ $? -ne 0 ]]; then
        echo -e "${RED}Decryption failed! Incorrect password or invalid text.${RESET}"
    else
        echo -e "${GREEN}Decrypted Text:${RESET} $decrypted"
    fi
}

# Menu function
main_menu() {
    while true; do
        echo -e "${YELLOW}1) Encrypt Text"
        echo -e "2) Decrypt Text"
        echo -e "3) Exit${RESET}"
        read -p "Choose an option: " choice

        case $choice in
            1) encrypt_text ;;
            2) decrypt_text ;;
            3) echo -e "${RED}Exiting...${RESET}"; exit 0 ;;
            *) echo -e "${RED}Invalid choice!${RESET}" ;;
        esac
    done
}

# Run menu
main_menu
