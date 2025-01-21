#!/bin/bash

# Script to set up SSH for GitHub
set -e

echo "=== Setting up SSH for GitHub ==="

# Step 1: Check for an existing SSH key
SSH_KEY="$HOME/.ssh/id_ed25519"
if [[ -f "$SSH_KEY" ]]; then
    echo "SSH key already exists: $SSH_KEY"
else
    echo "No SSH key found. Generating a new SSH key..."
    ssh-keygen -t ed25519 -C "johnzhihaoshen@gmail.com" -f "$SSH_KEY" -q -N ""
    echo "SSH key generated: $SSH_KEY"
fi

# Step 2: Start the SSH agent
echo "Starting the SSH agent..."
eval "$(ssh-agent -s)"

# Step 3: Add the SSH key to the SSH agent
echo "Adding SSH key to the SSH agent..."
ssh-add "$SSH_KEY"

# Step 4: Display the public key and prompt user to add it to GitHub
echo "Your SSH public key:"
cat "$SSH_KEY.pub"
echo
echo "Copy the above SSH key and add it to your GitHub account."
echo "Go to: https://github.com/settings/keys"

# Step 5: Test the SSH connection to GitHub
read -p "Press Enter after adding the SSH key to GitHub to test the connection..."
echo "Testing SSH connection to GitHub..."
ssh -T git@github.com || { echo "SSH connection failed. Ensure the key is added to GitHub."; exit 1; }

# Step 6: Create SSH config for GitHub (optional)
SSH_CONFIG="$HOME/.ssh/config"
if ! grep -q "Host github.com" "$SSH_CONFIG" 2>/dev/null; then
    echo "Adding SSH configuration for GitHub..."
    {
        echo ""
        echo "Host github.com"
        echo "  HostName github.com"
        echo "  User git"
        echo "  IdentityFile $SSH_KEY"
    } >> "$SSH_CONFIG"
    echo "SSH configuration added to $SSH_CONFIG"
else
    echo "SSH configuration for GitHub already exists in $SSH_CONFIG"
fi

echo "=== SSH setup for GitHub complete! ==="