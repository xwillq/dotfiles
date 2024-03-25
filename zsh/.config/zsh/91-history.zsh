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


HISTFILE="$XDG_STATE_HOME/zsh/history"
# Maximum amount of events to save in history file
SAVEHIST=100000 
# Maximum amount of events stored in internal history list while zsh is running
HISTSIZE=50000
