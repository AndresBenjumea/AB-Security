#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
RESET='\033[0m'

# Function to display banner
show_banner() {
    figlet -f slant "ABSEC" | lolcat
    echo -e "${Blue}Welcome to ABSEC - A Cyber Security Toolbox x Andres Benjumea${RESET}\n"
}

# Main menu
main_menu() {
    while true; do
        echo -e "${White}Select an option:${RESET}"
        echo -e "${YELLOW}1) Encrypt/Decrypt Files"
        echo -e "2) Hash Cracking"
        echo -e "3) Nmap Scan"
        echo -e "4) Exit${RESET}"
        read -p "Enter your choice: " choice

        case $choice in
            1) ./encrypt_decrypt.sh ;;
            2) ./hash_crack.sh ;;
            3) ./nmap_scan.sh ;;
            4) echo -e "${RED}Exiting...${RESET}"; exit 0 ;;
            *) echo -e "${RED}Invalid option!${RESET}" ;;
        esac
    done
}

# Check dependencies
if ! command -v figlet &>/dev/null || ! command -v lolcat &>/dev/null; then
    echo -e "${RED}Missing dependencies! Installing figlet and lolcat...${RESET}"
    sudo apt update && sudo apt install figlet lolcat -y
fi

# Start script
show_banner
main_menu
