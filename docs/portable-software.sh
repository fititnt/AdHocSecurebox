#!/bin/sh
#===============================================================================
#
#          FILE:  portable-software.sh
#
#         USAGE:  cat portable-software.sh
#
#   DESCRIPTION:  Optionated strategy of "portable software" on TailsOS.
#                 See https://github.com/fititnt/TailsOS-for-non-whistleblowers/issues/13
#
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Emerson Rocha <rocha[at]ieee.org>
#       COMPANY:  Etica.AI
#       LICENSE:  Public Domain
#       VERSION:  1.0
#       CREATED:  2020-10-23 18:30 UTC
#      REVISION:  ---
#===============================================================================
echo "Usage:"
echo "    cat portable-software.sh"
echo "exiting..."
exit 0


##### 1. Requisites ____________________________________________________________
#### 1.1 Read Tails official documentation about setup persistence .............
xdg-open https://tails.boum.org/doc/first_steps/persistence/index.en.html

#### 1.3 Persistence should be enabled and unlocked ............................
# If these commands don't return error, you're ok to go
ls /home/amnesia/Persistent/
ls /live/persistence/TailsData_unlocked/

##### 2. Recommendations ________________________________________________________
# On this setup, we recommend run as the non-root user. On tails is 'amnesia'
whoami
# amnesia

##### 3. Directory structure ___________________________________________________
# On an ideal scenario, we should follow FHS
#     https://en.wikipedia.org/wiki/Filesystem_Hierarchy_Standard
#     https://refspecs.linuxfoundation.org/FHS_3.0/fhs/index.html
# But we will skip these structures for now and use Paths that
# are exposed for the user.

#### 3.1 Base path .............................................................
# We will choose 'software'. Apps could be an alternative, but Apps would
# be always the first when listing the /home/amnesia/Persistent/ directory
mkdir /home/amnesia/Persistent/software

#### 3.2 Path for persistent portable, ready to use, software ..................
mkdir /home/amnesia/Persistent/software/portable

#### 3.3 Path for persistent .deb installers ...................................
# @see https://appimage.org/
mkdir /home/amnesia/Persistent/software/appimage

#### 3.4 Path for persistent .deb installers ...................................
mkdir /home/amnesia/Persistent/software/deb