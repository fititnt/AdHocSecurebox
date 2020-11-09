#!/bin/sh
#===============================================================================
#
#          FILE:  portable-data.sh
#
#         USAGE:  cat portable-data.sh
#
#   DESCRIPTION:  This is an draft. Ignore it
#
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Emerson Rocha <rocha[at]ieee.org>
#       COMPANY:  Etica.AI
#       LICENSE:  Public Domain
#       VERSION:  0.2 (draft)
#       CREATED:  2020-10-25 23:28 UTC v0.1 (draft)
#                 2020-11-08 23:14 UTC v0.2 Added draft of example directories
#                                      as empty folders on the git repository at
#                                      directory-structure/
#===============================================================================
echo "Usage:"
echo "    cat portable-software.sh"
echo "    cat portable-data.sh"
echo "exiting..."
exit 0

## TODO: move the description of "portable data" to (maybe) simply create example
#        directories on AdHocSecurebox/directory-structure with descritive
#        comments (2020-11-08 23:14)

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

##### 3. /home/amnesia/Persistent/data/ __________________________________________
# Equivalent: /live/persistence/TailsData_unlocked/
# Note: this folder is expected to be availible by non-root user

# We will use Persistent/data/, but you could choose Persistent/my-super-secret-things/.
# The point here is have something to at least be able to work by default
mkdir /home/amnesia/Persistent/data


##### 3. /live/persistence/TailsData_unlocked/backups __________________________
# Note: this folder is expected to be availible by root user
sudo mkdir /live/persistence/TailsData_unlocked/backups
sudo chmod 0600 -R /live/persistence/TailsData_unlocked/backups

# NOTE: this is an draft.