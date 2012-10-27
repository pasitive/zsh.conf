#----------------------------------------------------------------------------#
# Aliases settings.
#----------------------------------------------------------------------------#

local platform=`uname`
if [[ "$platform" == "Linux" ]]; then
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
else if [[ "$platform" == "Darwin" ]]
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'

    if (command_exists 'gls'); then
        # gls provides by coreutils from macports.
        alias ls='gls --color=auto'
    else
        # gls doesn't exists, use BSD version.
        alias ls='ls -G'
    fi

    if (command_exists 'gdir'); then
        # gls provides by coreutils from macports.
        alias dir='gdir --color=auto'
    fi
fi

# lists
alias l='ls -CF'
alias la='ls -AL'
alias ll='ls -lF'
alias lla='ls -lsa'

# Move-rename w/o correction and always in interactive mode.
alias mv='nocorrect mv -i'
# Recursize copy w/o correction and always in interactive mode.
alias cp='nocorrect cp -iR'
# Remove w/o correction and always in interactive mode.
alias rm='nocorrect rm -i'
# Create directory w/o correction.
alias mkdir='nocorrect mkdir'

# alias.zsh is end here
