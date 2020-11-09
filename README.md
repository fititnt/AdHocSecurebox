# AdHocSecurebox v3.0
**AdHocSecurebox (formerly _TailsOS-for-non-whistleblowers_) is an opinionated collection of public domain scripts/docs to deal with sensitive data with average hardware and open source software.** Does not aim to be perfect: just to be _less wrong_ when you have to do it.

How to do it on an Tails live USB right now?

```bash
git clone https://github.com/fititnt/AdHocSecurebox.git /tmp/bootstrap-tails
# mv /home/amnesia/bin /home/amnesia/bin.bkp
cp -r /tmp/bootstrap-tails/bin /home/amnesia/bin
/home/amnesia/bin/tails-do-it
```

> [[issue#34](https://github.com/fititnt/AdHocSecurebox/issues/34)] The initial target audience of this project
>
> TODO: add description of the initial reasons for this project. But definitely mention about Domestic Violence survivors (fititnt, 2020-11-07 21:11 BRT) 

---

**Table of Contents**

<!-- TOC depthFrom:2 orderedList:true -->

1. [Why?](#why)
    1. [Tails is a great start even for non-target audiences](#tails-is-a-great-start-even-for-non-target-audiences)
    2. [TL;DR: of AdHocSecurebox](#tldr-of-adhocsecurebox)
2. [Tails](#tails)
    1. [Overview](#overview)
        1. [`bin/`: Tails executable scripts](#bin-tails-executable-scripts)
        2. [`directory-structure/`: Example of directory structure](#directory-structure-example-of-directory-structure)
        3. [`docs/`: Tails guides by topic](#docs-tails-guides-by-topic)
        4. [`dotfiles/example/`](#dotfilesexample)
    2. [Installation](#installation)
        1. [Simple](#simple)
        2. [Via git](#via-git)
    3. [Acknowledgements](#acknowledgements)
        1. [Official references](#official-references)
        2. [Community references](#community-references)
3. [Beyond Tails](#beyond-tails)
    1. [AppArmor profiles](#apparmor-profiles)
    2. [Optionated workspace](#optionated-workspace)
    3. [YubiKey](#yubikey)
4. [Reuse of this work](#reuse-of-this-work)
    1. [License](#license)

<!-- /TOC -->

---

## Why?

### Tails is a great start even for non-target audiences

[Tails](https://tails.boum.org/), without any extra, already is a great start
for an _ad hoc secure box_ (and is much simpler to get it working than
[Qubes OS](https://www.qubes-os.org/) / [Whonix](https://www.whonix.org/)).
But by design Tails ("The **Amnesic** Incognito Live System") is not an average
OS for daily usage in special for who is not the target audience.

<!--

AdHocSecurebox does not try to "fix" Tails (because most fixes would make
it less secure for target audience), but, when makes sense, document
how to use Tails for specific tasks and how to make it portable to "Beyond
Tails".

-->

### TL;DR: of AdHocSecurebox

This GitHub project have tested scripts to use on Tails (with special care
about how to backup/restore) when you have to deal with, for example:

- **On Tails**: create SSH private keys, generate PGP keys for your Yubikey,
  use an OS as fallback mechanism to log on your servers when your main
  computer has issues (or you are on-the-go and your company/government
  would not allow you use any friends hardware). Etc.
- **Beyond Tails**: even if you already have full-disk encryption we
  document potential tips for how to deal with you daily Desktop
  workstation to not leave all the time either encryption/authentication
  keys accessible or the data itself open for any random software (think
  your Zoom, Skype, Spotify, etc) that could scan your disks for such
  contents. We here also enforce you to use strategies that could be
  resilient to ransomware like do remote backups without fear because
  they're encrypted.

> **As a rule of thumb**: you can use Tails to access other disks, but **avoid
  using your main workstation to access TailsData (encrypted by default)**.
  Also keep in mind that Tails by default starts without internet access
  (and has assistive technology to help you with potential hardware
  keyloggers) so it's actually a perfect quick to use OS for offline
  ad hoc cryptography operations.

<!--

- ### Non-objectives of AdHocSecurebox

(draft)

- Compared to all ideas behind Tor Browser and Tails the AdHocSecurebox
  does not try to "improve online anonymity".
-->

## Tails

AdHocSecurebox v3.0 (and likely future versions) do not have any
particular suggested reading order.

### Overview

#### `bin/`: Tails executable scripts

**See [bin/](bin/)**

Look at the folder [bin/](bin/) for inspirational scripts to add to your
`/home/amnesia/bin`<sup>Amnesic</sup> /
`/live/persistence/TailsData_unlocked/dotfiles/bin`<sup>Persistent</sup>.

#### `directory-structure/`: Example of directory structure

**See [directory-structure/](directory-structure/)**

If you don't plan to read the documentation at [docs/](docs/) and is just browsing
this repository, this is the folder you look around to see potential examples.

These folders are not used for copy or automation (like [bin/](bin/) is). This is
just an documental syntactic sugar.

#### `docs/`: Tails guides by topic

Look at the folder [docs/](docs/) for POSIX scripts and markdown files mean to be read.

#### `dotfiles/example/`

**See [dotfiles/example/](dotfiles/example/)**

The folder [dotfiles/example/](dotfiles/example/) contain examples of dotfiles.

Some, like the [dotfiles/example/rocha/.curlrc](dotfiles/example/rocha/.curlrc)
that help with curl be able to proxy via Tor, may be pertinent to reduce extra
parameters.

### Installation

#### Simple

```bash
git clone https://github.com/fititnt/AdHocSecurebox.git /tmp/bootstrap-tails
# mv /home/amnesia/bin /home/amnesia/bin.bkp
cp -r /tmp/bootstrap-tails/bin /home/amnesia/bin
/home/amnesia/bin/tails-do-it
```

#### Via git

Adapt this to your needs. This is how the author would do after already
have his /home/amnesia/.ssh/id_rsa autorized to connect GitHub.

```bash
# From an already running TailsOS with persistence enabled, run:
mkdir /home/amnesia/Persistent/git ; mkdir /home/amnesia/Persistent/git/fititnt/ ; cd /home/amnesia/Persistent/git/fititnt
git clone https://github.com/fititnt/AdHocSecurebox.git
cd /home/amnesia/Persistent/git/fititnt/AdHocSecurebox
```

### Acknowledgements

#### Official references

- Tails Official documentation: <https://tails.boum.org/doc/>
  - This is less wrong than this repository.

#### Community references

> If you know other references for scripts, send a PR or an e-mail.

- Tails Reddit: <https://www.reddit.com/r/tails/>
- @ChristopherA Tails Dotfiles: <https://github.com/ChristopherA/bash-dotfiles-for-tails>

## Beyond Tails

**See [docs/beyond-tails/](docs/beyond-tails/).**

The initial author also took care to make the public domain individual
scripts as portable as possible <3.

### AppArmor profiles

- **See [apparmor-profiles/](apparmor-profiles/).**
- <https://apparmor.net/>

> Be warned: even the average, non state-sponsored cyber attacks, cannot be
protected by firewalls because something on your computer collect data
and upload (or ask instructions from something outside). (... continue ...)

If you are not using Tails, but still using Linux, AppArmor can be reused
to protect _inside threats_. One typical example is deny access to
very private folders (like `~/.ssh`, `~/.gnupg`)  (... continue ...)

<!--
 _inside threats_

. Think, for example

 Depending of your Linux distribution you
may already be protected by AppArmor. For example: often
[Snap Apps](https://snapcraft.io/) (at least on Ubuntu)

> Note: RHEL/Fedora/CentOS uses SELinux instead of AppArmor.
-->

### Optionated workspace

- [docs/beyond-tails/workspace/](docs/beyond-tails/workspace/).
- [directory-structure/](directory-structure/)

### YubiKey

This is an draft. See [YubiKey on Tails #28](https://github.com/fititnt/AdHocSecurebox/issues/28).

## Reuse of this work

> TODO: write something more explicitly about allow reuse of this work, even
  without credit. (fititnt, 2020-10-26 20:36 UTC)

### License

[![Public Domain](https://i.creativecommons.org/p/zero/1.0/88x31.png)](UNLICENSE)

To the extent possible under law, [Emerson Rocha](https://github.com/fititnt)
has waived all copyright and related or neighboring rights to this work to
[Public Domain](UNLICENSE).
