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
#       VERSION:  2.0
#       CREATED:  2020-10-23 18:30 UTC v1.0
#      REVISION:  2020-10-23 18:30 UTC v2.0 ~/bin folder now is outside of software/
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

##### 3. Persistent path for ~/bin (place for binaries) _________________________
# TODO: document better this. In special how it is integrated with the
#       'tails-do-it' binary (fititnt, 2020-10-25 22:57 UTC)

#### 3.1 When using Persistence, but same USB as Tails install ..................
mkdir /home/amnesia/Persistent/bin
# Equivalent to: /live/persistence/TailsData_unlocked/Persistent/bin

#### 3.2 When using Persistence on another USB (with encryption created by Tails)
# Note: this command will fail if you are not using an external USB, Its ok.
mkdir /media/amnesia/TailsData/Persistent/bin

##### 5. Directory structure for complex programs _______________________________
# On an ideal scenario, we should follow FHS
#     https://en.wikipedia.org/wiki/Filesystem_Hierarchy_Standard
#     https://refspecs.linuxfoundation.org/FHS_3.0/fhs/index.html
# But we will skip these structures for now and use Paths that
# are exposed for the user.

#### 5.1 Base path .............................................................
# We will choose 'software'. Apps could be an alternative, but Apps would
# be always the first when listing the /home/amnesia/Persistent/ directory
mkdir /home/amnesia/Persistent/software

#### 5.2 Path for persistent portable, ready to use, software ..................
mkdir /home/amnesia/Persistent/software/portable

#### 5.3 Path for persistent .deb installers ...................................
# @see https://appimage.org/
mkdir /home/amnesia/Persistent/software/appimage

#### 5.4 Path for persistent .deb installers ...................................
mkdir /home/amnesia/Persistent/software/deb

#### 4 [OPTIONAL] Structured directory layout for git projects _________________
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