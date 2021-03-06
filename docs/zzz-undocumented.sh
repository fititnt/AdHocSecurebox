#!/bin/sh
echo "Usage:"
echo "    cat zzz-undocumented.sh"
echo "exiting..."
exit 0

# Ignore this file. This is just a temp place to some stuff.

# Debug one-liners
df -h

echo $PATH

# Only for rocha usage: this will make always the ~/bin folder point to the master repository
#  ln -s /home/amnesia/Persistent/git/fititnt/TailsOS-for-non-whistleblowers/bin /live/persistence/TailsData_unlocked/dotfiles/bin

# Point /home/amnesia/Persistent/software/bin to /home/amnesia/Persistent/git/fititnt/TailsOS-for-non-whistleblowers/bin
# So rocha do not need to rsync all the files
ln -s /home/amnesia/Persistent/git/fititnt/TailsOS-for-non-whistleblowers/bin /live/persistence/TailsData_unlocked/Persistent/software/bin
ln -s /home/amnesia/Persistent/git/fititnt/TailsOS-for-non-whistleblowers/bin /home/amnesia/Persistent/bin

# Link local copy of git repository to the ~/bin, so we can do live testing
rm -r ~/bin
ln -s /home/amnesia/Persistent/git/fititnt/TailsOS-for-non-whistleblowers/bin ~/bin
source ~/.bash_profile



# Copy VSCode to ram to improve performance
cp -r /home/amnesia/Persistent/VSCode-linux-x64/ /home/amnesia/Desktop
/home/amnesia/Desktop/VSCode-linux-x64/code --no-sandbox /home/amnesia/Persistent/TailsOS-for-non-whistleblowers

sudo rm /live/persistence/TailsData_unlocked/.rsync-filter

cat << 'EOF' | sudo tee /live/persistence/TailsData_unlocked/.rsync-filter
- .tailsdata-is-source
- .tailsdata-is-replica
EOF



#### https://github.com/fititnt/TailsOS-for-non-whistleblowers/issues/15
# MVP of any FTP/SSH/etc client with GUI on TailsOS
## https://linuxnewbieguide.org/how-to-use-google-drive-in-linux/
#
sudo apt-get install gnome-control-center gnome-online-accounts

# amnesia@amnesia:~/Persistent/git/fititnt/TailsOS-for-non-whistleblowers$ sudo apt-get install gnome-control-center gnome-online-accounts
# [sudo] password for amnesia: 
# Reading package lists... Done
# Building dependency tree       
# Reading state information... Done
# The following additional packages will be installed:
#   apg cheese-common gnome-control-center-data libcheese-gtk25 libcheese8 libcolord-gtk1 libgoa-backend-1.0-1
# Suggested packages:
#   gnome-software | gnome-packagekit libcanberra-gtk-module libcanberra-gtk3-module
# Recommended packages:
#   gnome-user-share rygel | rygel-tracker libnss-myhostname pulseaudio-module-bluetooth realmd
# The following NEW packages will be installed:
#   apg cheese-common gnome-control-center gnome-control-center-data gnome-online-accounts libcheese-gtk25 libcheese8 libcolord-gtk1 libgoa-backend-1.0-1
# 0 upgraded, 9 newly installed, 0 to remove and 5 not upgraded.
# Need to get 6,701 kB/6,843 kB of archives.
# After this operation, 26.0 MB of additional disk space will be used.
# Do you want to continue? [Y/n] y

# Do not work without extra configuration, see https://github.com/fititnt/TailsOS-for-non-whistleblowers/issues/15#issuecomment-716046478
sudo apt remove gnome-control-center gnome-online-accounts
sudo apt autoremove

# hummm... is possible to setup a proxy, see
#  https://askubuntu.com/questions/227441/gnome-online-accounts-through-proxy
#  https://askubuntu.com/questions/1190511/set-proxy-for-gnome-online-accountsgoogle
#  https://github.com/clearlinux/distribution/issues/599
#  https://www.privateinternetaccess.com/helpdesk/kb/articles/using-a-vpn-proxy-in-tails

#### Changing theme
sudo apt install gnome-tweaks
# Sets adawake-dark theme

#### polipo test
# VSCode on past supported SOCKS5 https://github.com/microsoft/vscode/issues/22214, https://github.com/microsoft/vscode/issues/9971
  
# This question https://github.com/microsoft/vscode/issues/22214#issuecomment-285085983
#   /home/amnesia/Desktop/VSCode-linux-x64/code --no-sandbox --proxy-server=socks5://localhost:8888
#   /home/amnesia/Desktop/VSCode-linux-x64/code --no-sandbox --proxy-server=socks5://127.0.0.1:9050

# @see VSCode (Electron/Chromium apps) networking through Tor and/or Tails #23
# https://github.com/fititnt/TailsOS-for-non-whistleblowers/issues/23
sudo apt install polipo

# amnesia@amnesia:~/Persistent/git/fititnt/TailsOS-for-non-whistleblowers$ sudo netstat -ntulp
# [sudo] password for amnesia: 
# Active Internet connections (only servers)
# Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name    
# tcp        0      0 127.0.0.1:9062          0.0.0.0:*               LISTEN      10554/tor           
# tcp        0      0 127.0.0.1:9040          0.0.0.0:*               LISTEN      10554/tor           
# tcp        0      0 127.0.0.1:631           0.0.0.0:*               LISTEN      10351/cupsd         
# tcp        0      0 127.0.0.1:9050          0.0.0.0:*               LISTEN      10554/tor           
# tcp        0      0 127.0.0.1:8123          0.0.0.0:*               LISTEN      10532/polipo        
# tcp        0      0 127.0.0.1:9051          0.0.0.0:*               LISTEN      4279/python3        
# tcp        0      0 127.0.0.1:9052          0.0.0.0:*               LISTEN      10554/tor           
# tcp        0      0 127.0.0.1:9150          0.0.0.0:*               LISTEN      10554/tor           
# udp        0      0 127.0.0.1:5353          0.0.0.0:*                           10554/tor           
# udp        0      0 0.0.0.0:68              0.0.0.0:*                           10164/dhclient 