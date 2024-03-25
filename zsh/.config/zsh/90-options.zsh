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
# unsetopt BEEP

# Enable ls colors
autoload -U colors && colors
export LSCOLORS="Gxfxcxdxbxegedabagacad"

WORDCHARS='*?_-.[]~&;!#$%^(){}<>'

# Copied from OMZ, idk what it does
unsetopt FLOW_CONTROL
