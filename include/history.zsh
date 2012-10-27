#----------------------------------------------------------------------------#
# History settings.
#----------------------------------------------------------------------------#

# History file.
HISTFILE=$ZSH_HOME/zsh_history

# Commands count histroy in history file
SAVEHIST=5000

# Commands count histroy in one seance
HISTSIZE=5000

# Append history list to the history file (important for multiple parallel zsh sessions!)
setopt  APPEND_HISTORY

setopt  HIST_IGNORE_ALL_DUPS

setopt  HIST_IGNORE_SPACE

setopt  HIST_REDUCE_BLANKS

# history.zsh is end here
