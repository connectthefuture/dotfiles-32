# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
  # include .bashrc if it exists
  if [ -f "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
  fi
fi

# Add RVM and ruby to PATH for scripting
PATH="$PATH:$HOME/.rvm/bin"

PATH="$PATH:$HOME/scripts/bin"
PATH="$PATH:$HOME/.local/bin"

PATH="$PATH:$HOME/.nvm/versions/node/v6.10.3/bin"

export EDITOR=nvim

export PYTHONPATH="$HOME/.local/lib/python2.7/site-packages"
