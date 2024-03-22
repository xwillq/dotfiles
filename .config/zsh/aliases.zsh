#-------------------------------------------------------------------------------
# ls -> eza/exa
#-------------------------------------------------------------------------------

alias ll='ls -l'
alias la='ls -la'

if (( ${+commands[eza]} )); then
    alias ls='eza --header --smart-group --group-directories-first --icons --color-scale --git'
elif (( ${+commands[exa]} )); then
    alias ls='exa --header --group-directories-first --icons --color-scale --git'
else
    alias ls='ls -h --color=auto'
    alias la='ls -lA'
fi


#-------------------------------------------------------------------------------
# bat
#-------------------------------------------------------------------------------

if (( ${+commands[bat]} )); then
	alias cat='bat --paging=never --decorations=never --wrap=never'
	alias less='bat --paging=always --decorations=never'
fi


#-------------------------------------------------------------------------------
# ranger
#-------------------------------------------------------------------------------

if (( ${+commands[ranger]} )); then
    alias ranger='source ranger' # changes directory in shell when exiting ranger
    alias rn='ranger'
fi


#-------------------------------------------------------------------------------
# neovim
#-------------------------------------------------------------------------------

if (( ${+commands[nvim]} )); then
    alias vim='nvim'
    alias nv='nvim'
fi


#-------------------------------------------------------------------------------
# PHP projects
#-------------------------------------------------------------------------------

# if (( ${+commands[php]} || ${+functions[php]} )); then
#     alias artisan='php artisan'
# fi

if (( ${+commands[artisan]} || ${+function[artisan]} || ${+aliases[artisan]} )); then
    alias a='artisan'
fi

if (( ${+commands[phpstan]} || ${+functions[phpstan]} )); then
    alias psta='phpstan analyse'
    alias pstc='phpstan clear-result-cache'
fi

if (( ${+commands[composer]} || ${+functions[composer]} )); then
    alias c='composer'
    alias ccp='composer create-project'
    alias cdo='composer dump-autoload -o'
    alias cdu='composer dump-autoload'
    alias cget='curl -s https://getcomposer.org/installer | php'
    alias cgr='composer global require'
    alias cgrm='composer global remove'
    alias cgu='composer global update'
    alias ci='composer install'
    alias co='composer outdated'
    alias cod='composer outdated --direct'
    alias cr='composer require'
    alias crm='composer remove'
    alias cs='composer show'
    alias csu='composer self-update'
    alias cu='composer update'
    alias cuh='composer update --working-dir=$(composer config -g home)'
fi

#-------------------------------------------------------------------------------
# GNU Utilities
#-------------------------------------------------------------------------------

if (( ${+commands[gsed]} )); then
    alias sed='gsed'
fi

#-------------------------------------------------------------------------------
# Other
#-------------------------------------------------------------------------------

alias md='mkdir -p'
alias rd='rmdir'

alias diff='diff --color'
