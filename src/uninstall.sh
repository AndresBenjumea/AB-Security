#!/bin/bash

set -e

echo "Removing AB Cyber Security Toolkit..."
rm -rf config logs src
rm -f install.sh uninstall.sh LICENSE README.md absec.sh

echo "Uninstallation complete."
