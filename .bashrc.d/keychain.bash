# If we're in an interactive terminal, update GPG_TTY
if [[ -t 0 ]] ; then
    GPG_TTY=$(tty)
    export GPG_TTY
fi
