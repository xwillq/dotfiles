#-------------------------------------------------------------------------------
# XDG variables
#-------------------------------------------------------------------------------

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"


#-------------------------------------------------------------------------------
# Homebrew configuration
#-------------------------------------------------------------------------------

# Use bat instead of cat in homebrew
export HOMEBREW_BAT=1

# Don't show hints for disabling autoupdate and other stuff
export HOMEBREW_NO_ENV_HINTS=1

# Run autoremove after cleanup and uninstall
export HOMEBREW_AUTOREMOVE=1


#-------------------------------------------------------------------------------
# Path configuration
#-------------------------------------------------------------------------------

if [[ -x /opt/homebrew/bin/brew ]]; then
    brew_env="$(/opt/homebrew/bin/brew shellenv)"
    # Remove PATH if it's already set
    if [[ $path[(I)/opt/homebrew*] -ne 0 ]]; then
        brew_env="$(sed '/export PATH/d' <<<"$brew_env")"
    fi
    eval "$brew_env"
    unset brew_env
fi

if [[ -d "$HOME/Environment/bin" ]]; then
    export PATH="$HOME/Environment/bin:$PATH"
fi


#-------------------------------------------------------------------------------
# Other programs configuration
#-------------------------------------------------------------------------------

# Zoxide
if (( ${+commands[zoxide]} )); then
    export _ZO_EXCLUDE_DIRS="$HOME:$HOME/Library:$HOME/Library/*:/Applications:/Applications/*"
fi

# Go
if (( ${+commands[go]} )); then
    export GOENV="$XDG_CONFIG_HOME/go/env"
fi

if (( ${+commands[fzf]} )); then
    export FZF_DEFAULT_OPTS="--no-separator --color=dark,fg:-1,fg+:-1,bg:-1,bg+:-1,hl:#5fff87,hl+:#ffaf5f,info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7,separator:bold"
fi

# Use bat as man pager
if (( ${+commands[bat]} )); then
    export MANPAGER="sh -c 'col -bx | bat --paging=always --decorations=never --language=man'"
fi

# Less
export LESSHISTFILE=/dev/null
export LESS="--ignore-case --RAW-CONTROL-CHARS --tabs=4"

# Disable session restoration in Terminal.app, because it's generally not needed
# and creates garbage in home directory
export SHELL_SESSIONS_DISABLE=1


if [[ -z $EDITOR ]]; then
    if (( ${+commands[nvim]} )); then
        export EDITOR="nvim"
    elif (( ${+commands[vim]} )); then
        export EDITOR="vim"
    fi
fi

export PAGER='less'
