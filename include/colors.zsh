#----------------------------------------------------------------------------#
# Colors settings.
#----------------------------------------------------------------------------#

# Initialize colors.
autoload -U colors; colors

local dircolors_bin=""
for itr in 'dircolors' 'gdircolors'
do
    if (command_exists $itr); then
        dircolors_bin=$itr
        break
    fi
done

if [[ "$dircolors_bin" != "" ]]; then
    eval $($dircolors_bin $ZSH_HOME/resources/dir_colors)
fi

# colors.zsh is end here
