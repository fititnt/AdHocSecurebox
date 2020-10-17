#!/bin/sh
#===============================================================================
#
#          FILE:  vscode-deb-setup.sh
#
#         USAGE:  cat vscode-deb-setup.sh
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
#       VERSION:  1.2
#       CREATED:  2020-10-17 12:27 UTC
#      REVISION:  2020-10-17 10:57 UTC v1.1 re-started. The vscode-portable-setup.sh v1.0
#                                      was deleted by mistake (around ~30min of
#                                      work lost). TailsOS don't have a trash
#                                      feature and even VSCode warned
#                 2020-10-17 12:41 UTC v1.2 (fork from vscode-portable-setup.sh v1.1)
#===============================================================================
echo "Usage:"
echo "    cat vscode-deb-setup.sh"
echo "exiting..."
exit 0


#### 1. [Optional] /home/amnesia/Persistent/downloads creation _________________
# Create an Persistent downloads folder, if already not exists. This may be
# useful if you and to re-install on future without re-downloade
mkdir /home/amnesia/Persistent/downloads


#### 2. Download and install VSCode deb _________________________________________
# @see https://code.visualstudio.com/docs/editor/portable

# Choose ONE of the following steps

### 2.1 /home/amnesia/Persistent/downloads/vscode.deb (Persistent installer) .....
wget https://go.microsoft.com/fwlink/?LinkID=760868 -O /home/amnesia/Persistent/downloads/vscode.deb
# sudo apt update
sudo apt install /home/amnesia/Persistent/downloads/vscode.deb


### 2.2 /tmp/vscode.deb (Download on RAM) .........................................
wget https://go.microsoft.com/fwlink/?LinkID=760868 -O /tmp/vscode.deb
# sudo apt update
sudo apt install /tmp/vscode.deb

# Delete the /tmp file to allow system free memory
rm -f /tmp/vscode.deb

#### README: example not working __________________________________________________
# @see https://github.com/fititnt/TailsOS-for-non-whistleblowers/issues/1#issuecomment-710931772