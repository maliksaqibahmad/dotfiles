#!/bin/bash

# Define the config directories to back up
CONFIG_DIRS=(~/.config/i3 ~/.config/kitty ~/.config/ranger ~/.config/picom ~/.config/rofi  ~/.config/tmux ~/.config/zshrc)

# Navigate to your backup repository directory
cd ~/backup-config || { echo "Backup repo not found"; exit 1; }

# Create a backup directory if it doesn't exist
mkdir -p backup

# Keep trying until push is successful
while true; do
    # Pull the latest changes (if any)
    git pull origin main

    # Clear the previous backup
    rm -rf backup/*

    # Copy the specified config directories to the backup directory
    for dir in "${CONFIG_DIRS[@]}"; do
        if [ -d "$dir" ]; then
            cp -r "$dir" backup/
        else
            echo "Directory $dir does not exist. Skipping."
        fi
    done

    # Add all changes
    git add .

    # Check if there are any changes to commit
    if git diff --cached --quiet; then
        echo "No changes to backup"
        break
    else
        # Commit the changes with a timestamp
        git commit -m "Automated backup on $(date)"

        # Try to push changes
        if git push origin main; then
            echo "Backup successful on $(date)"
            break
        else
            echo "Push failed. Retrying in 60 seconds..."
            sleep 60
        fi
    fi
done

