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

#### Configure global user and password _______________________________________
# @see https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup
git config --global user.name "John Doe"
git config --global user.email johndoe@example.com


#### [OPTIONAL] Additional software ____________________________________________
# TailsOS (tested v4.12) comes with git cli by default, but not some extra
# packages that Rocha likes. It's up to you if you want them.
sudo apt install gitk git-gui

# Note: after you install these extra packages, the OS will prompt you to decide
#       if you want to install then every time. If you are unsure, say 'no'. But
#       if you keep doing this like 2-3 times on different days, than may be a
#       good idea say yes.