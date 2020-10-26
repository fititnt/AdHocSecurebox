#!/bin/sh
#===============================================================================
#
#          FILE:  gpg-setup.sh
#
#         USAGE:  cat gpg-setup.sh
#
#   DESCRIPTION:  ---
#
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Emerson Rocha <rocha[at]ieee.org>
#       COMPANY:  Etica.AI
#       LICENSE:  Public Domain
#       VERSION:  0.1 (draft)
#       CREATED:  2020-10-26 22:11 UTC
#      REVISION:  ---
#===============================================================================
echo "Usage:"
echo "    cat gpg-setup.sh"
echo "exiting..."
exit 0

##### 1. Tails official documentation around GPG _______________________________
#### 1.1 Tails Doc: OpenPGP public-key cryptography ............................
xdg-open https://tails.boum.org/doc/encryption_and_privacy/gpgapplet/public-key_cryptography/index.en.html

#### 1.2 Tails Doc: OpenPGP passphrase encryption ..............................
xdg-open https://tails.boum.org/doc/encryption_and_privacy/gpgapplet/passphrase_encryption/index.en.html

#### 1.3 Tails Doc: Emailing and reading news with Thunderbird  ................
xdg-open https://tails.boum.org/doc/anonymous_internet/thunderbird/index.en.html