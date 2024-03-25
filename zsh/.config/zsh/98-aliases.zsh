# Alias definitions are done at the last moment, when all functions and
# programs exist and are discoverable. This makes it possible to check if
# program exists before defining alias for it.
#
# Sometimes `${aliases[<existing alias>]}` is used in order to make new alias
# "inherit" value of `existing alias`, while "erasing" this inheritance
# from output of `alias`. This makes searching for aliases easier.

#-------------------------------------------------------------------------------
# git
#-------------------------------------------------------------------------------

alias g="git"

# Information about changes
alias gst="${aliases[g]} status"
alias gd="${aliases[g]} diff"

# Commit & commit preparation
alias ga="${aliases[g]} add"
alias grs="${aliases[g]} restore" # Mnemonic: [g]it [r]e[s]tore
alias grst="${aliases[grs]} --staged" # Mnemonic: [g]it [r]estore [st]aged
alias gc="${aliases[g]} commit"
alias gca="${aliases[gc]} --amend"

# Stash
alias gsta="${aliases[g]} stash push"
alias gstu="${aliases[gsta]} --include-untracked"
alias gstp="${aliases[g]} stash pop"
alias gstaa="${aliases[g]} stash apply"
alias gstd="${aliases[g]} stash drop"
alias gstl="${aliases[g]} stash list"
alias gsts="${aliases[g]} stash show --include-untracked"

# Reset
alias grh="${aliases[g]} reset"
alias grhs="${aliases[grh]} --soft"
alias grhh="${aliases[grh]} --hard"

# Branch operations
alias gsw="${aliases[g]} switch"
alias gswc="${aliases[gsw]} --create"
alias gswC="${aliases[gsw]} --force-create"
alias gb="${aliases[g]} branch"
alias gbd="${aliases[gb]} --delete"
alias gbD="${aliases[gbd]} --force"

# Rebase
alias grb="${aliases[g]} rebase"
alias grba="${aliases[grb]} --abort"
alias grbc="${aliases[grb]} --continue"
alias grbi="${aliases[grb]} --interactive"
alias grbo="${aliases[grb]} --onto"
alias grbs="${aliases[grb]} --skip"

# Merge
alias gm="${aliases[g]} merge"
alias gma="${aliases[gm]} --abort"

# Log
alias glg="${aliases[g]} log"
alias glga="${aliases[glg]} --all"
alias glgg="${aliases[glg]} --graph"
alias glgga="${aliases[glgg]} --all"

# Remote repositories
alias gl="${aliases[g]} pull"
alias glp="${aliases[gl]} --prune"
alias gf="${aliases[g]} fetch"
alias gfp="${aliases[gf]} --prune"
alias gp="${aliases[g]} push"
alias gpf="${aliases[gp]} --force-with-lease --force-if-includes"
alias gpsup="${aliases[gp]} --set-upstream origin \$(git branch --show-current)"
alias gpfsup="${aliases[gpf]} --set-upstream origin \$(git branch --show-current)"

# Checkout
alias gco="${aliases[g]} checkout"


#-------------------------------------------------------------------------------
# docker
#-------------------------------------------------------------------------------

alias docker='docker --log-level=error'

alias dco="${aliases[docker]} compose"
alias dcup="${aliases[dco]} up"
alias dcupd="${aliases[dcup]} -d"
alias dcdn="${aliases[dco]} down"
alias dcl="${aliases[dco]} logs"
alias dce="${aliases[dco]} exec"
alias dcps="${aliases[dco]} ps"


#-------------------------------------------------------------------------------
# ls/eza/exa
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
# bat/cat/less
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
# neovim/vim
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

if (( ${+commands[php-cs-fixer]} || ${+functions[php-cs-fixer]} )); then
    alias pcs="php-cs-fixer"
    alias pcsf="${aliases[pcs]} fix"
    alias pcsc="${aliases[pcs]} check"
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
