#!/usr/bin/env zsh

install_path="$1"
if [[ -z "$install_path" ]]; then
    echo 'Please supply installation path for completion scripts'
    exit 1
fi

mkdir -p "$install_path"
install_path=$(readlink -f "$1")

zsh_repo="${2:-/tmp/zsh-src}"


echo "Completion scripts will be installed into $install_path"

echo 'Cloning zsh repo'

git clone --depth 1 https://git.code.sf.net/p/zsh/code "$zsh_repo"


echo 'Extracting completion scripts'

find "$zsh_repo/Completion" -depth 3 \( -path '*/Command/*' -or -path '*/Type/*' \) -type f -not -name '.*' -exec cp -n '{}' "$install_path/" ';'


echo "Zsh repo is kept at $zsh_repo. Please, remove it manually."

unset install_path zsh_repo


