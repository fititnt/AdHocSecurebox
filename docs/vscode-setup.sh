#!/bin/sh
#===============================================================================
#
#          FILE:  vscode-setup.sh
#
#         USAGE:  cat vscode-setup.sh
#
#   DESCRIPTION:  TailsOS (tested v4.12) already comes with git cli command. This
#                 doc explain one way to configure a new account. And suggest
#                 extra optionated packages (git-gui, gitk)
#
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Emerson Rocha <rocha[at]ieee.org>
#       COMPANY:  Etica.AI
#       LICENSE:  Public Domain
#       VERSION:  1.1
#       CREATED:  2020-10-17 10:57 UTC
#      REVISION:  2020-10-17 10:57 UTC v1.1 re-started. The vscode-setup.sh v1.0
#                                      was deleted by mistake (around ~30min of
#                                      work lost). TailsOS don't have a trash
#                                      feature and even VSCode warned
#===============================================================================
echo "Usage:"
echo "    cat vscode-setup.sh"
echo "exiting..."
exit 0

# TODO: re-do the work lost from 1.0 later (fititnt, 2020-10-17 11:02 UTC)

# @see https://code.visualstudio.com/docs/editor/portable
wget https://go.microsoft.com/fwlink/?LinkID=620884 -O /tmp/vscode.tar.gz
cd /home/amnesia/Persistent
tar -vzxf /tmp/vscode.tar.gz
cd /home/amnesia/Persistent/VSCode-linux-x64
# Create data/ folder (this, with exeption of temp files on /tmp) will store extensions, configs, etc
mkdir data/

# To update, just move data/ folder for a new, downloaded vscode.

# Needs --no-sandbox, see https://github.com/microsoft/vscode/issues/81056
/home/amnesia/Persistent/VSCode-linux-x64/code --no-sandbox --disable-gpu

# Open directory with vscode (from Pen drive)
/home/amnesia/Persistent/VSCode-linux-x64/code --no-sandbox --disable-gpu /home/amnesia/Persistent/TailsOS-for-non-whistleblowers

# Copy VSCode to ram to improve performance
cp -r /home/amnesia/Persistent/VSCode-linux-x64/ /home/amnesia/Desktop
/home/amnesia/Desktop/VSCode-linux-x64/code --no-sandbox /home/amnesia/Persistent/TailsOS-for-non-whistleblowers

# TODO: fix issue `Error: net::ERR_CONNECTION_REFUSED` on VSCode when trying to check for extensions (fititnt, 2020-10-16 18:17 BRT)