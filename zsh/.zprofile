# This file is executed only for login shells, i.e. at the start of the session.
# It won't be executed when a shell is started inside of another shell,
# so it's a perfect place for configuration which should be performed only once,
# like environment variables.

#-------------------------------------------------------------------------------
# XDG variables
#-------------------------------------------------------------------------------

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.local/cache"


#-------------------------------------------------------------------------------
# Clean home
#-------------------------------------------------------------------------------
# Environment variables for moving some dot directories 
# and files outside of HOME

# Move go modules from HOME
if (( ${+commands[go]} )); then
    export GOPATH="$XDG_STATE_HOME/go"
fi

# Disable session restoration in Terminal.app so it doesn't create files in HOME
export SHELL_SESSIONS_DISABLE=1

# Disable less history
export LESSHISTFILE='-'

export GNUPGHOME="$XDG_DATA_HOME/gpg"


#-------------------------------------------------------------------------------
# Path configuration
#-------------------------------------------------------------------------------

if [[ -x /opt/homebrew/bin/brew ]]; then
    brew_env="$(/opt/homebrew/bin/brew shellenv)"
    # Remove PATH if it's already set
    if [[ $PATH[(I)/opt/homebrew*] -ne 0 ]]; then
        brew_env="$(sed '/export PATH/d' <<< "$brew_env")"
    fi
    eval "$brew_env"
    unset brew_env
fi

# TODO: stow this files into ~/.local/bin as part of installation
if [[ -d "$HOME/Environment/bin" ]]; then
    export PATH="$HOME/Environment/bin:$PATH"
fi


#-------------------------------------------------------------------------------
# Homebrew configuration
#-------------------------------------------------------------------------------

# Use bat instead of cat in homebrew
export HOMEBREW_BAT=1

# Don't show hints for disabling autoupdate and other stuff
export HOMEBREW_NO_ENV_HINTS=1


#-------------------------------------------------------------------------------
# Pager configuration
#-------------------------------------------------------------------------------

export PAGER='less'

# Default options for less
export LESS="--ignore-case --RAW-CONTROL-CHARS --tabs=4"

# Use bat as man pager
if (( ${+commands[bat]} )); then
    export MANPAGER="sh -c 'col -bx | bat --paging=always --decorations=never --language=man'"
fi


#-------------------------------------------------------------------------------
# Other program configuration
#-------------------------------------------------------------------------------

if (( ${+commands[nvim]} )); then
    export EDITOR="nvim"
elif (( ${+commands[vim]} )); then
    export EDITOR="vim"
fi
