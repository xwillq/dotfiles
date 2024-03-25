#-------------------------------------------------------------------------------
# Pre-init configuration
#-------------------------------------------------------------------------------

# MichaelAquilina/zsh-you-should-use
YSU_MESSAGE_POSITION='after'
YSU_IGNORED_ALIASES=('ll' 'la' 'nv' 'vim')

# Aloxaf/fzf-tab
# https://github.com/Aloxaf/fzf-tab/wiki/Configuration
zstyle ':fzf-tab:*' switch-group '[' ']'
zstyle ':fzf-tab:*' single-group prefix color header


#-------------------------------------------------------------------------------
# Initialize plugins
#-------------------------------------------------------------------------------

source "$ZIM_HOME/init.zsh"


#-------------------------------------------------------------------------------
# Post-init configuration
#-------------------------------------------------------------------------------

# zsh-users/zsh-history-substring-search
# TODO: find better colors
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=magenta,fg=white,bold'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=red,fg=white,bold'
HISTORY_SUBSTRING_SEARCH_FUZZY=true
HISTORY_SUBSTRING_SEARCH_PREFIXED=true

# zsh-users/zsh-autosuggestions
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=30
ZSH_AUTOSUGGEST_USE_ASYNC=true
# ZSH_AUTOSUGGEST_MANUAL_REBIND=true

# marzocchi/zsh-notify
zstyle ':notify:*' success-title 'Command finished (in #{time_elapsed})'
zstyle ':notify:*' error-title 'Command failed (in #{time_elapsed})'
zstyle ':notify:*' command-complete-timeout 5
zstyle ':notify:*' blacklist-regex 'nvim|vim|man|ssh'

# ohmyzsh/ohmyzsh/lib/termsupport.zsh
ZSH_THEME_TERM_TAB_TITLE_IDLE=
ZSH_THEME_TERM_TITLE_IDLE=
# termsupport uses omz_urlencode function, but does not provide it.
# Define dummy function so it doesn't break
function omz_urlencode() {
    zparseopts -D -E -a opts r m P
    echo -E "$@"
}
