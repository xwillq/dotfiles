#-------------------------------------------------------------------------------
# Configure Zim
#-------------------------------------------------------------------------------

ZIM_HOME="$XDG_DATA_HOME/zsh/zim"
ZIM_CONFIG_FILE="$XDG_CONFIG_HOME/zsh/zimrc"

zstyle ':zim:zmodule' use 'degit'


#-------------------------------------------------------------------------------
# Download external scripts
#-------------------------------------------------------------------------------

# Download zimfw plugin manager
if [[ ! -e "$ZIM_HOME/zimfw.zsh" ]]; then
    zim_url=https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
    if (( ${+commands[curl]} )); then
        curl -fsSL --create-dirs -o "$ZIM_HOME/zimfw.zsh" $zim_url
    else
        mkdir -p "$ZIM_HOME" && wget -nv -O "$ZIM_HOME/zimfw.zsh" $zim_url
    fi
    unset zim_url
fi


#-------------------------------------------------------------------------------
# Install and compile modules
#-------------------------------------------------------------------------------

if [[ ! "$ZIM_HOME/init.zsh" -nt "$ZIM_CONFIG_FILE" ]]; then
    source "$ZIM_HOME/zimfw.zsh" init
fi


#-------------------------------------------------------------------------------
# Powerlevel10k instant prompt
#-------------------------------------------------------------------------------

if [[ -r "${XDG_CACHE_HOME}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


#-------------------------------------------------------------------------------
# TODO: Move this
#-------------------------------------------------------------------------------

if (( ${+commands[brew]} )); then
    FPATH="$HOMEBREW_PREFIX/share/zsh/site-functions:$FPATH"
fi

FPATH="$XDG_DATA_HOME/zsh/site-functions:$FPATH"

if (( ${+commands[docker]} )); then
    autoload -Uz docker
fi

if (( ${+commands[brew]} )); then
    autoload -Uz brew
fi

if (( ${+commands[fzf]} )); then
    source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"
    export FZF_CTRL_R_OPTS='--layout=reverse'
fi


#-------------------------------------------------------------------------------
# Module configuration
#-------------------------------------------------------------------------------

# Aloxaf/fzf-tab
zstyle ':fzf-tab:*' prefix '·'
zstyle ':fzf-tab:*' single-group prefix color header
zstyle ':fzf-tab:*' switch-group '[' ']'

# MichaelAquilina/zsh-you-should-use
YSU_MESSAGE_POSITION='after'
YSU_IGNORED_ALIASES=('ll' 'la' 'nv' 'vim')

# Enable iterm shell integration in powerlevel10k
ITERM_SHELL_INTEGRATION_INSTALLED='Yes'


#-------------------------------------------------------------------------------
# Initialize modules
#-------------------------------------------------------------------------------

source "$ZIM_HOME/init.zsh"


#-------------------------------------------------------------------------------
# Post-init module configuration
#-------------------------------------------------------------------------------

# marzocchi/zsh-notify
zstyle ':notify:*' success-title 'Command finished (in #{time_elapsed})'
zstyle ':notify:*' error-title 'Command failed (in #{time_elapsed})'
zstyle ':notify:*' command-complete-timeout 5
zstyle ':notify:*' blacklist-regex 'nvim|vim|man|ssh'

# zsh-users/zsh-history-substring-search
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=green,fg=white,bold'

# voronkovich/symfony-complete.plugin.zsh
compdef _symfony_complete artisan
compdef _symfony_complete composer
compdef _symfony_complete phpstan

# ohmyzsh/ohmyzsh/lib/termsupport.zsh
ZSH_THEME_TERM_TAB_TITLE_IDLE=
ZSH_THEME_TERM_TITLE_IDLE=
# termsupport uses omz_urlencode function, but does not provide it.
# Define dummy function so it doesn't break
function omz_urlencode() {
    zparseopts -D -E -a opts r m P
    echo -E "$@"
}

# zsh-users/zsh-autosuggestions
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=30
ZSH_AUTOSUGGEST_USE_ASYNC=true

# TODO: move
if (( ${+commands[zoxide]} )); then
    # TODO: compile this script
    filename="$XDG_DATA_HOME/zsh/zoxide.zsh"
    if [[ ! -f "$filename" ]]; then
        zoxide init --cmd cd --hook pwd zsh > "$filename"
    fi
    # Must be after compinit
    # TODO: Change fzf config
    source $filename
    unset filename
fi
