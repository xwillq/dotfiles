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
zstyle ':zim:termtitle:preexec' format '$(termtitle_preexec "$@")'

# Preexec function taken from ohmyzsh/lib/termsupport.zsh
# TODO: move somewhere
function termtitle_preexec() {
    emulate -L zsh
    setopt extended_glob

    # split command into array of arguments
    local -a cmdargs
    cmdargs=("${(z)2}")
    # if running fg, extract the command from the job description
    if [[ "${cmdargs[1]}" = fg ]]; then
        # get the job id from the first argument passed to the fg command
        local job_id jobspec="${cmdargs[2]#%}"
        # logic based on jobs arguments:
        # http://zsh.sourceforge.net/Doc/Release/Jobs-_0026-Signals.html#Jobs
        # https://www.zsh.org/mla/users/2007/msg00704.html
        case "$jobspec" in
            <->) # %number argument:
                # use the same <number> passed as an argument
                job_id=${jobspec} ;;
            ""|%|+) # empty, %% or %+ argument:
                # use the current job, which appears with a + in $jobstates:
                # suspended:+:5071=suspended (tty output)
                job_id=${(k)jobstates[(r)*:+:*]} ;;
            -) # %- argument:
                # use the previous job, which appears with a - in $jobstates:
                # suspended:-:6493=suspended (signal)
                job_id=${(k)jobstates[(r)*:-:*]} ;;
            [?]*) # %?string argument:
                # use $jobtexts to match for a job whose command *contains* <string>
                job_id=${(k)jobtexts[(r)*${(Q)jobspec}*]} ;;
            *) # %string argument:
                # use $jobtexts to match for a job whose command *starts with* <string>
                job_id=${(k)jobtexts[(r)${(Q)jobspec}*]} ;;
        esac

        # override preexec function arguments with job command
        if [[ -n "${jobtexts[$job_id]}" ]]; then
            1="${jobtexts[$job_id]}"
            2="${jobtexts[$job_id]}"
        fi
    fi

    # cmd name only, or if this is sudo or ssh, the next cmd
    local CMD="${1[(wr)^(*=*|sudo|ssh|-*)]:gs/%/%%}"
    local LINE="${2:gs/%/%%}"

    echo "$CMD – %~"
}


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
