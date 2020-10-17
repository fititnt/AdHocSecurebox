#!/bin/sh
#===============================================================================
#
#          FILE:  wallpaper.sh
#
#         USAGE:  You can either run this script:
#                     ./wallpaper.sh
#                 Or copy and paste the specific line on your custom script
#
#   DESCRIPTION:  Sets desktop wallpaper.
#                 Based on Patrick Blom work, see https://github.com/patrick-blom/dive-into-tails
#
#       OPTIONS:  ---
#  REQUIREMENTS:  1. Your wallaper is saved at /home/amnesia/Pictures/wallpaper.jpg
#                    (if not, just customize this script)
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Emerson Rocha <rocha[at]ieee.org>, based on Patrick Blook work
#       COMPANY:  Etica.AI
#       LICENSE:  Public Domain
#       VERSION:  1.0
#       CREATED:  2020-10-17 17:45 UTC
#      REVISION:  ---
#===============================================================================

# /home/amnesia/Pictures/wallpaper.jpg have your wallpaper file
gsettings set org.gnome.desktop.background picture-uri file:///home/amnesia/Pictures/wallpaper.jpg