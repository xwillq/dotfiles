#!/bin/zsh

echo "Linking dnscrypt-proxy configs..."

ln -s $HOME/.config/dnscrypt-proxy/dnscrypt-proxy.toml $HOMEBREW_PREFIX/etc/
ln -s $HOME/.config/dnscrypt-proxy/dnscrypt-proxy.d $HOMEBREW_PREFIX/etc/

echo "Dnscrypt-proxy configs linked"

echo "Starting dnscrypt-proxy..."

sudo brew services start dnscrypt-proxy

echo "Dnscrypt-proxy started"
