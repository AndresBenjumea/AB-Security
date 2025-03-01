#!/bin/bash
echo "Updating absec to GitHub..."
git add .
git commit -m "Auto-update: latest fixes & improvements"
git pull origin main --rebase
git push orign main
echo "Update Complete!"
