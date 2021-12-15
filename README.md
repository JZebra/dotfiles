## Background
This is a repo of my dotfiles to make configuring a new machine easier

## Usage
1. Pull this repo
1. Set Iterm2 preferences to read from this directory
1. Symlink everything else to your root dev dir:
```
ln -s ~/src/dotfiles/.zshrc ~/.zshrc
ln -s dotfiles/.gitconfig .gitconfig
ln -s dotfiles/.gitignore .gitignore
```
