#!/bin/sh
#===============================================================================
#
#          FILE:  workspace-ramdisks.sh
#
#         USAGE:  cat workspace-ramdisks.sh
#
#   DESCRIPTION:  Describe conventions on directory structure to use RAM Disks.
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
#       CREATED:  2020-11-05 00:41 BRT v1.0
#      REVISION:  ---
#===============================================================================
echo "Usage:"
echo "    cat workspace-ramdisks.sh"
echo "exiting..."

#### 1. /workspace/ramfs _______________________________________________________
# ramfs is GRANTED to not swap. 
# This is good for secrets. But very bad if you put too much data here as your
# system will eventually run out of ram and force you to reboot
# After this initial setup + fstab, you enable with
#      mount /workspace/ramfs
# and disable with
#      umount /workspace/ramfs

### 2. /workspace/ramfs, initial setup .........................................
## 2.1 We will pre-create the directory 
# (it should already exist to allow mount) but try to deny accidental usage
# leaveing an very descriptive file
sudo mkdir /workspace/ramfs
sudo chown 1000:1000 /workspace/ramfs
echo "/workspace/ramfs NOT ready to use. Please configure before save files here." > /workspace/ramfs/workspace-ramfs-NOT-enabled.txt
chmod -R 500 /workspace/ramfs

### 2.2 /workspace/ramfs on /etc/fstab (without automatically mount at boot) ...
# @see https://unix.stackexchange.com/questions/26364/how-can-i-create-a-tmpfs-as-a-regular-non-root-user/325421#325421

vim /etc/fstab
# Then add the following at the end of your /etc/fstab (without inicial spaces)
#     none    /workspace/ramfs    ramfs    noauto,user,size=1024M,mode=0770    0    0

### 2.3 validate /etc/fstab before reboot ......................................
# @see https://serverfault.com/questions/174181/how-do-you-validate-fstab-without-rebooting/977928#977928
sudo findmnt --verify --verbose

### 2.4 mount /workspace/ramfs .................................................
# without use sudo, since we allowed on /etc/fstab now we can mount this directory
# ramfs is granted to not swap (but for paranoids: still possible do coldboot attacks)
mount /workspace/ramfs

### 2.5 umount /workspace/ramfs ..................................................
# This will release everyting that was on ramfs. The old content of 
# /workspace/ramfs/workspace-ramfs-NOT-enabled.txt should be availible again
umount /workspace/ramfs

#### 3. /workspace/safe ________________________________________________________
# TODO: (maybe) implement /workspace/tmpfs. Maybe not (fititnt, 2020-11-06 00:46 BRT)


### 3.1 /workspace/safe, initial setup ..........................................
## We will pre-create the directory, but try to deny accidental usage
sudo mkdir /workspace/safe
sudo chown 1000:1000 /workspace/safe
echo "/workspace/safe NOT ready to use. Please configure before save files here." > /workspace/safe/workspace-safe-NOT-enabled.txt
chmod -R 500 /workspace/safe
