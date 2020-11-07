# TailsOS-for-non-whistleblowers v3.0
**Rocha's playground for [Tails - The Amnesic Incognito Live System](https://tails.boum.org/). Work in progress.**

How to do it?

```bash
git clone https://github.com/fititnt/TailsOS-for-non-whistleblowers.git /tmp/bootstrap-tails
# mv /home/amnesia/bin /home/amnesia/bin.bkp
cp -r /tmp/bootstrap-tails/bin /home/amnesia/bin
/home/amnesia/bin/tails-do-it
```

See also [Beyond Tails](#beyond-tails).

---

**Table of Contents**

<!-- TOC -->

- [TailsOS-for-non-whistleblowers v3.0](#tailsos-for-non-whistleblowers-v30)
    - [Overview](#overview)
        - [`bin/`: tails executable scripts](#bin-tails-executable-scripts)
        - [`docs/`: tails guides by topic](#docs-tails-guides-by-topic)
        - [`dotfiles/example/`](#dotfilesexample)
    - [Installation](#installation)
        - [Simple](#simple)
        - [Via git](#via-git)
    - [Acknowledgements](#acknowledgements)
        - [Official references](#official-references)
        - [Community references](#community-references)
- [Beyond Tails](#beyond-tails)
    - [AppArmor profiles](#apparmor-profiles)
    - [Optionated workspace](#optionated-workspace)
    - [YubiKey](#yubikey)
- [Reuse of this work](#reuse-of-this-work)
    - [License](#license)

<!-- /TOC -->

---

## Overview

### `bin/`: tails executable scripts

Look at the folder [bin/](bin/) for inspirational scripts to add to your
`/home/amnesia/bin`<sup>Amnesic</sup> /
`/live/persistence/TailsData_unlocked/dotfiles/bin`<sup>Persistent</sup>.

### `docs/`: tails guides by topic

Look at the folder [docs/](docs/) for POSIX scripts and markdown files mean to be read.

### `dotfiles/example/`

- [dotfiles/example/](dotfiles/example/)

The folder [dotfiles/example/](dotfiles/example/) contain examples of dotfiles.

Some, like the [dotfiles/example/rocha/.curlrc](dotfiles/example/rocha/.curlrc) that help with curl
be able to proxy via Tor, may be pertinent to reduce extra parameters.

## Installation

### Simple

```bash
git clone https://github.com/fititnt/TailsOS-for-non-whistleblowers.git /tmp/bootstrap-tails
# mv /home/amnesia/bin /home/amnesia/bin.bkp
cp -r /tmp/bootstrap-tails/bin /home/amnesia/bin
/home/amnesia/bin/tails-do-it
```

### Via git

Adapt this to your needs. This is how the author would do after already
have his /home/amnesia/.ssh/id_rsa autorized to connect GitHub.

```bash
# From an already running TailsOS with persistence enabled, run:
mkdir /home/amnesia/Persistent/git ; mkdir /home/amnesia/Persistent/git/fititnt/ ; cd /home/amnesia/Persistent/git/fititnt
git clone https://github.com/fititnt/TailsOS-for-non-whistleblowers.git
cd /home/amnesia/Persistent/git/fititnt/TailsOS-for-non-whistleblowers
```

## Acknowledgements

### Official references

- Tails Official documentation: <https://tails.boum.org/doc/>
  - This is less wrong than this repository.

### Community references

> If you know other references for scripts, send a PR or an e-mail.

- Tails Reddit: <https://www.reddit.com/r/tails/>
- @ChristopherA Tails Dotfiles: <https://github.com/ChristopherA/bash-dotfiles-for-tails>

# Beyond Tails
> Note: most of the concepts used on the _Beyond Tails_ are tested on
Ubuntu (more specifically Ubuntu 20.04) but documentation can be reused
as reference for other Linux distributions. The initial author also
took care to make the public domain individual scripts a as portable
as possible <3.

## AppArmor profiles

See [apparmor-profiles/](apparmor-profiles/).

## Optionated workspace

See [docs/ubuntu/workspace/](docs/ubuntu/workspace/)

## YubiKey

This is an draft. See [YubiKey on Tails #28](https://github.com/fititnt/TailsOS-for-non-whistleblowers/issues/28).

# Reuse of this work

> TODO: write something more explicitly about allow reuse of this work, even
  without credit. (fititnt, 2020-10-26 20:36 UTC)

## License

[![Public Domain](https://i.creativecommons.org/p/zero/1.0/88x31.png)](UNLICENSE)

To the extent possible under law, [Emerson Rocha](https://github.com/fititnt)
has waived all copyright and related or neighboring rights to this work to
[Public Domain](UNLICENSE).
