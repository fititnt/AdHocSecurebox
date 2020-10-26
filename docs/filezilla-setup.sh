#!/bin/sh
#===============================================================================
#
#          FILE:  filezilla-setup.sh
#
#         USAGE:  cat filezilla-setup.sh
#
#   DESCRIPTION:  filezilla setup on TailsOS.
#                 See also:
#                     - https://filezilla-project.org
#
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Emerson Rocha <rocha[at]ieee.org>
#       COMPANY:  Etica.AI
#       LICENSE:  Public Domain
#       VERSION:  1.0
#       CREATED:  2020-10-24 00:46 UTC
#===============================================================================
echo "Usage:"
echo "    cat filezilla-setup.sh"
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

##### A.1. Install filezilla packages __________________________________________

#### A.1.1 sudo apt install filezilla ..........................................
sudo apt install filezilla
# (...)
#    Need to get 4,217 kB of archives.
#    After this operation, 18.2 MB of additional disk space will be used

# 'sudo apt install packages' will show something like this on your terminal:
#     $ [INFO] New packages manually installed: {'filezilla'}

#### A.1.2 POP UP: Add filezila to your additional software? ...................
# After 'sudo apt install packages' you will be asked if want to install every
# time if you have Persistence enabled. This will require mouse click
#   Mark as 1 'Install Only Once'

##### A.2. Run filezilla _______________________________________________________
#### A.2.1 Applications > Internet > filezilla .................................
# Mouse click on the top left, menu Applications
#     Applications > Internet > filezilla

#### A.2.2 SuperKey (Windows key) + "filezilla" ................................
# Press 
#  1. SuperKey (Windows key logo)
#  2. write filezilla (it will filter to likely just one application)
#  3. Press Enter

##### A.3 Persist gFTP configurations __________________________________________

# TODO: document how to persist this app dotfiles (or other type of internal
#       configuration database) to be reused if is not installed on Persistence
#       or, even if is installed on Persistence, the end user know what needs
#       more attetion to backup/restore to not need to re-enter everyting all
#       the time (fititnt, 2020-10-24 00:54 UTC)

#******************************************************************************#
#                             PERSISTENT USAGE                                 #
# Alternative to persist installer of cryptomator. Uses previous steps         #
# REQUIRES:                                                                    #
#  1. Tails Persistence configured and unlocked                                #
#  2. Tails administrator password defined at startup screen                   #
# NON-REQUERIMENT:                                                             #
#  2. Tails administrator password likely to not required (TODO: check it)     #
#******************************************************************************#

##### B.1. Install filezilla packages __________________________________________

#### B.1.1 sudo apt install filezilla ..........................................
sudo apt install filezilla
# (...)
#   Need to get 860 kB of archives.
#   After this operation, 3,863 kB of additional disk space will be used.
#   Do you want to continue? [Y/n] 

# 'sudo apt install packages' will show something like this on your terminal:
#     $ [INFO] New packages manually installed: {'filezilla'}

#### B.1.2 POP UP: Add filezila to your additional software? ...................
# After 'sudo apt install packages' you will be asked if want to install every
# time if you have Persistence enabled. This will require mouse click
#   Mark as 2 'Install Every Time'

#    $ [INFO] Adding to additional packages list: {'filezilla'}

# After click the pop up, you will need to press enter on the terminal too.

##### B.2. Run filezilla _______________________________________________________
#### B.2.1 Applications > Internet > filezilla .................................
# Mouse click on the top left, menu Applications
#     Applications > Internet > filezilla

#### B.2.2 SuperKey (Windows key) + "filezilla" ................................
# Press 
#  1. SuperKey (Windows key logo)
#  2. write filezilla (it will filter to likely just one application)
#  3. Press Enter

##### B.3 Persist filezilla configurations _____________________________________

# TODO: document how to persist this app dotfiles (or other type of internal
#       configuration database) to be reused if is not installed on Persistence
#       or, even if is installed on Persistence, the end user know what needs
#       more attetion to backup/restore to not need to re-enter everyting all
#       the time (fititnt, 2020-10-24 00:54 UTC)