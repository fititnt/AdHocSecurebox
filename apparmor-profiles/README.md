# TailsOS-for-non-whistleblowers/apparmor-profiles

From <https://apparmor.net/>:

> "AppArmor is an effective and easy-to-use Linux application security system.
AppArmor proactively protects the operating system and applications **from
external or internal threats, even zero-day attacks**, by enforcing good
behavior and preventing both known and unknown application flaws from being
exploited."
>
> "AppArmor supplements the traditional Unix discretionary access control
(DAC) model by providing mandatory access control (MAC). It has been
included in the mainline Linux kernel since version 2.6.36 and its development
has been supported by Canonical since 2009."
>
> Source: <https://apparmor.net/>

## About this folder

## See also

- <https://ubuntu.com/tutorials/beginning-apparmor-profile-development#1-overview>
- <https://presentations.nordisch.org/apparmor/#/3>

<!--

#### auditd ____________________________________________________________________
# https://presentations.nordisch.org/apparmor/#/3
sudo apt install auditd
# sudo apt remove auditd

# @see http://manpages.ubuntu.com/manpages/focal/man5/apparmor.d.5.html

sudo aa-status

sudo journalctl -fx

sudo gedit /etc/apparmor.d/usr.bin.zulucrypt

# sudo service apparmor reload
sudo systemctl status apparmor.service
sudo systemctl reload apparmor.service

sudo systemctl reload apparmor.service && sudo zuluCrypt-cli

sudo apt install apparmor-utils
sudo aa-unconfined --paranoid 

sudo aa-genprof zuluCrypt-gui

sudo aa-genprof /workspace/bin/cryptomator.AppImage



-->