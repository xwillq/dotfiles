#-------------------------------------------------------------------------------
# Set up FPATH
#-------------------------------------------------------------------------------

if [[ -d "$XDG_DATA_HOME/zsh/site-functions" ]]; then
    FPATH="$XDG_DATA_HOME/zsh/site-functions:$FPATH"
fi


#-------------------------------------------------------------------------------
# Autoload functions
#-------------------------------------------------------------------------------

