#!/bin/bash

set -e  # Exit immediately if any command fails

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)

# zsh
echo "Setting up .zshrc"
rm -rf ~/.zshrc
ln -s "$SCRIPT_DIR/.zshrc" ~/.zshrc
echo "Setting up .zprofile"
rm -rf ~/.zprofile
ln -s "$SCRIPT_DIR/.zprofile" ~/.zprofile

echo "Setup complete!"