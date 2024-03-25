#-------------------------------------------------------------------------------
# Add completion scripts to FPATH
#-------------------------------------------------------------------------------
# Completion scripts from these paths are meant to be overridden by scripts 
# from plugins or custom ones, as such their path is defined before any other 
# configuration.

local function_path="$XDG_STATE_HOME/zsh/functions"

if [[ ! -d "$function_path" ]]; then
    mkdir -p "$function_path"
fi

FPATH="$function_path:$FPATH"

if (( ${+commands[brew]} )); then
    FPATH="$HOMEBREW_PREFIX/share/zsh/site-functions:$FPATH"
fi


#-------------------------------------------------------------------------------
# Generate completion scripts
#-------------------------------------------------------------------------------

if (( ${+commands[vacuum]} )) && [[ ! -f "$function_path/_vacuum" ]]; then
    vacuum completion zsh > "$function_path/_vacuum"
fi

unset function_path
