# TailsOS-for-non-whistleblowers
Rocha's playground for TailsOS (https://tails.boum.org/). Not really useful for others, it's just me playing around a OS.

```bash
cd /home/amnesia/Persistent
git clone https://github.com/fititnt/TailsOS-for-non-whistleblowers.git
cd /home/amnesia/Persistent/TailsOS-for-non-whistleblowers

```

Lets Install VSCode portable.

```bash
# @see https://code.visualstudio.com/docs/editor/portable
wget https://go.microsoft.com/fwlink/?LinkID=620884 -O /tmp/vscode.tar.gz
cd /home/amnesia/Persistent
tar -vzxf /tmp/vscode.tar.gz
cd /home/amnesia/Persistent/VSCode-linux-x64
# Create data/ folder (this, with exeption of temp files on /tmp) will store extensions, configs, etc
mkdir data/

# To update, just move data/ folder for a new, downloaded vscode.

# Needs --no-sandbox, see https://github.com/microsoft/vscode/issues/81056
/home/amnesia/Persistent/VSCode-linux-x64/code --no-sandbox --disable-gpu

# Open directory with vscode (from Pen drive)
/home/amnesia/Persistent/VSCode-linux-x64/code --no-sandbox --disable-gpu /home/amnesia/Persistent/TailsOS-for-non-whistleblowers

# Copy VSCode to ram to improve performance
cp -r /home/amnesia/Persistent/VSCode-linux-x64/ /home/amnesia/Desktop
/home/amnesia/Desktop/VSCode-linux-x64/code --no-sandbox /home/amnesia/Persistent/TailsOS-for-non-whistleblowers

# TODO: fix issue `Error: net::ERR_CONNECTION_REFUSED` on VSCode when trying to check for extensions (fititnt, 2020-10-16 18:17 BRT)
```

## See also

### Guides, informations, etc
- <https://github.com/patrick-blom/dive-into-tails>
- <https://tails.boum.org/doc/first_steps/persistence/configure/index.en.html>

### Alternative OSs
- https://www.qubes-os.org/

## TODO
1. <s>Restart from my main OS on Tails and Commit from there</s>
2. Do commits via git, and not via GitHub web interface
3. Fix issue `Error: net::ERR_CONNECTION_REFUSED` on VSCode when trying to check for extensions
4. When 2 is solved, divide on this project in different scripts

## License

[![Public Domain](https://i.creativecommons.org/p/zero/1.0/88x31.png)](UNLICENSE)

To the extent possible under law, [Emerson Rocha](https://github.com/fititnt)
has waived all copyright and related or neighboring rights to this work to
[Public Domain](UNLICENSE).
