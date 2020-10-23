#!/bin/sh
#===============================================================================
#
#          FILE:  vscode-deb-setup.sh
#
#         USAGE:  cat vscode-deb-setup.sh
#
#   DESCRIPTION:  Install VSCode from .deb file on Tails.
#
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  1. As for Tails v4.12, this script have some bugs. Consider
#                    using the alternative vscode-portable-setup.sh
#         NOTES:  ---
#        AUTHOR:  Emerson Rocha <rocha[at]ieee.org>
#       COMPANY:  Etica.AI
#       LICENSE:  Public Domain
#       VERSION:  1.3
#       CREATED:  2020-10-17 12:27 UTC
#      REVISION:  2020-10-17 10:57 UTC v1.1 re-started. The vscode-portable-setup.sh v1.0
#                                      was deleted by mistake (around ~30min of
#                                      work lost). TailsOS don't have a trash
#                                      feature and even VSCode warned
#                 2020-10-17 12:41 UTC v1.2 (fork from vscode-portable-setup.sh v1.1)
#                 2020-10-23 15:11 UTC v1.3 Explain Hotfix for apt_hook_pre() on
#                                      /usr/local/sbin/tails-additional-software
#                                      to be able to install debs.
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

### 2 /home/amnesia/Persistent/downloads/vscode.deb (Persistent installer) .....
wget https://go.microsoft.com/fwlink/?LinkID=760868 -O /tmp/vscode.deb
sudo apt update
sudo apt install /tmp/vscode.deb
rm -f /tmp/vscode.deb

#### HOTFIX: Error "KeyError: "The cache has no package named 'code'""
# @see https://github.com/fititnt/TailsOS-for-non-whistleblowers/issues/12#issuecomment-715442018
# This error happens on at least on Tails v4.11 / v4.12. You should ONLY do it
# if step 2 'sudo apt install /tmp/vscode.deb' fails with error message
# KeyError: "The cache has no package named 'code'""
#
# sudo gedit /usr/local/sbin/tails-additional-software
# Change this
##        if action.endswith(".deb"):
##            # Filter packages that will only be upgraded
##            if not apt_cache[package_name].is_installed:
##                installed_packages.append(package_name)
# for this
##        if action.endswith(".deb"):
##            # Filter packages that will only be upgraded
##            if (package_name not in apt_cache) or apt_cache[package_name].is_installed:
##                installed_packages.append(package_name)