#----------------------------------------------------------------------------#
# Completion settings.
#----------------------------------------------------------------------------#

# Autoload complete
autoload -U compinit compdef
compinit

# Pasting with tabs doesn't perform completion.
zstyle ':completion:*' insert-tab pending

# completion.zsh is end here
