#!/bin/sh
#===============================================================================
#
#          FILE:  backup-tailsdata-to-usb-stick.sh
#
#         USAGE:  If this script already was added on the path (e.g. ~/bin), run:
#                     backup-tailsdata-to-usb-stick.sh
#
#   DESCRIPTION:  backup-tailsdata-to-usb-stick.sh backup Tails Data with rsync
#                 strategy from the current running tails, e.g. the path
#                     /live/persistence/TailsData_unlocked/
#                 to an external USB stick already opened at the path
#                     /media/amnesia/TailsData/
#                 This script initially based on the official Tails wiki at
#                 https://tails.boum.org/doc/first_steps/persistence/backup/index.en.html
#
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Emerson Rocha <rocha[at]ieee.org>
#       COMPANY:  Etica.AI
#       LICENSE:  Public Domain
#       VERSION:  1.0
#       CREATED:  2020-10-20 22:35 UTC
#      REVISION:  ---
#===============================================================================
echo "TODO: backup-tailsdata-to-usb-stick.sh"
exit 0

#### [ALTERNATIVE] One-liner script ____________________________________________
# The restore-tailsdata-from-usb-stick.sh was based on the documentation at 
# https://tails.boum.org/doc/first_steps/persistence/backup/index.en.html.
# If you really sure, you can execute this line:
#     rsync -PaSHAXv --del /live/persistence/TailsData_unlocked/ /media/amnesia/TailsData