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
cat <<EOL > config/settings.conf || { echo "Failed to write settings.conf"; exit 1; }
# Configuration File for the Security Toolkit
LOG_DIR="logs"
SCAN_MODE="stealth"
HASH_ALGORITHM="sha256"
EOL

# Populate README
cat <<EOL > README.md || { echo "Failed to write README.md"; exit 1; }
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
cat <<EOL > LICENSE || { echo "Failed to write LICENSE"; exit 1; }
MIT License

Copyright (c) $(date +%Y)

Permission is hereby granted, free of charge, to any person obtaining a copy...
EOL

# Create install script
cat <<EOL > install.sh || { echo "Failed to write install.sh"; exit 1; }
#!/bin/bash

set -e

echo "Installing AB Cyber Security Toolkit..."
echo "Ensuring all scripts are executable..."
chmod +x src/*.sh

if [ ! -d "logs" ]; then
    mkdir logs
fi

echo "Installation complete. To run the toolkit, execute:"
echo "\n  ./src/absec.sh\n"
EOL
chmod +x install.sh

# Create uninstall script
cat <<EOL > uninstall.sh || { echo "Failed to write uninstall.sh"; exit 1; }
#!/bin/bash

set -e

echo "Removing AB Cyber Security Toolkit..."
rm -rf config logs src
rm -f install.sh uninstall.sh LICENSE README.md

echo "Uninstallation complete."
EOL
chmod +x uninstall.sh

# Create absec.sh (Main Menu)
cat <<EOL > src/absec.sh || { echo "Failed to write absec.sh"; exit 1; }
#!/bin/bash

# Colors
YELLOW='
