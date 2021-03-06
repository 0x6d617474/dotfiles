# Return appropriate options for ls
lsopts() {

    # Snarf the output of `ls --help` into a variable
    local lshelp=$(ls --help 2>/dev/null)

    # Start collecting available options
    local -a lsopts

    # If the --color option is available and we have a terminal that supports
    # at least eight colors, add --color=auto to the options
    local colors=$(tput colors)
    if [[ ${lshelp} == *--color* ]] && ((colors >= 8)) ; then
        lsopts=("${lsopts[@]}" --color=auto)
    fi

    # If we support grouping directories first, do it
    if [[ ${lshelp} == *--group-directories-first* ]]; then
        lsopts=("${lsopts[@]}" --group-directories-first)
    fi

    # Print the options as a single string, space-delimited
    printf %s "${lsopts[*]}"
}

# Alias ls with these options
alias ls="ls $(lsopts) -lh"
alias la="ls -A"

# Unset helper function
unset -f lsopts
