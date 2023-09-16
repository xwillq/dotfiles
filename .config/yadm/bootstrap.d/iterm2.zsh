#!/bin/zsh

echo "Changing iTerm2 config directory..."

# Specify the preferences directory
defaults write com.googlecode.iterm2 PrefsCustomFolder -string "$HOME/.config/iterm2"

# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true

echo "iTerm2 config directory changed to $HOME/.config/iterm2"

