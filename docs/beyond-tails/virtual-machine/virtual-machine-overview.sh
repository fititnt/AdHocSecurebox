#!/bin/sh
#===============================================================================
#
#          FILE:  virtual-machine-overview.sh
#
#         USAGE:  cat virtual-machine-overview.sh
#
#   DESCRIPTION:  Quick overview of one way to use virtual machines for stronger
#                 isolation than Conteiners (Docker, LXC Conteiners).
#                 Tested on Ubuntu 20.04.
#                 Most of this guide will be just examples
#
#       OPTIONS:  ---
#  REQUIREMENTS:  1. Any Linux with support for Linux Conteiners https://linuxcontainers.org/
#                    (Better tested on Ubuntu, using LXC installed with Snap)
#          BUGS:  1. NOTE for maintainers using shellsheck on this file: parts
#                    of this fille will show shellcheck warnings. Since this
#                    file is meant to be read and copy pasted, they will not
#                    "be fixed".
#         NOTES:  ---
#        AUTHOR:  Emerson Rocha <rocha[at]ieee.org>, based on work from Simos Xenitellis 
#       COMPANY:  Etica.AI
#       LICENSE:  Public Domain
#       VERSION:  1.0
#       CREATED:  2020-11-07 22:51
#      REVISION:  ---
#===============================================================================
echo "Usage:"
echo "    cat virtual-machine-overview.sh"
echo "exiting..."
exit 0

##### 1. References used on this guide _________________________________________
#### 1.1 Linux Conteiners, getting started .....................................
xdg-open https://linuxcontainers.org/lxd/getting-started-cli/#ubuntu


#### 1.2 Storage configuration .................................................
# Note: this guide will use 'dir' storage instead of create a dedicated
#       place.
xdg-open https://lxd.readthedocs.io/en/latest/storage/#storage-configuration

#### 1.3 How to use virtual machines in LXD, by Simos Xenitellis ...............
# Note: the version 1.0, while the LXC for Virtual Machines is somewhat even
#       simpler than user Docker, choosen to implement the Xenitellis
#       with no significant changes.
xdg-open https://blog.simos.info/how-to-use-virtual-machines-in-lxd/
xdg-open https://discuss.linuxcontainers.org/t/running-virtual-machines-with-lxd-4-0/7519

#### 1.4 Use public key autentication instead of password ......................
## Note: this guide, like the Xenitellis, will just cite the cloud-init
#        documentation about use public autentication
xdg-open https://cloudinit.readthedocs.io/en/19.4/topics/examples.html?highlight=ssh_authorized_keys

#### 1.5 LXD on Ubuntu 20.04 LTS using APT, by cyberciti .......................
# While on the virtual-machine-overview.sh we will install using snap, this
# guide show how to install using plain apt. This also have several other
# quick references on how to use LXD
xdg-open https://www.cyberciti.biz/faq/install-lxd-on-ubuntu-20-04-lts-using-apt/


#### 2. Installing LXC _________________________________________________________
# linuxcontainers do already decent support for several linux distros 
# (and somewhat allow client (not server) even for MacOS and Windows). Consider
# reading the official documentation for your specific Linux at
#    - https://linuxcontainers.org/lxd/getting-started-cli/#getting-the-packages


### 2.1 Tested on which bare metal operational system ..........................
# Just for your information. If you use a different Linux, you may need other
# setup strategies
cat /etc/*release
# DISTRIB_ID=Ubuntu
# DISTRIB_RELEASE=20.04
# DISTRIB_CODENAME=focal
# DISTRIB_DESCRIPTION="Ubuntu 20.04.1 LTS"
# NAME="Ubuntu"
# VERSION="20.04.1 LTS (Focal Fossa)"


### 2.2 Installing on Ubuntu, snap strategy ....................................
# The recommended on Ubuntu is with Snap. A TL;DR: of using snap over just
# Just use .deb files is you already have the LXC/LXD better sandboxed
# (even if you decide use LXC conteiners, and not LXC Virtual Machines).
snap install lxd


#### 3. lxd init (initialize LXD) ______________________________________________


### 3.1 lxd init ...............................................................
# The default values of lxd actually are good. The only difference we done on
# this example was 'storage backend' = dir and the data was stored at
# /var/snap/lxd/common/lxd/storage-pools/. Did not tested other storage
# alternatives but the documentation recommends btrfs/zfs for production

lxd init
# Would you like to use LXD clustering? (yes/no) [default=no]: 
# Do you want to configure a new storage pool? (yes/no) [default=yes]: 
# Name of the new storage pool [default=default]: 
# Name of the storage backend to use (dir, lvm, ceph, btrfs) [default=btrfs]: dir
# Would you like to connect to a MAAS server? (yes/no) [default=no]: 
# Would you like to create a new local network bridge? (yes/no) [default=yes]: 
# What should the new bridge be called? [default=lxdbr0]: 
# What IPv4 address should be used? (CIDR subnet notation, “auto” or “none”) [default=auto]: 
# What IPv6 address should be used? (CIDR subnet notation, “auto” or “none”) [default=auto]: 
# Would you like LXD to be available over the network? (yes/no) [default=no]: 
# Would you like stale cached images to be updated automatically? (yes/no) [default=yes] 
# Would you like a YAML "lxd init" preseed to be printed? (yes/no) [default=no]: yes
# config: {}
# networks:
# - config:
#     ipv4.address: auto
#     ipv6.address: auto
#   description: ""
#   name: lxdbr0
#   type: ""
#   project: default
# storage_pools:
# - config: {}
#   description: ""
#   name: default
#   driver: dir
# profiles:
# - config: {}
#   description: ""
#   devices:
#     eth0:
#       name: eth0
#       network: lxdbr0
#       type: nic
#     root:
#       path: /
#       pool: default
#       type: disk
#   name: default
# cluster: null

### 3.1 Generic quick commands about lxc .......................................
lxc profile list
lxc profile show default
lxc network list
lxc network show lxdbr0
lxc storage list
lxc storage show default

### 3.2 lxc profile create vm ..................................................
# Based on Simos Xenitellis (https://blog.simos.info/how-to-use-virtual-machines-in-lxd/)
# this step is necessary to to tell LXC how to innitialize new VMs. The bare
# minimum it does is initialize the ubuntu user with password 'ubuntu'

# PROTIP: this syntax is "cloud-init". If you are interested on what more could
#         be used to initialize, see
#         https://cloudinit.readthedocs.io/en/latest/topics/examples.html

# NOTE for maintainers using shellsheck on this file: The next snipped will
#      show shellcheck warnings. Since this file is meant to be read and copy
#      pasted, they will not "be fixed".

cat | lxc profile edit vm
config:
   user.user-data: |
     #cloud-config
     ssh_pwauth: yes
     
     users:
       - name: ubuntu
         passwd: "$6$iBF0eT1/6UPE2u$V66Rk2BMkR09pHTzW2F.4GHYp3Mb8eu81Sy9srZf5sVzHRNpHP99JhdXEVeN0nvjxXVmoA6lcVEhOOqWEd3Wm0"
         lock_passwd: false
         groups: lxd
         shell: /bin/bash
         sudo: ALL=(ALL) NOPASSWD:ALL
description: LXD profile for virtual machines
devices:
  config:
    source: cloud-init:config
    type: disk
name: vm
used_by:

Ctrl^D

# Ctrl^D

# This will how details of created profile ()
lxc profile show vm
# config:
#   user.user-data: |
#     #cloud-config
#     ssh_pwauth: yes

#     users:
#       - name: ubuntu
#         passwd: "$6$iBF0eT1/6UPE2u$V66Rk2BMkR09pHTzW2F.4GHYp3Mb8eu81Sy9srZf5sVzHRNpHP99JhdXEVeN0nvjxXVmoA6lcVEhOOqWEd3Wm0"
#         lock_passwd: false
#         groups: lxd
#         shell: /bin/bash
#         sudo: ALL=(ALL) NOPASSWD:ALL
# description: LXD profile for virtual machines
# devices:
#   config:
#     source: cloud-init:config
#     type: disk
# name: vm

#### 4. Virtual Machines manangement ___________________________________________
# Note: is VERY IMPORTANT to use the "--vm". Without this, the LXC will create
#       an container by default.


#### 4.1 Search by conteiners and virtual machines images ......................
# If you already used docker before, lxc will be somewhat intuitive. The actuall
# list of results is huge! On this overview we will show just a few to you
# get an idea of the size difference between conteinres image and virtual
# machines images. 

lxc image list images:
lxc image list images: | grep -i ubuntu
# | ubuntu/21.04 (7 more)                | 14708ad55a98 | yes    | Ubuntu hirsute amd64 (20201107_07:42)        | x86_64       | VIRTUAL-MACHINE | 242.50MB  | Nov 7, 2020 at 12:00am (UTC) |
# | ubuntu/21.04 (7 more)                | b02b2a4efb9a | yes    | Ubuntu hirsute amd64 (20201107_07:42)        | x86_64       | CONTAINER       | 102.85MB  | Nov 7, 2020 at 12:00am (UTC) |
# | ubuntu/focal (7 more)                | 0de5feb17cdc | yes    | Ubuntu focal amd64 (20201107_07:42)          | x86_64       | CONTAINER       | 99.83MB   | Nov 7, 2020 at 12:00am (UTC) |
# | ubuntu/focal (7 more)                | 239e4eaccaa7 | yes    | Ubuntu focal amd64 (20201107_07:42)          | x86_64       | VIRTUAL-MACHINE | 235.13MB  | Nov 7, 2020 at 12:00am (UTC) |

lxc image list images: | grep -i alpine
# | alpine/edge (3 more)                 | a2e1715e2590 | yes    | Alpine edge amd64 (20201107_13:00)           | x86_64       | VIRTUAL-MACHINE | 92.06MB   | Nov 7, 2020 at 12:00am (UTC) |
# | alpine/edge (3 more)                 | a8b45060932f | yes    | Alpine edge amd64 (20201107_13:00)           | x86_64       | CONTAINER       | 4.26MB    | Nov 7, 2020 at 12:00am (UTC) |

### 4.2 ubuntu-focal-vm1 creation ..............................................
# For this demo, we will create a Full Ubuntu virtual machine.
lxc launch ubuntu:focal ubuntu-focal-vm1 --vm --profile default --profile vm
#     Creating ubuntu-focal-vm1
#     Starting ubuntu-focal-vm1

lxc list
# +------------------+---------+------------------------+-------------------------------------------------+-----------------+-----------+
# |       NAME       |  STATE  |          IPV4          |                      IPV6                       |      TYPE       | SNAPSHOTS |
# +------------------+---------+------------------------+-------------------------------------------------+-----------------+-----------+
# | ubuntu-focal-vm1 | RUNNING | 10.97.250.180 (enp5s0) | fd42:24eb:5614:920b:216:3eff:fe50:2ef3 (enp5s0) | VIRTUAL-MACHINE | 0         |
# +------------------+---------+------------------------+-------------------------------------------------+-----------------+-----------+

lxc info ubuntu-focal-vm1
# Name: ubuntu-focal-vm1
# Location: none
# Remote: unix://
# Architecture: x86_64
# Created: 2020/11/08 01:14 UTC
# Status: Running
# Type: virtual-machine
# Profiles: default, vm
# Pid: 23076
# Ips:
#   enp5s0:	inet	10.97.250.180	tape9184421
#   enp5s0:	inet6	fd42:24eb:5614:920b:216:3eff:fe50:2ef3	tape9184421
#   enp5s0:	inet6	fe80::216:3eff:fe50:2ef3	tape9184421
#   lo:	inet	127.0.0.1
#   lo:	inet6	::1
# Resources:
#   Processes: 26
#   CPU usage:
#     CPU usage (in seconds): 22
#   Memory usage:
#     Memory (current): 503.89MB
#     Memory (peak): 516.99MB
#   Network usage:
#     enp5s0:
#       Bytes received: 856.83kB
#       Bytes sent: 110.68kB
#       Packets received: 1134
#       Packets sent: 627
#     lo:
#       Bytes received: 9.90kB
#       Bytes sent: 9.90kB
#       Packets received: 121
#       Packets sent: 121
#     sit0:
#       Bytes received: 0B
#       Bytes sent: 0B
#       Packets received: 0
#       Packets sent: 0
#     tunl0:
#       Bytes received: 0B
#       Bytes sent: 0B
#       Packets received: 0
#       Packets sent: 0

### 4.3 ubuntu-focal-vm1 login (via IP; via console) ...........................
# Both alternatives will require the password

## Via IP
ssh ubuntu@10.97.250.180

## Via console
lxc console ubuntu-focal-vm1

### 4.4 ubuntu-focal-vm1, informacion logged on VM .............................

ubuntu@ubuntu-focal-vm1:~$ df -h
# Filesystem      Size  Used Avail Use% Mounted on
# udev            484M     0  484M   0% /dev
# tmpfs            99M  584K   99M   1% /run
# /dev/sda1       8.9G  1.4G  7.6G  16% /
# tmpfs           494M     0  494M   0% /dev/shm
# tmpfs           5.0M     0  5.0M   0% /run/lock
# tmpfs           494M     0  494M   0% /sys/fs/cgroup
# /dev/sda15      105M  3.9M  101M   4% /boot/efi
# /dev/loop0       31M   31M     0 100% /snap/snapd/9721
# /dev/loop1       56M   56M     0 100% /snap/core18/1932
# /dev/loop2       71M   71M     0 100% /snap/lxd/16922
# tmpfs            99M     0   99M   0% /run/user/1000
# ubuntu@ubuntu-focal-vm1:~$ free -m
#               total        used        free      shared  buff/cache   available
# Mem:            987         135         151           0         699         842
# Swap:             0           0           0

### 4.5 ubuntu-focal-vm1, snapshot ............................................
# Note: depending of the strategy used to store the data of LXD, this will have
#       an huge impact on speed and free disk space.
lxc snapshot ubuntu-focal-vm1

# The information after the snapshot
lxc list
# +------------------+---------+------------------------+-------------------------------------------------+-----------------+-----------+
# |       NAME       |  STATE  |          IPV4          |                      IPV6                       |      TYPE       | SNAPSHOTS |
# +------------------+---------+------------------------+-------------------------------------------------+-----------------+-----------+
# | ubuntu-focal-vm1 | RUNNING | 10.97.250.180 (enp5s0) | fd42:24eb:5614:920b:216:3eff:fe50:2ef3 (enp5s0) | VIRTUAL-MACHINE | 1         |
# +------------------+---------+------------------------+-------------------------------------------------+-----------------+-----------+

### 4.6 ubuntu-focal-vm1, stop .................................................
lxc stop ubuntu-focal-vm1

### 4.7 ubuntu-focal-vm1, export (create .tar.gz dump) .........................
# IMPORTANT: while is possible to create a dump with 'lxc export' and then
#            (not 100%) import to a different LXD host, if the current
#            LXD host can connect directly the target LXD host, is better to use
#            the 'lxc copy' or 'lxc move'. Yes, LXC is more friendly than
#            Docker.

lxc export ubuntu-focal-vm1
# Backup exported successfully!                                         
ls -lha backup.tar.gz 
# -rw-rw-r-- 1 fititnt fititnt 1,3G nov  8 00:04 backup.tar.gz

### 4.7 ubuntu-focal-vm1, delete Virtual Machine and snapshots .................
lxc delete ubuntu-focal-vm1

lxc list
# +------+-------+------+------+------+-----------+
# | NAME | STATE | IPV4 | IPV6 | TYPE | SNAPSHOTS |
# +------+-------+------+------+------+-----------+
#