#!/bin/sh
#===============================================================================
#
#          FILE:  workspace-overview.sh
#
#         USAGE:  cat workspace-overview.sh
#
#   DESCRIPTION:  Describe conventions on directory structure that plays
#                 nice both with File Based Encryption (FBE) and could be
#                 somewhat portable between hosts.
#                 Inspired on some concepts of Tails OS, but main focus
#                 is other Linux distributions.
#
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  1. While this workspace-overview.sh could help to work with
#                    situations where full disk encryption is not an option
#                    (like already running VPSs, or desktop running with hardware
#                    without AES otpimizations) still strongly recommended
#                    you use full disk encryption as an additional (and
#                    important) layer of protection
#        AUTHOR:  Emerson Rocha <rocha[at]ieee.org>
#       COMPANY:  Etica.AI
#       LICENSE:  Public Domain
#       VERSION:  1.0
#       CREATED:  2020-11-05 00:41 BRT v1.0
#      REVISION:  ---
#===============================================================================
echo "Usage:"
echo "    cat workspace-overview.sh"
echo "exiting..."
exit 0


# - /workspace/
#         - /workspace/bin/
#         - /workspace/data/
#         - /workspace/git/
#         - /workspace/ramfs/
#         - /workspace/safe/

#### 1. The root path: /workspace _____________________________________________
# As opinionated convention, we will assume a path with exact name /workspace
# will exist. You may opt to mount this from an external disk, an USB stick,
# etc. But the only strong requisite is at the end have one /workspace

### mkdir /workspace ...........................................................
# On this example we will simply create on the / filesystem.
sudo mkdir /workspace

# We will not change the permissions from root to /workspace just because it will
# be uncommon to create other folders here.


#### 2. /workspace/bin/ ________________________________________________________
# Not documented. Likely to follow the conventions on
#    https://github.com/fititnt/TailsOS-for-non-whistleblowers/blob/main/docs/portable-software.sh
#    https://github.com/fititnt/TailsOS-for-non-whistleblowers/blob/main/docs/portable-data.sh

#### 3. /workspace/data/ ________________________________________________________
# SUGGESTED USE OF /workspace/data/
#     This is an generic place to store data that can persist on disk or that simply
#     does not exist sufficient RAM (on interest to create File Based Encryption)
#     to not so critical data.

# SEE: MVP of Tails-like concepts on everyday Linux distributions #27
#          - https://github.com/fititnt/TailsOS-for-non-whistleblowers/issues/27
# SEE: Design some optionated directory structure for data operations #24
#          - https://github.com/fititnt/TailsOS-for-non-whistleblowers/issues/24

sudo mkdir /workspace/data

# We will make /workspace/data availible only to root user and the default UID/GID
# for first non-root user (if this is not you case, change it, like
#     sudo chown myuser:myuser /workspace/data
sudo chown 1000:1000 /workspace/data
sudo chmod -R 0700 /workspace/data

#### 4. /workspace/git/ ________________________________________________________
# SUGGESTED USE OF /workspace/git/
#     If you work a lot with git, you can create your base directory for git
#     projects here.

sudo mkdir /workspace/git
 
sudo chown 1000:1000 /workspace/git
## sudo chown myuser:myuser /workspace/git

# sudo chmod -R 0700 /workspace/git/

#### 5. /workspace/ramfs/ ______________________________________________________
# Documentation is in another file
cat workspace-ramdisks.sh

#### 6. /workspace/tmpfs/ ______________________________________________________
# Documentation is in another file
cat workspace-ramdisks.sh

#### 7. /workspace/safe/ _______________________________________________________
# SUGGESTED USE OF /workspace/safe/
#     This path is supposed to be the default name of a place that can be
#     1) exchanged at any time (like change entire enviroments, like KeePass
#        databases, ssh private keys, generic program configurations, etc)
#     2) If the system reboots, its impossible to access old contents without
#        human intervention (and cannot be unlocked with user login)

#### 7.1 Strategies that require /workspace/safe already exist .................
# Since some strategies (like mount ramdisks) require that a file or a folder
# already exist on the target, we suggest that you add an generic folder
# with some content to avoid usage without mount first

sudo mkdir /workspace/safe
# sudo chown myuser:myuser /workspace/safe
sudo chown 1000:1000 /workspace/safe
echo "/workspace/safe NOT ready to use. Please configure before save files here." > /workspace/safe/workspace-safe-NOT-enabled.txt
chmod -R 500 /workspace/safe

#### 7.2 Strategies that require /workspace/safe DO NOT exist ..................
# Some strategies (like symlink) may not require that this path exist. You may
# try one of the following alternatives when you see such errors

# Instead of 'rm -rf /workspace/safe', is safe to move the folder
sudo mv /workspace/safe "/workspace/safe.bkp.$(date "+%Y-%m-%dT%T")~"
#  /workspace/safe.bkp.2020-11-06T01:36:12~
