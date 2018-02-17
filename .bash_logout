# Abort if there's no version information (<2.0)
if ! test "$BASH_VERSINFO" ; then
    return
fi

# Clear console if possible when logging out
if ((SHLVL == 1)) ; then
    clear_console -q 2>/dev/null
fi
