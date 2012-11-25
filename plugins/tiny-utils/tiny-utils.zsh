#----------------------------------------------------------------------------#
# Tiny utils collection
#----------------------------------------------------------------------------#

function __ld_lib_add()
{
    if [[ -z $LD_LIB_ISSET || $LD_LIB_ISSET = 0 ]]; then
        export LD_LIB_ISSET=1
        export LD_LIB_STASH=$LD_LIBRARY_PATH
    fi

    for lib_path in $@; do
    done

    for lib_path in $@; do
        if [[ ! -e "$lib_path" ]]; then
            echo "$lib_path: skip, does not exist"
            continue
        fi

        if [[ ! -d "$lib_path" ]]; then
            echo "$lib_path: skip, is not a directory"
            continue
        fi

        local full_lib_path=$(realpath $lib_path)

        if echo $LD_LIBRARY_PATH | grep "$full_lib_path:" > /dev/null 2>&1; then
                echo "$lib_path: is already present"
                continue
        else
                echo "$lib_path: added"
        fi

        export LD_LIBRARY_PATH=$full_lib_path:$LD_LIBRARY_PATH
    done

    echo "LD_LIBRARY_PATH=$LD_LIBRARY_PATH"
    return $EXIT_SUCCESS
}

function __ld_lib_clean()
{
    export LD_LIBRARY_PATH=$LD_LIB_STASH
    unset LD_LIB_ISSET
    unset LD_LIB_STASH

    echo "LD_LIBRARY_PATH=$LD_LIBRARY_PATH"
    return $EXIT_SUCCESS
}

function __ld_lib_comp_reply()
{
    COMPREPLY=()
    local cmd="${COMP_WORDS[1]}"
    local cur="${COMP_WORDS[COMP_CWORD]}"
    local cmd_list="add clean"

    case "${cmd}" in
        add)
	    COMPREPLY=($(compgen -d ${curr}))
            return $EXIT_SUCCESS
            ;;
        clean)
            return $EXIT_SUCCESS
            ;;
        *)
            ;;
    esac


    COMPREPLY=($(compgen -W "${cmd_list}" -- ${curr}))
    return $EXIT_SUCCESS
}

function ld_lib()
{
    local cmd=$1
    case $cmd in
        add)
            __ld_lib_add ${@:2}
            ;;
        clean)
            __ld_lib_clean
            ;;
        *)
            echo "error: invalid command" >&2lib 
            return $EXIT_FAILURE
            ;;
    esac

    return $?
}

complete -F __ld_lib_comp_reply ld_lib