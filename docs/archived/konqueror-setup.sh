#!/bin/sh
#===============================================================================
#
#          FILE:  konqueror-setup.sh
#
#         USAGE:  cat konqueror-setup.sh
#
#   DESCRIPTION:  Konqueror setup on TailsOS.
#                 See also:
#                     - https://apps.kde.org/en/konqueror
#
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  1. Not practical on Tails. Something simpler may be better. See
#                    https://github.com/fititnt/TailsOS-for-non-whistleblowers/issues/15#issuecomment-715642094
#         NOTES:  ---
#        AUTHOR:  Emerson Rocha <rocha[at]ieee.org>
#       COMPANY:  Etica.AI
#       LICENSE:  Public Domain
#       VERSION:  1.0
#       CREATED:  2020-10-23 23:50 UTC
#===============================================================================
echo "Usage:"
echo "    cat konqueror-setup.sh"
echo "exiting..."
exit 0

#******************************************************************************#
#                                ONE TIME SETUP                                #
# Recommended if is just testing the vscode or persistence is locked           #
# REQUIRES:                                                                    #
#  1. administrator password enabled at Tails startup screen                   #
#  2. Internet connection                                                      #
# NON-REQUERIMENT:                                                             #
#  1. Tails Persistence do not need be configured or unlocked                  #
#******************************************************************************#

##### A.1. Install konqueror packages __________________________________________
sudo apt install konqueror
# (...)
#  Need to get 76.8 MB of archives.
#  After this operation, 318 MB of additional disk space will be used.

# Ok. Konqueror seems really great, with support for a lot of things, but is
# waaaay to big for just an FTP client. Since the idea behind the issue
# "MVP of any FTP/SSH/etc client with GUI on TailsOS #15"
# (https://github.com/fititnt/TailsOS-for-non-whistleblowers/issues/15) was
# something that re-use the sshclient, but also not be an default files
# navigator, we could not reuse it.