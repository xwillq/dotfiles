#-------------------------------------------------------------------------------
# Powerlevel10k instant prompt
#-------------------------------------------------------------------------------
# This must be called after all scripts that make network requests,
# require input, or have output for any other reason.

if [[ -r "$XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "$XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh"
fi
