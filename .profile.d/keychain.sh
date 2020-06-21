# Keychain setup
if command -v keychain &>/dev/null; then
    eval "$(TERM=${TERM:-ansi} keychain \
        --eval --ignore-missing --quiet \
        --inherit local --noask --agents gpg)"

    # Set and export TTY/GPG_TTY for interactive shells
    if [ -t 0 ] ; then
        export GPG_TTY=$(tty)
    fi
fi

# Configure the gpg-agent started by keychain
if command -v gpg-connect-agent &> /dev/null; then
  gpg-connect-agent updatestartuptty /bye > /dev/null
fi

# Use gpg-agent for SSH
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
