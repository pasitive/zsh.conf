#----------------------------------------------------------------------------#
# Completion settings.
#----------------------------------------------------------------------------#

# Initialize compinit.
autoload -U compinit; compinit

# Matches case insensitive for lowercase.
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Pasting with tabs doesn't perform completion.
zstyle ':completion:*' insert-tab pending

# completion.zsh is end here