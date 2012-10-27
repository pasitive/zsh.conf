#---------------------------------------------------------------------------#
# Prompt settings.
#---------------------------------------------------------------------------#

# Show dirty state in the branch.
export GIT_PS1_SHOWDIRTYSTATE=true

# Allow for functions in the prompt.
setopt PROMPT_SUBST

# Promt settings.
PROMPT='%F{yellow}%n@%m%f:%F{cyan}%~%F{magenta}$(__git_ps1 "(%s)")%F{green}$%f '

# promt.zsh is end here
