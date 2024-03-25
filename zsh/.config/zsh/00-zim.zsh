#-------------------------------------------------------------------------------
# Configure Zim
#-------------------------------------------------------------------------------

ZIM_HOME="$XDG_STATE_HOME/zsh/zim"
ZIM_CONFIG_FILE="$XDG_CONFIG_HOME/zsh/zimrc"

zstyle ':zim:zmodule' use 'degit'


#-------------------------------------------------------------------------------
# Download Zim
#-------------------------------------------------------------------------------

if [[ ! -e "$ZIM_HOME/zimfw.zsh" ]]; then
    echo "Zim not found, downloading latest release."
    zim_url=https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh

    if (( ${+commands[curl]} )); then
        curl -fsSL --create-dirs -o "$ZIM_HOME/zimfw.zsh" $zim_url
    else
        mkdir -p "$ZIM_HOME" && wget -nv -O "$ZIM_HOME/zimfw.zsh" $zim_url
    fi

    unset zim_url
fi


#-------------------------------------------------------------------------------
# Download and compile plugins
#-------------------------------------------------------------------------------

if [[ ! "$ZIM_HOME/init.zsh" -nt "$ZIM_CONFIG_FILE" ]]; then
    source "$ZIM_HOME/zimfw.zsh" init
fi
