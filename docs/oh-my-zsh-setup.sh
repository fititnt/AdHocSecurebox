#!/bin/sh
#===============================================================================
#
#          FILE:  oh-my-zsh-setup.sh
#
#         USAGE:  cat oh-my-zsh-setup.sh
#
#   DESCRIPTION:  One way to install Oh My Zsh on TailsOS.
#                 Some links to consider reading:
#                     - https://www.zsh.org/
#                     - https://ohmyz.sh/
#                     - https://github.com/ohmyzsh/ohmyzsh/wiki
#
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Emerson Rocha <rocha[at]ieee.org>
#       COMPANY:  Etica.AI
#       LICENSE:  Public Domain
#       VERSION:  1.0
#       CREATED:  2020-10-19 23:35 UTC
#      REVISION:  ---
#===============================================================================
echo "Usage:"
echo "    cat oh-my-zsh-setup.sh"
echo "exiting..."
exit 0

#### 1. Install Zsh ____________________________________________________________

### 1.1 Commands to be executed on amnesia terminal as root
sudo apt update
sudo apt install zsh

### 1.2 Pop up interface steps (outside cli terminal, use mouse or equivalent)
## POP UP message:
#    " Add zhd to your additional software?"
#    " To install it automatically from your persistent storage when starting Tails"
#    " [ ] Install Only Once [ X ] Install Every Time"

# What you should do?
#  If you are very sure that you wand zsh (e.g already use outsite Tails and
#  already like it) do it Install every time.
#
#  If you don't already use zsh, choose install it only once. If you like
#  you can re-do it later. Please note that zsh may need extra configutations
#  compared to use the default bash terminal so it may not be good if
#  you're not open to some extra steps later.

#### 2. Install Oh My Zsh ______________________________________________________
# Note: this one-line-installer assumes you trust the file from
#           https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh
#       As alternative, you can first download the file, read it with some
#       editor (like the nano, vim and gedit), and then execute it. You can
#       also download to some place on your persistent directory to install
#       from there.
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

#### 3. Oh My Zsh changes ______________________________________________________
# Note: this assumes you already have enabled Persistence and the features
#       'dotfiles' is enabled.
cp /home/amnesia/.zshrc /live/persistence/TailsData_unlocked/dotfiles/
cp -r /home/amnesia/.oh-my-zsh /live/persistence/TailsData_unlocked/dotfiles/

# The next line is necessary only if you plan to unnistall oh-my-zsh, since the
# unninstaller of oh-my-zsh would try to revert for the old shell. Since you're
# already using TailsOS in special if you're doing a live install, this step
# would be not necessary. But we're documenting anyway.
cp /home/amnesia/.shell.pre-oh-my-zsh /live/persistence/TailsData_unlocked/dotfiles/

# On next boot, when you unlock your TailsData partition it any new
# customization will already be symlinked from your 
#    /live/persistence/TailsData_unlocked/dotfiles/
# to your
#    /home/amnesia

# TODO: check if the zsh was changed to be default shell. While the oh-my-zsh
#       installation I know are likely to persist, the zsh as default terminal
#       may need an extra step. Not sure (fititnt, 2020-10-20 00:46 UTC)

