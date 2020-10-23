#!/bin/sh
#===============================================================================
#
#          FILE:  cryptomator-setup.sh
#
#         USAGE:  cat cryptomator-setup.sh
#
#   DESCRIPTION:  Cryptomator setup on TailsOS. See
#                     - https://cryptomator.org/
#                     - https://github.com/cryptomator/cryptomator
#
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Emerson Rocha <rocha[at]ieee.org>
#       COMPANY:  Etica.AI
#       LICENSE:  Public Domain
#       VERSION:  1.0
#       CREATED:  2020-10-23 19:11 UTC
#      REVISION:  ---
#===============================================================================
echo "Usage:"
echo "    cat cryptomator-setup.sh"
echo "exiting..."
exit 0


# Change the "1.5.8" for the newest version and Execute this command
CRYPTOMATOR_VERSION="1.5.8"


#******************************************************************************#
#                                ONE TIME SETUP                                #
# Recommended if is just testing the cryptomator or persistence is locked      #
#******************************************************************************#

#### A.1. Choose a place to download from ______________________________________

# Choose one of these 
#   1. GitHub (recommended): https://github.com/cryptomator/cryptomator/releases
#   2. Official site: https://cryptomator.org/downloads/
#   3. [private copy] From some USB stick (for offline usage)
#   4. [private copy] From some copy on your Dropbox, Google Drive, Ftp server, etc

# On this setup, we will assume you will wand download from original site via
# command line. But you could (and maybe should based on your threat model) do
# it manually


#### A.2. Download Cryptomator to /tmp/cryptomator.AppImage ____________________

# wget https://github.com/cryptomator/cryptomator/releases/download/1.5.8/cryptomator-1.5.8-x86_64.AppImage -O /tmp/cryptomator.AppImage
wget "https://github.com/cryptomator/cryptomator/releases/download/${CRYPTOMATOR_VERSION}/cryptomator-${CRYPTOMATOR_VERSION}-x86_64.AppImage" -O /tmp/cryptomator.AppImage

#### A.3. Make /tmp/cryptomator.AppImage executable ____________________________
# This can be done via gui. Here we will show via terminal
chmod +x /tmp/cryptomator.AppImage

#### A.4. Run cryptomator ______________________________________________________
./tmp/cryptomator.AppImage

#******************************************************************************#
#                             PERSISTENT USAGE                                 #
# Alternative to persist installer of cryptomator                              #
#******************************************************************************#

##### B.1. Requisites __________________________________________________________
#### B.1.1. Read Tails official documentation about setup persistence ..........
xdg-open https://tails.boum.org/doc/first_steps/persistence/index.en.html

#### B.1.1 Persistence should be enabled and unlocked ..........................
# If these commands don't return error, you're ok to go
ls /home/amnesia/Persistent/
ls /live/persistence/TailsData_unlocked/

##### B.2. Directory strcucture ________________________________________________

#### B.2.1 Base path for Persistent cryptomator ................................
# This optionated directory layout is based on this other file
#     - docs/portable-software.sh

mkdir /home/amnesia/Persistent/software
mkdir /home/amnesia/Persistent/software/appimage
