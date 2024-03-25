#-------------------------------------------------------------------------------
# Define completion functions for programs
#-------------------------------------------------------------------------------

compdef _gnu_generic phpunit

# From voronkovich/symfony-complete.plugin.zsh
if (( ${+functions[_symfony_complete]} )); then
    compdef _symfony_complete artisan
    compdef _symfony_complete composer
    compdef _symfony_complete phpstan
    compdef _symfony_complete rector
    compdef _symfony_complete php-cs-fixer
fi


#-------------------------------------------------------------------------------
# General settings
#-------------------------------------------------------------------------------

setopt NO_LIST_BEEP

# Complete missing part at the cursor 
# ('fbar' with cursor after 'f' becomes 'foobar') 
setopt COMPLETE_IN_WORD


#-------------------------------------------------------------------------------
# Path completions
#-------------------------------------------------------------------------------

# Automatically add `/` after completing directory names and remove them 
# if delimiter is typed or command is executed
setopt AUTO_PARAM_SLASH
setopt AUTO_REMOVE_SLASH


#-------------------------------------------------------------------------------
# Completion list style
#-------------------------------------------------------------------------------

zstyle ':completion:*:descriptions' format '[%d]'

# Example for defining styles based on fzf-tab plugin status
if (( ${+functions[fzf-tab-complete]} )); then
else
    # zstyle ':completion:*' menu 'true'
fi


#-------------------------------------------------------------------------------
# Git completions
#-------------------------------------------------------------------------------

local -a git_subcommands

if (( ${+commands[git-filter-repo]} )); then
    git_subcommands+=(filter-repo:'rewrite repository history')
fi

zstyle ':completion:*:*:git:*' user-commands $git_subcommands

unset git_subcommands


#-------------------------------------------------------------------------------
# Styles
#-------------------------------------------------------------------------------
return 

#
# Completion module options
#

# Enable caching
zstyle ':completion::complete:*' use-cache on

# Group matches and describe.
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:matches' group yes
zstyle ':completion:*:options' description yes
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format '%F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:messages' format '%F{purple}-- %d --%f'
zstyle ':completion:*:warnings' format '%F{red}-- no matches found --%f'
zstyle ':completion:*' format '[%d]'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes

# Case insensitive completions
# zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' '+r:|?=**'

# Case insensitive completion with interchangeable _ and - 
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'

# Ignore useless commands and functions
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec)|prompt_*)'
# Array completion element sorting.
zstyle ':completion:*:*:-subscript-:*' tag-order 'indexes' 'parameters'

# Directories
if (( ${+LS_COLORS} )); then
    zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
else
    # Use same LS_COLORS definition from utility module, in case it was not set
    zstyle ':completion:*:default' list-colors ${(s.:.):-di=1;34:ln=35:so=32:pi=33:ex=31:bd=1;36:cd=1;33:su=30;41:sg=30;46:tw=30;42:ow=30;43}
fi
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
zstyle ':completion:*' squeeze-slashes true

# History
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes

# Populate hostname completion.
zstyle -e ':completion:*:hosts' hosts 'reply=(
    ${=${=${=${${(f)"$(cat {/etc/ssh/ssh_,~/.ssh/}known_hosts{,2} 2>/dev/null)"}%%[#| ]*}//\]:[0-9]*/ }//,/ }//\[/ }
    ${=${(f)"$(cat /etc/hosts 2>/dev/null; (( ${+commands[ypcat]} )) && ypcat hosts 2>/dev/null)"}%%(\#)*}
    ${=${${${${(@M)${(f)"$(cat ~/.ssh/config{,.d/*(N)} 2>/dev/null)"}:#Host *}#Host }:#*\**}:#*\?*}}
)'

# Don't complete uninteresting users...
zstyle ':completion:*:*:*:users' ignored-patterns \
    '_*' adm amanda apache avahi beaglidx bin cacti canna clamav daemon dbus \
    distcache dovecot fax ftp games gdm gkrellmd gopher hacluster haldaemon \
    halt hsqldb ident junkbust ldap lp mail mailman mailnull mldonkey mysql \
    nagios named netdump news nfsnobody nobody nscd ntp nut nx openvpn \
    operator pcap postfix postgres privoxy pulse pvm quagga radvd rpc rpcuser \
    rpm shutdown squid sshd sync uucp vcsa xfs

# ... unless we really want to.
zstyle ':completion:*' single-ignored show

# Ignore multiple entries.
zstyle ':completion:*:(rm|kill|diff):*' ignore-line other
zstyle ':completion:*:rm:*' file-patterns '*:all-files'

# Man
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true


#-------------------------------------------------------------------------------
# Options
#-------------------------------------------------------------------------------

# Place cursor at the end of completed word
setopt ALWAYS_TO_END

# List choices after first <tab> if completion is ambiguous
setopt AUTO_LIST
unsetopt BASH_AUTO_LIST

# Complete from menu after second <tab> if completion is ambiguous
setopt AUTO_MENU
# Don't insert first menu candidate when completion is ambiguous
unsetopt MENU_COMPLETE

# Might be useful, needs investigation
#setopt AUTO_PARAM_KEYS

# When completion is ambiguous, complete common prefix before displaying menu
setopt LIST_AMBIGUOUS

# Make menu columns dynamic in order to save space
setopt LIST_PACKED
