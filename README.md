# TailsOS-for-non-whistleblowers v2.0
**Rocha's playground for [Tails - The Amnesic Incognito Live System](https://tails.boum.org/). Work in progress.**

How to do it?

```bash
git clone https://github.com/fititnt/TailsOS-for-non-whistleblowers.git /tmp/bootstrap-tails
# mv /home/amnesia/bin /home/amnesia/bin.bkp
cp -r /tmp/bootstrap-tails/bin /home/amnesia/bin
/home/amnesia/bin/tails-do-it
```

---

**Table of Contents**

<!-- TOC depthfrom:1 -->

- [TailsOS-for-non-whistleblowers v2.0-rc1](#tailsos-for-non-whistleblowers-v20-rc1)
    - [Overview](#overview)
        - [bin/: tails executable scripts](#bin-tails-executable-scripts)
        - [docs/: tails guides by topic](#docs-tails-guides-by-topic)
        - [wwdotfiles/example/](#wwdotfilesexample)
    - [Installation](#installation)
        - [Simple](#simple)
        - [Via git](#via-git)
    - [Acknowledgements](#acknowledgements)
        - [Official references](#official-references)
        - [Community references](#community-references)
- [Reuse of this work](#reuse-of-this-work)
    - [License](#license)

<!-- /TOC -->

---

## Overview

### [`bin/`: tails executable scripts](bin/)

Look at the folder [bin/](bin/) for inspirational scripts to add to your
`/home/amnesia/bin`<sup>Amnesic</sup> /
`/live/persistence/TailsData_unlocked/dotfiles/bin`<sup>Persistent</sup>.

### [`docs/`: tails guides by topic](docs/)

Look at the folder [docs/](docs/) for POSIX scripts and markdown files mean to be read.

### [wwdotfiles/example/](dotfiles/example/)

- [dotfiles/example/](dotfiles/example/)

The folder [dotfiles/example/](dotfiles/example/) contain examples of dotfiles.

Some, like the [dotfiles/example/rocha/.curlrc](dotfiles/example/rocha/.curlrc) that help with curl
be able to proxy via Tor, may be pertinent to reduce extra parameters.

<!--

  ## Rocha to-do list
In addition to [fititnt/TailsOS-for-non-whistleblowers/issues](https://github.com/fititnt/TailsOS-for-non-whistleblowers/issues):

1. <s>Restart from my main OS on Tails and Commit from there</s>
2. <s>Do commits via git, and not via GitHub web interface</s>
3. Fix issue `Error: net::ERR_CONNECTION_REFUSED` on VSCode when trying to check for extensions
4. <s>When 2 is solved, divide on this project in different scripts</s>
5. Send e-mail with Tunderbird
6. Send e-mail with Tunderbird, but now encrypted
7. Persistence: keep changes on Wallpaper (yes, TailsOS by default clean everyting)
8. <s>Persistence: remember (or re-insert on demand) `config --global user.name/user.email`</s>
9. Discover how to customize Keyboard layout to Brazilian ABNT (the one with `ç`)

-->

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


# Reuse of this work

> TODO: write something more explicitly about allow reuse of this work, even
  without credit. (fititnt, 2020-10-26 20:36 UTC)

## License

[![Public Domain](https://i.creativecommons.org/p/zero/1.0/88x31.png)](UNLICENSE)

To the extent possible under law, [Emerson Rocha](https://github.com/fititnt)
has waived all copyright and related or neighboring rights to this work to
[Public Domain](UNLICENSE).
