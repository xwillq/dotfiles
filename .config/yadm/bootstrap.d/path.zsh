#!/bin/zsh

echo 'Configuring PATH for GIU apps...'

default_launchd_path='/usr/bin:/bin:/usr/sbin:/sbin'

if type brew &>/dev/null; then
  homebrew_prefix="$(brew --prefix)"
else
  homebrew_prefix='/opt/homebrew'
fi
homebrew_path="$homebrew_prefix/bin:$homebrew_prefix/sbin"

local_path="$HOME/.local/bin"

new_path="$local_path:$homebrew_path:$default_launchd_path"

sudo launchctl config user path $new_path

echo "PATH for GUI apps configured to $new_path"

echo 'Configuring /etc/paths...'

sudo sed -i 'backup' "1i\\
$local_path\\
$homebrew_prefix/bin\\
$homebrew_prefix/sbin\\
" /etc/paths

echo '/etc/paths configured'
