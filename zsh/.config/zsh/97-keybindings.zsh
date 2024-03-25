#-------------------------------------------------------------------------------
# Select keymap
#-------------------------------------------------------------------------------

# Use emacs keybindings
bindkey -e


#-------------------------------------------------------------------------------
# Additional keybindings
#-------------------------------------------------------------------------------

# Unbind default up and down and history search actions and 
bindkey -r '^P' '^[OA' '^[[5~' '^[[A'
bindkey -r '^N' '^[OB' '^[[6~' '^[[B'

if (( ${+functions[history-substring-search-up]} && ${+functions[history-substring-search-down]} )); then
    bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down
else
    autoload -U up-line-or-beginning-search down-line-or-beginning-search
    zle -N up-line-or-beginning-search
    zle -N down-line-or-beginning-search

    bindkey '^[OA' up-line-or-beginning-search
    bindkey '^[OB' down-line-or-beginning-search
fi

bindkey '^Xh' _complete_help

#-------------------------------------------------------------------------------
# Keybindings from oh-my-zsh
#-------------------------------------------------------------------------------

# # Make sure that the terminal is in application mode when zle is active, since
# # only then values from $terminfo are valid
# if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
#   function zle-line-init() {
#     echoti smkx
#   }
#   function zle-line-finish() {
#     echoti rmkx
#   }
#   zle -N zle-line-init
#   zle -N zle-line-finish
# fi
#
# # [PageUp] - Up a line of history
# if [[ -n "${terminfo[kpp]}" ]]; then
#   bindkey "${terminfo[kpp]}" up-line-or-history
# fi
# # [PageDown] - Down a line of history
# if [[ -n "${terminfo[knp]}" ]]; then
#   bindkey "${terminfo[knp]}" down-line-or-history
# fi
#
#
# # [Home] - Go to beginning of line
# if [[ -n "${terminfo[khome]}" ]]; then
#   bindkey "${terminfo[khome]}" beginning-of-line
# fi
# # [End] - Go to end of line
# if [[ -n "${terminfo[kend]}" ]]; then
#   bindkey "${terminfo[kend]}"  end-of-line
# fi
#
# # [Shift-Tab] - move through the completion menu backwards
# if [[ -n "${terminfo[kcbt]}" ]]; then
#   bindkey "${terminfo[kcbt]}" reverse-menu-complete
# fi
#
# # [Backspace] - delete backward
# bindkey '^?' backward-delete-char
# # [Delete] - delete forward
# if [[ -n "${terminfo[kdch1]}" ]]; then
#   bindkey "${terminfo[kdch1]}" delete-char
# else
#   bindkey "^[[3~" delete-char
#
#   bindkey "^[3;5~" delete-char
# fi
#
# # [Ctrl-Delete] - delete whole forward-word
# bindkey '^[[3;5~' kill-word
#
# # [Ctrl-RightArrow] - move forward one word
# bindkey '^[[1;5C' forward-word
# # [Ctrl-LeftArrow] - move backward one word
# bindkey '^[[1;5D' backward-word
#
# # [Esc-w] - Kill from the cursor to the mark
# bindkey '\ew' kill-region
# # [Ctrl-r] - Search backward incrementally for a specified string. The string may begin with ^ to anchor the search to the beginning of the line.
# bindkey '^r' history-incremental-search-backward
# # [Space] - don't do history expansion
# bindkey ' ' magic-space
#
# # Edit the current command line in $EDITOR
# autoload -U edit-command-line
# zle -N edit-command-line
# bindkey '\C-x\C-e' edit-command-line
#
# # file rename magick
# bindkey "^[m" copy-prev-shell-word
