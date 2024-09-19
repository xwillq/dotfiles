#-------------------------------------------------------------------------------
# How to write the history
#-------------------------------------------------------------------------------

# Add timestamp and command duration to the history.
setopt EXTENDED_HISTORY

# When option CLOBBER is unset, regular redirections cannot overwrite files,
# `>|` must be used.
# This option changes all regular redirections in the history to `>|`. 
# It is turned off so original commands will be saved to the history.
setopt NO_HIST_ALLOW_CLOBBER

# Delete the oldest duplicated command in the internal history when it's full.
setopt HIST_EXPIRE_DUPS_FIRST

# If current command is a duplicate of some older command in the history,
# this option causes the duplicate to be deleted, event if the history 
# is not full.
setopt NO_HIST_IGNORE_ALL_DUPS

# If current command is a duplicate of some older command in the history,
# this option prevents it from being stored in the history.
setopt NO_HIST_IGNORE_DUPS

# Don't write commands starting with space to history.
setopt HIST_IGNORE_SPACE

# Write functions to the history.
setopt NO_HIST_NO_FUNCTIONS

# Don't store history command to the history.
setopt HIST_NO_STORE

# Append history to the file instead of overwriting it.
setopt APPEND_HISTORY

# This option prevents duplicated commands from being saved to the history file. 
# It is turned off so every command will be saved to the history.
setopt NO_HIST_SAVE_NO_DUPS

# Where to store the history file.
HISTFILE="$XDG_STATE_HOME/zsh/history"
# Maximum amount of events to save in the history file.
SAVEHIST=1000000 
# Maximum amount of events stored in internal history list while zsh is running.
HISTSIZE=50000


#-------------------------------------------------------------------------------
# How to use the history
#-------------------------------------------------------------------------------

# Don't display duplicates when searching the history.
setopt HIST_FIND_NO_DUPS

# Parse commands in the history as regular shell commands. 
# This option preserves quoting and escaping when reading commands from 
# the history.
setopt HIST_LEX_WORDS

# When executed command references command from the history, don't run it
# and instead set it as current command, so it can be reviewed before running.
setopt HIST_VERIFY

# This option causes shell to append command to the history file as soon as it
# is executed, rather then after shell exits. This allows reusing commands in
# new shells without closing current one.
# This option conflicts with INC_APPEND_HISTORY_TIME and SHARE_HISTORY.
setopt NO_INC_APPEND_HISTORY

# This option is the same as INC_APPEND_HISTORY, except commands are written
# to the history after they have finished, which makes it possible to write
# command duration to history.
# This option conflicts with INC_APPEND_HISTORY and SHARE_HISTORY.
setopt INC_APPEND_HISTORY_TIME

# This option causes shell to append command to the history file as soon as it
# is executed and to read new commands from the history file, which essentially
# syncs history across all shells.
# It is turned off because it messes up intuition about how many times <UP>
# should be pressed to retrieve desired command from current shell's history.
# This option conflicts with INC_APPEND_HISTORY and INC_APPEND_HISTORY_TIME.
setopt NO_SHARE_HISTORY
