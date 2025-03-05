#!/bin/bash

# Colors
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
RESET='\033[0m'

# Function to display banner
show_banner() {
    figlet -f slant "ABSEC" | lolcat --freq 0.9 --seed 42 --spread 5
    echo -e "Welcome to ABSEC - Network Security Toolkit\n"
}

# Main menu
main_menu() {
    while true; do
        echo -e "Select an option:"
        echo -e "1) Encrypt/Decrypt Files"
        echo -e "   2) Hash Cracking"
        echo -e "   3) Nmap Scan"
        echo -e "   4) Exit"
        read -p "Enter your choice: " choice

        case "" in
            1) bash ./src/encrypt_decrypt.sh ;;
            2) bash ./src/hash_crack.sh ;;
            3) bash ./src/nmap_scan.sh ;;
            4) echo -e "Exiting..."; exit 0 ;;
            *) echo -e "Invalid option!" ;;
        esac
    done
}

# Check dependencies
if ! command -v figlet &>/dev/null || ! command -v lolcat &>/dev/null; then
    echo -e "Missing dependencies! Installing figlet and lolcat..."
    sudo apt update && sudo apt install figlet lolcat -y
fi

# Start script
show_banner
main_menu
