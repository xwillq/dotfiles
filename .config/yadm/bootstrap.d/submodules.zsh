#!/bin/zsh

cd "$HOME"

echo "Initializing submodules..."

yadm submodule update --init

echo "Submodules initialized"

