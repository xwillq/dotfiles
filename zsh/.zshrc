# This file is executed for every shell, so it contains configuration which
# has to be done every time and variables that will be used only by current 
# process, so that they don't pollute the environment.

#-------------------------------------------------------------------------------
# Initialize directories
#-------------------------------------------------------------------------------
# These directories are required for some configs, so they are created before
# any configuration is done.

if [[ ! -d "$XDG_DATA_HOME/zsh" ]]; then
    mkdir -p "$XDG_DATA_HOME/zsh"
fi
if [[ ! -d "$XDG_STATE_HOME/zsh" ]]; then
    mkdir -p "$XDG_STATE_HOME/zsh"
fi
if [[ ! -d "$XDG_CACHE_HOME/zsh" ]]; then
    mkdir -p "$XDG_CACHE_HOME/zsh"
fi


#-------------------------------------------------------------------------------
# Source configs
#-------------------------------------------------------------------------------

for config in "$XDG_CONFIG_HOME"/zsh/??-*.zsh; do
    source "$config"
done

