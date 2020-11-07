# TailsOS-for-non-whistleblowers/apparmor-profiles

This folder contain examples of AppArmor profiles.

## What is AppArmor?
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

## Getting AppArmor / Distributions and Ports / Distributions that include AppArmor:

> - **Annvix**
> - **Arch Linux**
>   - documentation and Arch specific notes
>   - <https://wiki.archlinux.org/index.php/AppArmor>
> - **CentOs**
>   - documentation and CentOS specific notes
>   - <https://gitlab.com/apparmor/apparmor/-/wikis/Distro_CentOS>
> - **Debian**
>   - documentation and Debian specific notes
>   - <https://gitlab.com/apparmor/apparmor/-/wikis/distro_debian>
> - **Gentoo**
> - **openSUSE** (integrated in default install)
>   - documentation and Suse specific notes
>   - <https://gitlab.com/apparmor/apparmor/-/wikis/distro_suse>
> - **Pardus Linux**
> - **PLD**
> - **Ubuntu** (integrated in default install)
>   - documentation and Ubuntu specific notes
>   - <https://gitlab.com/apparmor/apparmor/-/wikis/distro_ubuntu>
> 
> Any derivatives of these distributions should also have AppArmor available. Updated RPMS can be found at the openSUSE Build Service. These are not limited to SUSE distributions.
>
> -- Source: <https://gitlab.com/apparmor/apparmor/-/wikis/home>

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