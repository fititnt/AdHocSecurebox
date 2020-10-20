#!/bin/sh
#===============================================================================
#
#          FILE:  bash-setup.sh
#
#         USAGE:  cat bash-setup.sh
#
#   DESCRIPTION:  Bash setup on TailsOS. Since bash already is installed and
#                 is the default shell, most of what this script do is explain
#                 what to do to make changes persistent on TailsOS reboot
#
#       OPTIONS:  ---
#  REQUIREMENTS:  1. Tails Persistent enabled, with feature 'dotfiles'; see
#                    https://tails.boum.org/doc/first_steps/persistence/configure/index.en.html#index12h2
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Emerson Rocha <rocha[at]ieee.org>
#       COMPANY:  Etica.AI
#       LICENSE:  Public Domain
#       VERSION:  1.0
#       CREATED:  2020-10-20 01:33 UTC
#      REVISION:  ---
#===============================================================================
echo "Usage:"
echo "    cat bash-setup.sh"
echo "exiting..."
exit 0

#### 1. Install bash ___________________________________________________________
# No actions need. Bash already is installed and default shell on TailsOS


#### 2. Move bash configurations files to Permanent storage ____________________
# Note: this assumes you already have enabled Persistence and the features
#       'dotfiles' is enabled.

# PROTIP: while this scripts show all files that COULD be copied to your dotfiles
#         related to bash, you actually could do only the ones you actually
#         changed. On your next reboot these files will be symliked from
#             /live/persistence/TailsData_unlocked/dotfiles/
#         to
#             cp /home/amnesia/

## /home/amnesia/.profile 
# This file exist on TailsOS default installation
cp /home/amnesia/.profile /live/persistence/TailsData_unlocked/dotfiles/

## /home/amnesia/.bashrc 
# This file exist on TailsOS default installation
cp /home/amnesia/.bashrc /live/persistence/TailsData_unlocked/dotfiles/


## /home/amnesia/.bash_logout
# This file exist on TailsOS default installation
cp /home/amnesia/.bash_logout /live/persistence/TailsData_unlocked/dotfiles/

## /home/amnesia/.bash_profile
# NOT DEFAULT. Here just as example cp command. If this file exist, will be
# used instead of /home/amnesia/.profile
cp /home/amnesia/.bash_profile /live/persistence/TailsData_unlocked/dotfiles/

## .cp /home/amnesia/.bash_login 
# NOT DEFAULT. Here just as example cp command. If this file exist, will be
# used instead of /home/amnesia/.profile
cp /home/amnesia/.bash_login /live/persistence/TailsData_unlocked/dotfiles/

#### EXTRA: manual symlinks ___________________________________________________
# Tails will already create these symlinks on reboot, even from folders. This is
# one example of how to do it manually with ~/bin folder
# ln -s /live/persistence/TailsData_unlocked/dotfiles/bin/ ~/bin
