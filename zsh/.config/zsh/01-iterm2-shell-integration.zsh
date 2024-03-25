if [[ $TERM_PROGRAM != "iTerm.app" ]]; then
    return
fi

#-------------------------------------------------------------------------------
# Download iTerm2 shell integration
#-------------------------------------------------------------------------------

if [[ ! -e "$XDG_STATE_HOME/zsh/iterm2-shell-integration.zsh" ]]; then
    echo "iTerm2 shell integration not found, downloading latest release."
    url=https://iterm2.com/shell_integration/zsh

    if (( ${+commands[curl]} )); then
        curl -fsSL --create-dirs -o "$XDG_STATE_HOME/zsh/iterm2-shell-integration.zsh" $url
    else
        mkdir -p "$XDG_STATE_HOME/zsh/iterm2-shell-integration.zsh" && 
            wget -nv -O "$XDG_STATE_HOME/zsh/iterm2-shell-integration.zsh" $url
    fi

    unset url
fi

# TODO: compile
source "$XDG_STATE_HOME/zsh/iterm2-shell-integration.zsh"
