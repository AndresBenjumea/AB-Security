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
