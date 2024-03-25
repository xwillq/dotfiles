#-------------------------------------------------------------------------------
# Add completion scripts to FPATH
#-------------------------------------------------------------------------------
# Completion scripts from these paths are meant to be overridden by scripts 
# from plugins or custom ones, as such their path is defined before any other 
# configuration.

if (( ${+commands[brew]} )); then
    FPATH="$HOMEBREW_PREFIX/share/zsh/site-functions:$FPATH"
fi

local function_path="$XDG_STATE_HOME/zsh/functions"

if [[ ! -d "$function_path" ]]; then
    mkdir -p "$function_path"
fi

FPATH="$function_path:$FPATH"


#-------------------------------------------------------------------------------
# Generate completion scripts
#-------------------------------------------------------------------------------

if (( ${+commands[vacuum]} )) && [[ ! -f "$function_path/_vacuum" ]]; then
    vacuum completion zsh > "$function_path/_vacuum"
fi

if (( ${+commands[docker]} )) && [[ ! -f "$function_path/_docker" ]]; then
    docker completion zsh > "$function_path/_docker"
fi

unset function_path
