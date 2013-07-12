#============================================================================#
# zsh confuguration
# Created by Konstantin Shulgin <konstantin.shulgin@gmail.com>
#============================================================================#

#----------------------------------------------------------------------------#
# zsh autoloads.
#----------------------------------------------------------------------------#

# Autoload complete
autoload -U compinit compdef
compinit


#----------------------------------------------------------------------------#
# zsh configuration constans.
#----------------------------------------------------------------------------#

# zsh home directory
export ZSH_HOME=$HOME/.zsh

export EXIT_SUCCESS=0
export EXIT_FAILURE=1


#----------------------------------------------------------------------------#
# Utily functions.
#----------------------------------------------------------------------------#

# Check, application exists via 'witch' utility.
function command_exists()
{
    local bin=$1

    if which $bin > /dev/null 2>&1; then
	return $EXIT_SUCCESS
    fi

    return $EXIT_FAILURE
}

# Load plugin from directory.
function zsh_load_plugin()
{
    local plugin_dir=$1

    if [ ! -d $plugin_dir ]; then
        return $EXIT_FAILURE
    fi

    for ext in 'zsh' 'bash' 'sh'; do
        local plugin_source=$plugin_dir/$(basename $plugin_dir).$ext
        if [ -e $plugin_source ]; then
            source $plugin_source
            return $EXIT_SUCCESS
        fi
    done

    echo "error: $plugin_dir's soruce not found" >&2
    return $EXIT_FAILURE
}

# Load all plugins from directory.
function zsh_load_plugin_dir()
{
    local plugins_dir=$1
    if [ ! -d $plugins_dir ]; then
        echo "error: '$plugins_dir' isn't directory" >&2
        return $EXIT_FAILURE
    fi

    if [ ! "$(ls -A $plugins_dir)" ]; then
        echo "error: '$plugins_dir' is empty" >&2
        return $EXIT_FAILURE
    fi

    for plugin in $plugins_dir/*; do
        zsh_load_plugin $plugin
    done
}


#----------------------------------------------------------------------------#
# Load plugins and settings
#----------------------------------------------------------------------------#

# Load all plugins.
zsh_load_plugin_dir $ZSH_HOME/plugins


#----------------------------------------------------------------------------#
# Include
#----------------------------------------------------------------------------#

# Load user environment settings.
source $ZSH_HOME/include/env.zsh

# Load completion settings.
source $ZSH_HOME/include/completion.zsh

# Load promt settings.
source $ZSH_HOME/include/promt.zsh

# Load aliases settings.
source $ZSH_HOME/include/alias.zsh

# Load colors settings.
source $ZSH_HOME/include/colors.zsh

# Load history settings.
source $ZSH_HOME/include/history.zsh

# zsh.zshrc is end here
