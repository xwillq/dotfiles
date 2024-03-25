if (( ! ${+commands[fzf]} )); then
    return
fi

#-------------------------------------------------------------------------------
# Configure fzf
#-------------------------------------------------------------------------------

export FZF_DEFAULT_OPTS="--no-separator --color=dark,fg:-1,fg+:-1,bg:-1,bg+:-1,hl:#5fff87,hl+:#ffaf5f,info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7,separator:bold"
export FZF_CTRL_R_OPTS='--layout=reverse'


#-------------------------------------------------------------------------------
# Install shell integration
#-------------------------------------------------------------------------------

if [[ ! -f "$XDG_STATE_HOME/zsh/fzf.zsh" ]]; then
    # TODO: compile
    fzf --zsh > "$XDG_STATE_HOME/zsh/fzf.zsh"
fi

source "$XDG_STATE_HOME/zsh/fzf.zsh"
