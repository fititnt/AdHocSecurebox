#!/bin/sh
#===============================================================================
#
#          FILE:  git-setup.sh
#
#         USAGE:  cat git-setup.sh
#
#   DESCRIPTION:  TailsOS (tested v4.12) already comes with git cli command. This
#                 doc explain one way to configure a new account. And suggest
#                 extra optionated packages (git-gui, gitk)
#
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Emerson Rocha <rocha[at]ieee.org>
#       COMPANY:  Etica.AI
#       LICENSE:  Public Domain
#       VERSION:  1.0
#       CREATED:  2020-10-17 09:08 UTC
#      REVISION:  ---
#===============================================================================
echo "Usage:"
echo "    cat git-setup.sh"
echo "exiting..."
exit 0

#### 1. Configure global user and password _____________________________________
# @see https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup
git config --global user.name "John Doe"
git config --global user.email johndoe@example.com

#### 2. Persist changes ________________________________________________________
# Note: this assumes you already have enabled Persistence and the features
#       'dotfiles' is enabled.
cp /home/amnesia/.gitconfig /live/persistence/TailsData_unlocked/dotfiles/

# On next boot, when you unlock your TailsData partition it any new
# customization will already be on the file
#     /live/persistence/TailsData_unlocked/dotfiles/.gitconfig


#### 3 [OPTIONAL] Structured directory layout for git projects _________________
# If you're a frequent git/github/gitlab user, some more organized directory
# structure may makes sense. This one will be somewhat optionated
mkdir /home/amnesia/Persistent/git

# Since is possible to have multiple projects with same name (either individual
# or from organization) one hint is create a base directory for each username.
# On this example, we will use the initial version of this script that
# was hosted on https://github.com/fititnt/TailsOS-for-non-whistleblowers/

# Username on this case was "fititnt". If you have your fork, use your username
mkdir /home/amnesia/Persistent/git/fititnt

# Change to the user/organization directory before clone
cd /home/amnesia/Persistent/git/fititnt

# As rule, use https if is someone else repository.
git clone https://github.com/fititnt/TailsOS-for-non-whistleblowers.git
# git clone git@github.com:fititnt/TailsOS-for-non-whistleblowers.git

# On this demo, this would be your final result
cd /home/amnesia/Persistent/git/fititnt/TailsOS-for-non-whistleblowers

#### [OPTIONAL] Additional software ____________________________________________
# TailsOS (tested v4.12) comes with git cli by default, but not some extra
# packages that Rocha likes. It's up to you if you want them.
sudo apt update
sudo apt install gitk git-gui

# Note: after you install these extra packages, the OS will prompt you to decide
#       if you want to install then every time. If you are unsure, say 'no'. But
#       if you keep doing this like 2-3 times on different days, than may be a
#       good idea say yes.