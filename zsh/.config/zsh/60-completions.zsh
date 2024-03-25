#-------------------------------------------------------------------------------
# Completers
#-------------------------------------------------------------------------------
# Things that generate completion candidates.

local -a completers=(
    _complete
    # Doesn't work with fzf-tab.
    # https://github.com/Aloxaf/fzf-tab/issues/56
    # _approximate
    _ignored
)

zstyle ':completion:*' completer $completers

unset completers


#-------------------------------------------------------------------------------
# Matchers
#-------------------------------------------------------------------------------
# Things that check if completion candidate should be displayed
# based on current command line contents and how they will be inserted.

local -a matchers=(
    # Match input string exactly
    # FIXME: breaks case insensitive match for some reason
    # ''

    # Case insensitive match
    'm:{a-zA-Z}={A-Za-z}'
    # Case insensitive match with interchangeable _ and -
    'm:{a-zA-Z_-}={A-Za-z-_}'
    # TODO: IDK wtf is this, need more investigation
    # '+r:|?=**'
    # 'r:|=*'
    # 'l:|=* r:|=*'
)


zstyle ':completion:*' matcher-list "$matchers[@]"

unset matchers


#-------------------------------------------------------------------------------
# General options
#-------------------------------------------------------------------------------

# Complete missing part at the cursor 
# ('fbar' with cursor after 'f' becomes 'foobar').
setopt COMPLETE_IN_WORD

# Move cursor to the end of the word if completion was performed in the middle.
setopt ALWAYS_TO_END

setopt AUTO_PARAM_KEYS


#-------------------------------------------------------------------------------
# Completion list and menu behavior
#-------------------------------------------------------------------------------
# This section configures menu completion and candidate list. Most options
# from here don't do anything when fzf-tab is used and are here for cases when
# fzf-tab is unavailable.

# Don't beep on ambiguous completion.
setopt NO_LIST_BEEP

# Complete common prefix before showing the list of candidates.
# This will allow entering something after said prefix and trying
# completion again, instead of polluting terminal with candidate
# list after first completion attempt.
setopt LIST_AMBIGUOUS

# List candidates on ambiguous completion. 
# AUTO_LIST enables this behavior on first completion attempt,
# BASH_AUTO_LIST on second.
setopt AUTO_LIST
setopt NO_BASH_AUTO_LIST

# Menu completion inserts first completion candidate and cycles through
# all candidates on consecutive completion attempts.
# MENU_COMPLETE enables this behavior on first completion attempt,
# AUTO_MENU on second.
#
# Both options are disabled here so they can be configured dynamically
# in the next statement.
setopt NO_AUTO_MENU
setopt NO_MENU_COMPLETE

# Menu completion can also be configured with compsys, which allows
# usage of dynamic values. Possible values are:
# * true - analogous to MENU_COMPLETE
# * auto - analogous to AUTO_MENU
# * false - analogous to NO_MENU_COMPLETE and NO_AUTO_MENU
# * select - use menu completion (module zsh/complist)
#
# Configuration here is done dynamically based on condition fzf-tab
# uses to check if it's turned on.
zstyle -e ':completion:*' menu '
if (( $+_ftb_orig_widget )); then
    reply=(true)
else
    reply=(auto select interactive)
fi'

# TODO: configure menu selection (module zsh/complist) for cases when
# fzf tab is not present


#-------------------------------------------------------------------------------
# Completion list and menu looks
#-------------------------------------------------------------------------------

# Show types of matches (ex. command, alias, option, etc.)
zstyle ':completion:*:descriptions' format '[%d]'

# Generate descriptions automatically when possible
zstyle ':completion:*' auto-description '%d'

# Show extra information for available options 
zstyle ':completion:*' verbose true

# Don't show extra information for shell variables,
# since it shows variable contents and pollutes shell output too much
zstyle ':completion:*:-parameter-:*' verbose false


#-------------------------------------------------------------------------------
# Path completions
#-------------------------------------------------------------------------------

# Automatically add `/` after completing directory names and remove them 
# if delimiter is typed or command is executed.
setopt AUTO_PARAM_SLASH
setopt AUTO_REMOVE_SLASH

# Complete `foo//bar` as `foo/bar` instead of `foo/*/bar` (default behavior)
zstyle ':completion:*' squeeze-slashes true


#-------------------------------------------------------------------------------
# Completion functions for programs
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
# Git completions
#-------------------------------------------------------------------------------

local -a git_subcommands

if (( ${+commands[git-filter-repo]} )); then
    git_subcommands+=(filter-repo:'rewrite repository history')
fi

zstyle ':completion:*:*:git:*' user-commands $git_subcommands

unset git_subcommands


#-------------------------------------------------------------------------------
# Man completions
#-------------------------------------------------------------------------------

zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true


#-------------------------------------------------------------------------------
# ssh completions
#-------------------------------------------------------------------------------

zstyle ':completion:*:ssh:*' hosts
zstyle ':completion:*:ssh:*' users


return 
#-------------------------------------------------------------------------------
# Styles
#-------------------------------------------------------------------------------

# Enable caching
zstyle ':completion::complete:*' use-cache on

# Group matches and describe.
zstyle ':completion:*:matches' group yes
zstyle ':completion:*:options' description yes
zstyle ':completion:*:corrections' format '%F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:messages' format '%F{purple}-- %d --%f'
zstyle ':completion:*:warnings' format '%F{red}-- no matches found --%f'
zstyle ':completion:*' format '[%d]'
zstyle ':completion:*' group-name ''

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
