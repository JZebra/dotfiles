#!/bin/bash

# Script to set up SSH for GitHub
set -e

echo "=== Setting up SSH for GitHub ==="

# Step 1: Set up .gitconfig and .gitignore symlinks
echo "Setting up .gitconfig and .gitignore"
SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
rm -rf ~/.gitconfig ~/.gitignore
ln -s "$SCRIPT_DIR/.gitconfig" ~/.gitconfig
ln -s "$SCRIPT_DIR/.gitignore" ~/.gitignore

# Step 2: Ensure necessary directories exist
echo "Setting up directories..."
mkdir -p "$HOME/.ssh"

# Step 3: Configure Git directly
echo "Configuring Git..."
git config --global user.name "John Shen"
git config --global user.email johnzhihaoshen@gmail.com

# Verify the configuration
echo "Verifying Git configuration..."
echo "Git config file location: $(git config --list --show-origin | grep 'user.name' || echo 'Not set')"
echo "Current Git user.name: $(git config user.name || echo 'Not set')"
echo "Current Git user.email: $(git config user.email || echo 'Not set')"

# Step 4: Check for an existing SSH key
SSH_KEY="$HOME/.ssh/id_ed25519"
if [[ -f "$SSH_KEY" ]]; then
    echo "SSH key already exists: $SSH_KEY"
else
    echo "No SSH key found. Generating a new SSH key..."
    ssh-keygen -t ed25519 -C "johnzhihaoshen@gmail.com" -f "$SSH_KEY" -q -N ""
    echo "SSH key generated: $SSH_KEY"

    echo "Starting the SSH agent..."
    eval "$(ssh-agent -s)"

    echo "Adding SSH key to the SSH agent..."
    ssh-add "$SSH_KEY"

    echo "Your SSH public key:"
    cat "$SSH_KEY.pub"
    echo
    echo "Copy the above SSH key and add it to your GitHub account."
    echo "Go to: https://github.com/settings/keys"

    read -p "Press Enter after adding the SSH key to GitHub to test the connection..."
    echo "Testing SSH connection to GitHub..."
    ssh -T git@github.com
fi


# SSH_CONFIG="$HOME/.ssh/config"
# if ! grep -q "Host github.com" "$SSH_CONFIG" 2>/dev/null; then
#     echo "Adding SSH configuration for GitHub..."
#     {
#         echo ""
#         echo "Host github.com"
#         echo "  HostName github.com"
#         echo "  User git"
#         echo "  IdentityFile $SSH_KEY"
#     } >> "$SSH_CONFIG"
#     echo "SSH configuration added to $SSH_CONFIG"
# else
#     echo "SSH configuration for GitHub already exists in $SSH_CONFIG"
# fi

echo "=== SSH setup for GitHub complete! ==="