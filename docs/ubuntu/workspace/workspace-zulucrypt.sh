#!/bin/sh
#===============================================================================
#
#          FILE:  workspace-zulucrypt.sh
#
#         USAGE:  cat workspace-zulucrypt.sh
#
#   DESCRIPTION:  Describe conventions on directory structure to use Cryptomator
#                 @see https://cryptomator.org/
#
#       OPTIONS:  ---
#  REQUIREMENTS:  1. /workspace (base path) already created
#                    see workspace-overview.sh
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Emerson Rocha <rocha[at]ieee.org>
#       COMPANY:  Etica.AI
#       LICENSE:  Public Domain
#       VERSION:  1.0
#       CREATED:  2020-11-05 02:23 BRT v1.0
#      REVISION:  ---
#===============================================================================
echo "Usage:"
echo "    cat workspace-zulucrypt.sh"
echo "exiting..."

# TODO: consider implementing AppArmor, see https://presentations.nordisch.org/apparmor/#/ (fititnt, 2020-11-06 22:25 BRT)

#### 1. Unlock your cryptomator vault with GUI _________________________________
# Download and create or open one existing vault with cryptomator. Assuming you
# used the FUSE method, we will have a long path with random characters, like
#    /home/fititnt/.local/share/Cryptomator/mnt/R7CdCLakCFnT_0
# We will assume that you want to use the more standard path
#     /workspace/safe
# So a symlink with 
#     ln -s /where/the/data/really/is/ /workspace/safe

ln -s /where/the/data/really/is/ /workspace/safe
# sudo ln -s /home/fititnt/.local/share/Cryptomator/mnt/R7CdCLakCFnT_0 /workspace/safe


# https://presentations.nordisch.org/apparmor/#/3
# /usr/bin/zuluCrypt-cli
# /usr/bin/zuluCrypt-gui
# /usr/bin/zuluMount-cli
# /usr/bin/zuluMount-gui
# /usr/bin/zuluPolkit
# /usr/bin/zuluSafe-cli
# sudo journalctl -f

