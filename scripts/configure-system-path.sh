#!/bin/zsh

echo 'Configuring $PATH for GUI apps'

default_launchd_path='/usr/bin:/bin:/usr/sbin:/sbin'

if type brew &>/dev/null; then
  homebrew_prefix="$(brew --prefix)"
else
  homebrew_prefix='/opt/homebrew'
fi

homebrew_bin="$homebrew_prefix/bin"
homebrew_sbin="$homebrew_prefix/sbin"
local_bin="$HOME/.local/bin"

new_path="$local_bin:$homebrew_bin:$homebrew_sbin:$default_launchd_path"

sudo launchctl config user path $new_path


echo 'Configuring /etc/paths...'

sudo sed -i 'backup' "1i\\
$local_path\\
$homebrew_bin\\
$homebrew_sbin\\
" /etc/paths
