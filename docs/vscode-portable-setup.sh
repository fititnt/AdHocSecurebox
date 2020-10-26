#!/bin/sh
#===============================================================================
#
#          FILE:  vscode-portable-setup.sh
#
#         USAGE:  cat vscode-portable-setup.sh
#
#   DESCRIPTION:  VSCode (portable) setup for TailsOS.
#
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Emerson Rocha <rocha[at]ieee.org>
#       COMPANY:  Etica.AI
#       LICENSE:  Public Domain
#       VERSION:  1.2
#       CREATED:  2020-10-17 10:57 UTC
#      REVISION:  2020-10-17 10:57 UTC v1.1 re-started. The vscode-portable-setup.sh v1.0
#                                      was deleted by mistake (around ~30min of
#                                      work lost). TailsOS don't have a trash
#                                      feature and even VSCode warned
#                 2020-10-23 23:13 UTC v1.2 Improved! Now we have tails-code helper
#                                      This doc still need for initial installation
#===============================================================================
echo "Usage:"
echo "    cat vscode-portable-setup.sh"
echo "exiting..."
exit 0

#******************************************************************************#
#                                ONE TIME SETUP                                #
# Recommended if is just testing the vscode or persistence is locked           #
#******************************************************************************#

#### A.1. Choose a place to download from ______________________________________

# Choose one of these
#   1. GitHub [Not tested]: https://github.com/microsoft/vscode/releases
#   2. Official site: https://code.visualstudio.com/Download
#   3. [private copy] From some USB stick (for offline usage)
#   4. [private copy] From some copy on your Dropbox, Google Drive, Ftp server, etc

# On this setup, we will assume you will want download from original site via
# command line (It's the VSCODE_DOWNLOAD_URL value)
VSCODE_DOWNLOAD_URL="https://go.microsoft.com/fwlink/?LinkID=620884"

#### A.2. Download VSCode and move to /home/amnesia/Desktop/VSCode-linux-x64 ___
# wget https://go.microsoft.com/fwlink/?LinkID=620884 -O /tmp/vscode.tar.gz
wget $VSCODE_DOWNLOAD_URL -O /tmp/vscode.tar.gz

# Uncompress to /home/amnesia/Desktop/VSCode-linux-x64 
cd /home/amnesia/Desktop
tar -vzxf /tmp/vscode.tar.gz

#### A.3. Run VSCode from RAM (~/Desktop/VSCode-linux-x64/code _________________

# Choose one of these alternatives

### A.3.1 VSCode run, via full path ............................................
# This is will work even if you don't configured aliases
/home/amnesia/Desktop/VSCode-linux-x64/code --no-sandbox

# To Open some specific folder, like /home/amnesia/Persistent/git/myusername/my-project
#    /home/amnesia/Desktop/VSCode-linux-x64/code --no-sandbox /home/amnesia/Persistent/git/myusername/my-project

### A.3.2 tails-code ...........................................................
# If tails-code is added to your path, just run
tails-code

# To Open some specific folder, like /home/amnesia/Persistent/git/myusername/my-project
#    tails-code /home/amnesia/Persistent/git/myusername/my-project

#******************************************************************************#
#                             PERSISTENT USAGE                                 #
# Alternative to persist installer of cryptomator. Uses previous steps         #
#******************************************************************************#

##### B.1. Requisites __________________________________________________________
#### B.1.1. Read Tails official documentation about setup persistence ..........
xdg-open https://tails.boum.org/doc/first_steps/persistence/index.en.html

#### B.1.1 Persistence should be enabled and unlocked ..........................
# If these commands don't return error, you're ok to go
ls /home/amnesia/Persistent/
ls /live/persistence/TailsData_unlocked/

##### B.2. Directory structure _________________________________________________
# We will create a place to store the portable app with somewhat optionated
# directory structure

#### B.2.1 Base path for Persistent VSCode .....................................
# This optionated directory layout is based on this other file
#     - docs/portable-software.sh

mkdir /home/amnesia/Persistent/software
mkdir /home/amnesia/Persistent/software/portable

##### B.3 Persist /home/amnesia/Desktop/cryptomator.AppImage ___________________
# Assuming that you already done the
#    - A.1. Choose a place to download from
#    - A.2. Download VSCode and move to /home/amnesia/Desktop/VSCode-linux-x64
# We will move this folder to a persistent place. The tails-code can
# load it back to Desktop
mv /home/amnesia/Desktop/VSCode-linux-x64 /home/amnesia/Persistent/software/portable


#### B.4. Run VSCode ___________________________________________________________

### A.4.1 Via terminal, to open the app (its an gui) with tails-code ...........
# If tails-code is added to your path, just run
tails-code

# To Open some specific folder, like /home/amnesia/Persistent/git/myusername/my-project
#    tails-code /home/amnesia/Persistent/git/myusername/my-project

### A.4.2 Manual steps, without tails-code .....................................
# tails-code would copy from Persistence to RAM (Desktop). so you need do this
# by yourself
cp -r /home/amnesia/Persistent/software/portable/VSCode-linux-x64/ /home/amnesia/Desktop

# This is will work even if you don't configured aliases
/home/amnesia/Desktop/VSCode-linux-x64/code --no-sandbox

# To Open some specific folder, like /home/amnesia/Persistent/git/myusername/my-project
#    /home/amnesia/Desktop/VSCode-linux-x64/code --no-sandbox /home/amnesia/Persistent/git/myusername/my-project