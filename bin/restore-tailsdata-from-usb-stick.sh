#!/bin/sh
#===============================================================================
#
#          FILE:  restore-tailsdata-from-usb-stick.sh
#
#         USAGE:  If this script already was added on the path (e.g. ~/bin), run:
#                     restore-tailsdata-from-usb-stick.sh
#
#   DESCRIPTION:  restore-tailsdata-from-usb-stick.sh Restore (rescue) Tails Data
#                 with rsync strategy from an external USB stick already opened at
#                 the path
#                     /media/amnesia/TailsData/
#                 To the current he current running tails, e.g. the path
#                     /live/persistence/TailsData_unlocked/
#                 This script initially based on the official Tails wiki at
#                 https://tails.boum.org/doc/first_steps/persistence/rescue/index.en.html
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
PROGRAM_START_DATETIME=$(date +%s)
PROGRAM_NAME=$(basename "$0")
set -e


#### [ALTERNATIVE] One-liner script ____________________________________________
# The restore-tailsdata-from-usb-stick.sh was based on the documentation at 
# https://tails.boum.org/doc/first_steps/persistence/rescue/index.en.html.
# If you really sure, you can execute this line:
#     rsync -PaSHAXv --del /media/amnesia/TailsData/ /live/persistence/TailsData_unlocked

##### Safety checks ____________________________________________________________
if [ ! -d "/media/amnesia/TailsData/" ];
then
    echo "ERROR! /media/amnesia/TailsData/ does exist! You must unlock the external USB stick first. Exiting..."
    exit 1
fi

echo "TODO: restore-tailsdata-from-usb-stick.sh"


PROGRAM_END_DATETIME=$(date +%s)
PROGRAM_TIME=$((PROGRAM_END_DATETIME-PROGRAM_START_DATETIME))

echo "Runtime: $PROGRAM_TIME"
exit 0
