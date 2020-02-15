# Custom bash profile for login shells
# This file is managed by Salt

# If running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# Add user binaries
export PATH="$(systemd-path user-binaries):$PATH"
