#!/bin/sh
echo "Usage:"
echo "    cat zzz-undocumented.sh"
echo "exiting..."
exit 0


# Debug one-liners
df -h

echo $PATH

# Link local copy of git repository to the ~/bin, so we can do live testing
rm -r ~/bin
ln -s /home/amnesia/Persistent/TailsOS-for-non-whistleblowers/bin ~/bin
source ~/.bash_profile

sudo rm /live/persistence/TailsData_unlocked/.rsync-filter

cat << 'EOF' | sudo tee /live/persistence/TailsData_unlocked/.rsync-filter
- .tailsdata-is-source
- .tailsdata-is-replica
EOF