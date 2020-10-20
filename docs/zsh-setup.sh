#!/bin/sh
#===============================================================================
#
#          FILE:  zsh-setup.sh
#
#         USAGE:  cat zsh-setup.sh
#
#   DESCRIPTION:  Install and define as default the Zsh on TailsOS
#                 See:
#                     - https://www.zsh.org/
#
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Emerson Rocha <rocha[at]ieee.org>
#       COMPANY:  Etica.AI
#       LICENSE:  Public Domain
#       VERSION:  1.0
#       CREATED:  2020-10-19 23:46 UTC
#      REVISION:  ---
#===============================================================================
echo "Usage:"
echo "    cat zsh-setup.sh"
echo "exiting..."
exit 0

#### 1. Install Zsh ____________________________________________________________

### 1.1 Commands to be executed on amnesia terminal as root
sudo apt update
sudo apt install zsh

### 1.2 Pop up interface steps (outside cli terminal, use mouse or equivalent)
## POP UP message:
#    " Add zhd to your additional software?"
#    " To install it automatically from your persistent storage when starting Tails"
#    " [ ] Install Only Once [ X ] Install Every Time"

# What you should do?
#  If you are very sure that you wand zsh (e.g already use outsite Tails and
#  already like it) do it Install every time.
#
#  If you don't already use zsh, choose install it only once. If you like
#  you can re-do it later. Please note that zsh may need extra configutations
#  compared to use the default bash terminal so it may not be good if
#  you're not open to some extra steps later.

### 2 [OPTIONAL] Define zsh as your default shell instead of bash _____________
# Not implemented.

# TODO: check if the zsh was changed to be default shell. While the oh-my-zsh
#       installation I know are likely to persist, the zsh as default terminal
#       may need an extra step. Not sure (fititnt, 2020-10-20 00:46 UTC)
