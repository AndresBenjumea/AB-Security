#!/bin/bash

# AB Cyber Security Toolkit Setup
# This script initializes the project with the required structure and files.

# Define project structure
dirs=(
    "config"
    "logs"
    "src"
)

files=(
    "config/settings.conf"
    "install.sh"
    "uninstall.sh"
    "LICENSE"
    "README.md"
    "src/absec.sh"
    "src/encrypt_decrypt.sh"
    "src/hash_crack.sh"
    "src/nmap_scan.sh"
)

# Create directories
for dir in "${dirs[@]}"; do
    mkdir -p "$dir" || { echo "Failed to create directory: $dir"; exit 1; }
done

# Create files
for file in "${files[@]}"; do
    touch "$file" || { echo "Failed to create file: $file"; exit 1; }
done

# Add executable permissions to scripts
chmod +x install.sh uninstall.sh src/*.sh || { echo "Failed to set execute permissions"; exit 1; }

# Populate default settings
cat > config/settings.conf << EOL
# Configuration File for the Security Toolkit
LOG_DIR="logs"
SCAN_MODE="stealth"
HASH_ALGORITHM="sha256"
EOL

# Populate README
cat > README.md << EOL
# Cyber Security Toolkit

This toolkit provides various security-related functionalities:
- **absec.sh**: Network automation tools
- **encrypt_decrypt.sh**: File encryption and decryption utilities
- **hash_crack.sh**: Hash cracking mechanisms
- **nmap_scan.sh**: Advanced Nmap scanning

## Installation
Run:
\`\`\`bash
./install.sh
\`\`\`

## Running the Toolkit
After installation, you can start the toolkit by running:
\`\`\`bash
./src/absec.sh
\`\`\`

## Uninstallation
Run:
\`\`\`bash
./uninstall.sh
\`\`\`

## Configuration
Modify \`config/settings.conf\` to customize settings.
EOL

# Populate LICENSE (MIT as an example)
cat > LICENSE << EOL
MIT License

Copyright (c) $(date +%Y)

Permission is hereby granted, free of charge, to any person obtaining a copy...
EOL

# Create install script
cat > install.sh << EOL
#!/bin/bash

set -e

echo "Installing AB Cyber Security Toolkit..."
echo "Ensuring all scripts are executable..."
chmod +x src/*.sh

if [ ! -d "logs" ]; then
    mkdir logs
fi

echo "Installation complete. To run the toolkit, execute:"
echo -e "\n  ./src/absec.sh\n"
EOL
chmod +x install.sh

# Create uninstall script
cat > uninstall.sh << EOL
#!/bin/bash

set -e

echo "Removing AB Cyber Security Toolkit..."
rm -rf config logs src
rm -f install.sh uninstall.sh LICENSE README.md

echo "Uninstallation complete."
EOL
chmod +x uninstall.sh

# Create absec.sh (Main Menu)
cat > src/absec.sh << EOL
#!/bin/bash

# Colors
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
RESET='\033[0m'

# Function to display banner
show_banner() {
    figlet -f slant "ABSEC" | lolcat --freq 0.9 --seed 42 --spread 5
    echo -e "${YELLOW}Welcome to ABSEC - Network Security Toolkit${RESET}\n"
}

# Main menu
main_menu() {
    while true; do
        echo -e "${BLUE}Select an option:${RESET}"
        echo -e "${YELLOW}1) Encrypt/Decrypt Files"
        echo -e "   2) Hash Cracking"
        echo -e "   3) Nmap Scan"
        echo -e "   4) Exit${RESET}"
        read -p "Enter your choice: " choice

        case "$choice" in
            1) bash ./src/encrypt_decrypt.sh ;;
            2) bash ./src/hash_crack.sh ;;
            3) bash ./src/nmap_scan.sh ;;
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
EOL
chmod +x src/absec.sh

# Print completion message
echo "AB Cyber Security Toolkit setup complete! Ready for GitHub deployment."
echo -e "To run the toolkit, execute:\n\n  ./src/absec.sh\n"
