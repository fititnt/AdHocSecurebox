# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
umask 077

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

#### Custom additions from original ~/.profile, START __________________________

#### /home/amnesia/Persistent/software/bin .....................................
# @see docs/portable-software.sh
# If this path exists, executable binaries here will have priority over
# /home/amnesia/bin.
if [ -d "/home/amnesia/Persistent/software/bin" ] ; then
    PATH="/home/amnesia/Persistent/software/bin:$PATH"
fi

#### /home/amnesia/Persistent/bin ..............................................
# @see docs/portable-software.sh
# If this path exists, executable binaries here will have priority over
# /home/amnesia/Persistent/software/bin and /home/amnesia/bin.
if [ -d "/home/amnesia/Persistent/bin" ] ; then
    PATH="/home/amnesia/Persistent/bin:$PATH"
fi

#### Startup scripts ...........................................................
# TODO: this feature was not fully tested yet. (fititnt, 2020-10-24 18:42 UTC)
#
# Note: this code exists both on the my-git-repo/bin/startup-scripts.sh and
#       my-git-repo/dotfiles/example/rocha/.bash_profile

# If ~/bin/startup-scripts/ (or ~/bin/startup-scripts-examples/) exists, we
# execute every .sh file there
if [ -d "$HOME/bin/startup-scripts" ];
then
    run-parts --regex '.*sh$' "$HOME/bin/startup-scripts/"
elif [ -d "$HOME/bin/startup-scripts-examples" ];
then
    run-parts --regex '.*sh$' "$HOME/bin/startup-scripts-examples/"
fi

#### Custom additions from original ~/.profile, END ____________________________