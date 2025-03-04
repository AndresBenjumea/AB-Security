#!/bin/bash

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
RESET='\033[0m'

# Check for nmap
if ! command -v nmap &>/dev/null; then
    echo -e "${RED}Nmap is not installed. Installing...${RESET}"
    sudo apt update && sudo apt install nmap -y
fi

read -p "Enter the target (IP/Domain): " target

echo -e "${YELLOW}Choose a scan type:"
echo -e "1) Quick Scan"
echo -e "2) Stealth Scan"
echo -e "3) Full Port Scan"
echo -e "4) OS Detection"
echo -e "5) Exit${RESET}"
read -p "Enter your choice: " option

case $option in
    1) nmap -T4 -F "$target" ;;
    2) sudo nmap -sS -T3 "$target" ;;
    3) sudo nmap -p- "$target" ;;
    4) sudo nmap -O "$target" ;;
    5) exit 0 ;;
    *) echo -e "${RED}Invalid option!${RESET}" ;;
esac

echo -e "${GREEN}Scan completed.${RESET}"
