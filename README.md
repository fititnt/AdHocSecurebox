# TailsOS-for-non-whistleblowers
**Rocha's playground for [TailsOS](https://tails.boum.org/). Work in progress.**

```bash
# From an already running TailsOS with persistence enabled, run:
cd /home/amnesia/Persistent
git clone https://github.com/fititnt/TailsOS-for-non-whistleblowers.git
cd /home/amnesia/Persistent/TailsOS-for-non-whistleblowers
```

## Guides

> Tip: Consider check [Tails: Features and included software](https://tails.boum.org/doc/about/features/index.en.html)
  official documentation.

- [docs/git-setup.sh](docs/git-setup.sh)
- [docs/where-is-my-data-on-tails.md](docs/where-is-my-data-on-tails.md)
- [docs/password-manangement.md](docs/password-manangement.md)
- [docs/backup-and-recovery.md](docs/backup-and-recovery.md)
- **VSCode**
  - [docs/vscode-portable-setup.sh](docs/vscode-portable-setup.sh)
  - [docs/vscode-deb-setup.sh](docs/vscode-portable-setup.sh) (not working)
- **Terminal customization (i.e. command line, cli...)**
  - [docs/bash-setup.sh](docs/zsh-setup.sh)
  - [docs/zsh-setup.sh](docs/zsh-setup.sh)
  - [docs/oh-my-zsh-setup.sh](docs/oh-my-zsh-setup.sh)
  - [MVP of Oh My Zsh on TailsOS #5 (external link)](https://github.com/fititnt/TailsOS-for-non-whistleblowers/issues/5)

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

## License

[![Public Domain](https://i.creativecommons.org/p/zero/1.0/88x31.png)](UNLICENSE)

To the extent possible under law, [Emerson Rocha](https://github.com/fititnt)
has waived all copyright and related or neighboring rights to this work to
[Public Domain](UNLICENSE).
