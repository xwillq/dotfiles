#-------------------------------------------------------------------------------
# Add completion scripts to FPATH
#-------------------------------------------------------------------------------
# Completion scripts from these paths are meant to override any other scripts,
# as such their path is defined at the last moment.

if [[ -d "$XDG_DATA_HOME/zsh/completions" ]]; then
    FPATH="$XDG_DATA_HOME/zsh/completions:$FPATH"
fi


#-------------------------------------------------------------------------------
# Load compinit
#-------------------------------------------------------------------------------

() {
    builtin emulate -L zsh -o EXTENDED_GLOB

    local zdumpfile="$XDG_CACHE_HOME/zsh/zcompdump"

    # Check if dumpfile is up-to-date by comparing the full path and
    # last modification time of all the completion functions in fpath.
    local zstats zold_dat
    local -i zdump_dat=1
    LC_ALL=C local -r zcomps=(${^fpath}/^([^_]*|*~|*.zwc)(N))
    if (( ${#zcomps} )); then
        zmodload -F zsh/stat b:zstat
        zstat -A zstats +mtime ${zcomps}
    fi
    local -r znew_dat=${ZSH_VERSION}$'\0'${(pj:\0:)zcomps}$'\0'${(pj:\0:)zstats}
    if [[ -e ${zdumpfile}.dat ]]; then
        zmodload -F zsh/system b:sysread
        sysread -s ${#znew_dat} zold_dat <${zdumpfile}.dat
        if [[ ${zold_dat} == ${znew_dat} ]]; then
            zdump_dat=0
        fi
    fi
    if (( zdump_dat )); then
        command rm -f ${zdumpfile}(|.dat|.zwc(|.old))(N)
    fi

    # Load and initialize the completion system
    autoload -Uz compinit && compinit -C -d ${zdumpfile}

    if [[ ! ${zdumpfile}.dat -nt ${zdumpfile} ]]; then
        >! ${zdumpfile}.dat <<<${znew_dat}
    fi
    # Compile the completion dumpfile; significant speedup
    if [[ ! ${zdumpfile}.zwc -nt ${zdumpfile} ]]; then
        zcompile ${zdumpfile}
    fi
}
