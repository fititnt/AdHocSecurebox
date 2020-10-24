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
# REQUIRES:                                                                    #
#    No requeriments. Can run even without administrator password              #
#******************************************************************************#

#### A.1. Choose a place to download from ______________________________________

# Choose one of these 
#   1. GitHub (recommended): https://github.com/cryptomator/cryptomator/releases
#   2. Official site: https://cryptomator.org/downloads/
#   3. [private copy] From some USB stick (for offline usage)
#   4. [private copy] From some copy on your Dropbox, Google Drive, Ftp server, etc

# On this setup, we will assume you will want download from original site via
# command line. But you could (and maybe should based on your threat model) do
# it manually

#### A.2. Download Cryptomator to /home/amnesia/Desktop/cryptomator.AppImage ____

# wget https://github.com/cryptomator/cryptomator/releases/download/1.5.8/cryptomator-1.5.8-x86_64.AppImage -O /tmp/cryptomator.AppImage
wget "https://github.com/cryptomator/cryptomator/releases/download/${CRYPTOMATOR_VERSION}/cryptomator-${CRYPTOMATOR_VERSION}-x86_64.AppImage" -O /home/amnesia/Desktop/cryptomator.AppImage

#### A.3. Make /home/amnesia/Desktop/cryptomator.AppImage executable ___________
# This can be done via gui. Here we will show via terminal
chmod +x /home/amnesia/Desktop/cryptomator.AppImage

#### A.4. Run cryptomator ______________________________________________________
### A.4.1 Via terminal, to open the app (its an gui) ...........................
/home/amnesia/Desktop/cryptomator.AppImage

### A.4.1 By Clicking on the desktop with mouse ................................
# Note: click on the executable file seems to not work from Desktop. This may be
#       intentional by Tails. From /tmp is possible to click
#           cp /home/amnesia/Desktop/cryptomator.AppImage /tmp/cryptomator.AppImage
#           xdg-open /tmp
#           # Click with mouse on the file cryptomator.AppImage

### TODO: dest this following description on a clean tails (fititnt, 2020-10-23 20:59 UTC)
# NOTE: when you reboot, your desktop icons/files will not be saved to disk
#       (e.g. will not persist reboot). This is considered a feature, not a bug
#       for Tails. One way to ignore this would be enable Persistente+dotfile
#       then run
#           mkdir /live/persistence/TailsData_unlocked/dotfiles/Desktop
#           mv /home/amnesia/Desktop /home/amnesia/Desktop.bkp
#           ln -s /live/persistence/TailsData_unlocked/dotfiles/Desktop /home/amnesia/Desktop
# WARNING: this project assumes that you did not done the command to persist
#       Desktop files, and all portable software setups will assume that
#       /home/amnesia/Desktop is running from RAM. The implication is that
#       some software, like VSCode, will run slow as they freeze to use disk.

#******************************************************************************#
#                             PERSISTENT USAGE                                 #
# Alternative to persist installer of cryptomator. Uses previous steps         #
# REQUIRES:                                                                    #
#  1. Tails Persistence configured and unlocked                                #
# NON-REQUERIMENT:                                                             #
#  2. Tails administrator password likely to not required (TODO: check it)     #
#******************************************************************************#

##### B.1. Requisites __________________________________________________________
#### B.1.1. Read Tails official documentation about setup persistence ..........
xdg-open https://tails.boum.org/doc/first_steps/persistence/index.en.html

#### B.1.1 Persistence should be enabled and unlocked ..........................
# If these commands don't return error, you're ok to go
ls /home/amnesia/Persistent/
ls /live/persistence/TailsData_unlocked/

##### B.2. Directory structure ________________________________________________
# We will create a place to store the appimage app with somewhat optionated
# directory structure

#### B.2.1 Base path for Persistent cryptomator ................................
# This optionated directory layout is based on this other file
#     - docs/portable-software.sh

mkdir /home/amnesia/Persistent/software
mkdir /home/amnesia/Persistent/software/appimage


##### B.3 Persist /home/amnesia/Desktop/cryptomator.AppImage ___________________
# Assuming that you already done the
#    - A.1. Choose a place to download from 
#    - A.2. Download Cryptomator to /home/amnesia/Desktop/cryptomator.AppImage
#    - A.3. Make /home/amnesia/Desktop/cryptomator.AppImage executable
# We will move this file to a persistent place
mv /home/amnesia/Desktop/cryptomator.AppImage /home/amnesia/Persistent/software/appimage/


#### B.4. Run Cryptomator ______________________________________________________

### A.4.1 Via terminal, to open the app (its an gui) ...........................
/home/amnesia/Persistent/software/appimage/cryptomator.AppImage

### A.4.1 By Clicking on the desktop with mouse ................................

# Open the path /home/amnesia/Persistent/software/appimage/
xdg-open /home/amnesia/Persistent/software/appimage/
# Then click with mouse on the file cryptomator.AppImage