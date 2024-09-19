#-------------------------------------------------------------------------------
# Pre-init configuration
#-------------------------------------------------------------------------------

# MichaelAquilina/zsh-you-should-use
YSU_MESSAGE_POSITION='after'
YSU_IGNORED_ALIASES=('ll' 'la' 'nv' 'vim')

# Aloxaf/fzf-tab
# https://github.com/Aloxaf/fzf-tab/wiki/Configuration
zstyle ':fzf-tab:*' switch-group '<' '>'
zstyle ':fzf-tab:*' single-group prefix color header

# termtitle
zstyle ':zim:termtitle' hooks 'precmd' 'preexec'
zstyle ':zim:termtitle:*' format '%~'
autoload -Uz _termtitle
zstyle ':zim:termtitle:preexec' format '$(_termtitle "$@")'



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
