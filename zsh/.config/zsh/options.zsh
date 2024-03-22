#-------------------------------------------------------------------------------
# Directory stack
#-------------------------------------------------------------------------------

# Make cd push the old directory onto the directory stack
setopt AUTO_PUSHD

# Don't push multiple copies of the same directory onto the directory stack
setopt PUSHD_IGNORE_DUPS

# Make cd -{n} go back in directory stack
setopt PUSHDMINUS


#-------------------------------------------------------------------------------
# Filesystem navigation
#-------------------------------------------------------------------------------

# Print working directory after some operations
# (like cd to stack entry or CDPATH)
unsetopt CD_SILENT


#-------------------------------------------------------------------------------
# History
#-------------------------------------------------------------------------------

# Add timestamps to history
setopt EXTENDED_HISTORY

# If history needs to be cleared, delete duplicate entries first
setopt HIST_EXPIRE_DUPS_FIRST

# Don't show duplicates when searching history
setopt HIST_FIND_NO_DUPS

# Don't write commands starting with space to history
setopt HIST_IGNORE_SPACE

# Treat commands in history as regular commands, so quoted strings remain quoted
# when referencing them
setopt HIST_LEX_WORDS

# Don't store history command to history
setopt HIST_NO_STORE

# When executed command references command from history, don't run it
# and instead set as current command, so it can be reviewed before running
setopt HIST_VERIFY

# Share history between concurrent sessions
setopt SHARE_HISTORY


HISTFILE="$HOME/.zsh_history"
# Maximum amount of events to save in history file
SAVEHIST=10000 
# Maximum amount of events stored in internal history list while zsh is running
HISTSIZE=50000


#-------------------------------------------------------------------------------
# Input
#-------------------------------------------------------------------------------

# Allow comments in interactive sessions
setopt INTERACTIVE_COMMENTS


#-------------------------------------------------------------------------------
# Job control
#-------------------------------------------------------------------------------

# Warn before exiting if background jobs are running
setopt CHECK_JOBS
setopt CHECK_RUNNING_JOBS

# Print job notifications in long format (includes PID)
setopt LONG_LIST_JOBS

# Report job completion immediately
setopt NOTIFY


#-------------------------------------------------------------------------------
# Prompt
#-------------------------------------------------------------------------------

# Print \n when newline was added to command output automatically
PROMPT_EOL_MARK='%B%S\n%b%s'

# Enable substitution and expansion in prompt
setopt PROMPT_SUBST


#-------------------------------------------------------------------------------
# Other
#-------------------------------------------------------------------------------

# Allow redirection to multiple files
setopt MULTIOS

# Don't beep on errors
unsetopt BEEP

# Enable ls colors
autoload -U colors && colors
export LSCOLORS="Gxfxcxdxbxegedabagacad"

WORDCHARS='*?_-.[]~&;!#$%^(){}<>'
