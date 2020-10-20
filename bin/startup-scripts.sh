#!/bin/sh
#===============================================================================
#
#          FILE:  startup-scripts.sh
#
#         USAGE:  You can either run this script:
#                     ./startup-scripts.sh
#                 Or copy and paste the specific line on your custom script
#
#   DESCRIPTION:  Execute all .sh files on the directory
#                     ~/bin/startup-scripts/
#                 if the path exists. Then will search for files on
#                     ~/bin/startup-scripts-examples/
#                 Tip: you can also copy the contents of this file to some file
#                 that is executed by default on your terminal, like the
#                      ~/.bash_profile
#
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Emerson Rocha <rocha[at]ieee.org>, based on Patrick Blook work
#       COMPANY:  Etica.AI
#       LICENSE:  Public Domain
#       VERSION:  1.0
#       CREATED:  2020-10-20 05:58 UTC
#      REVISION:  ---
#===============================================================================

#### Custom additions from original ~/.profile, START __________________________
# Note: this code exists both on the my-git-repo/bin/startup-scripts.sh and
#       my-git-repo/dotfiles/example/rocha/.bash_profile

# If ~/bin/startup-scripts/ (or ~/bin/startup-scripts-examples/) exists, we
# execute every .sh file there
if [ -d "$HOME/bin/startup-scripts" ];
then
    run-parts --regex '.*sh$' "$HOME/bin/startup-scripts/"
elif [ -d "$HOME/bin/startup-scripts-examples" ];
then
    run-parts --regex '.*sh$' "$HOME/bin/startup-scripts-examples/"
fi

#### Custom additions from original ~/.profile, END ____________________________