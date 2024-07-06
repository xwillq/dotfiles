if (( ! ${+commands[fzf]} )); then
    return
fi

#-------------------------------------------------------------------------------
# Configure fzf
#-------------------------------------------------------------------------------

# Material darker
export FZF_DEFAULT_OPTS="--no-separator --color="\
"bg:-1,bg+:#303030,gutter:-1,"\
"fg:-1,fg+:#eeffff,"\
"hl:#82aaff,hl+:#82aaff,"\
"spinner:#89ddff,"\
"header:#82aaff,info:#ffcb6b,pointer:#89ddff,"\
"marker:#89ddff,prompt:#ffcb6b"

export FZF_CTRL_R_OPTS='--layout=reverse'


#-------------------------------------------------------------------------------
# Install shell integration
#-------------------------------------------------------------------------------

if [[ ! -f "$XDG_STATE_HOME/zsh/fzf.zsh" ]]; then
    # TODO: compile
    fzf --zsh > "$XDG_STATE_HOME/zsh/fzf.zsh"
fi

source "$XDG_STATE_HOME/zsh/fzf.zsh"
