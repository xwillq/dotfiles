if (( ! ${+commands[zoxide]} )); then
    return
fi

#-------------------------------------------------------------------------------
# Configure zoxide
#-------------------------------------------------------------------------------

export _ZO_DATA_DIR="$XDG_STATE_HOME/zoxide"
export _ZO_EXCLUDE_DIRS="$HOME:$HOME/Library:$HOME/Library/*:/Applications:/Applications/*"


#-------------------------------------------------------------------------------
# Install shell integration
#-------------------------------------------------------------------------------
# This must be done after compinit

if [[ ! -f "$XDG_STATE_HOME/zsh/zoxide.zsh" ]]; then
    # TODO: compile
    zoxide init --cmd cd --hook pwd zsh > "$XDG_STATE_HOME/zsh/zoxide.zsh"
fi

source "$XDG_STATE_HOME/zsh/zoxide.zsh"
