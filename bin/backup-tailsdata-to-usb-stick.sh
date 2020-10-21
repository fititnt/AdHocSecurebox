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
PROGRAM_START_DATETIME=$(date +%s)
PROGRAM_NAME=$(basename "$0")
set -e

#### [ALTERNATIVE] One-liner script ____________________________________________
# The restore-tailsdata-from-usb-stick.sh was based on the documentation at 
# https://tails.boum.org/doc/first_steps/persistence/backup/index.en.html.
# If you really sure, you can execute this line:
#     rsync -PaSHAXv --del /live/persistence/TailsData_unlocked/ /media/amnesia/TailsData

##### Safety checks ____________________________________________________________

### /media/amnesia/TailsData/ is availible? ....................................
if [ ! -d "/media/amnesia/TailsData/" ];
then
    echo "ERROR! /media/amnesia/TailsData/ does exist! You must unlock the external USB stick first. Exiting..."
    exit 1
fi

### /media/amnesia/TailsData/.tailsdata-is-source not exists? ...................
if [ -f "/media/amnesia/TailsData/.tailsdata-is-source" ];
then
    echo "WARNING! /media/amnesia/TailsData/.tailsdata-is-source exist!"
    echo "This USB stick is marked as potential source of TailsData by an previous run"
    echo "This script will refuse to run until manual action."
    echo "In case this is an false positive, you can run"
    echo "    rm /media/amnesia/TailsData/.tailsdata-is-source"
    echo "Exiting..."
    exit 2
fi

echo "TODO: backup-tailsdata-to-usb-stick.sh"

PROGRAM_END_DATETIME=$(date +%s)
PROGRAM_TIME=$((PROGRAM_END_DATETIME-PROGRAM_START_DATETIME))

echo "Runtime: $PROGRAM_TIME"
exit 0
