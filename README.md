# TailsOS-for-non-whistleblowers
Rocha's playground for TailsOS (https://tails.boum.org/). Not really useful for others, it's just me playing around a OS.

```
cd /home/amnesia/Persistent
git clone https://github.com/fititnt/TailsOS-for-non-whistleblowers.git
cd /home/amnesia/Persistent/TailsOS-for-non-whistleblowers
```

Lets Install VSCode portable.

```
# @see https://code.visualstudio.com/docs/editor/portable
wget https://go.microsoft.com/fwlink/?LinkID=620884 -O /tmp/vscode.tar.gz
cd /home/amnesia/Persistent
tar -vzxf /tmp/vscode.tar.gz
cd /home/amnesia/Persistent/VSCode-linux-x64
# Create data/ folder (this, with exeption of temp files on /tmp) will store extensions, configs, etc
mkdir data/

# To update, just move data/ folder for a new, downloaded vscode.

# Needs --no-sandbox, see https://github.com/microsoft/vscode/issues/81056
/home/amnesia/Persistent/VSCode-linux-x64/code --no-sandbox

```


## See also

### Guides, informations, etc
- <https://github.com/patrick-blom/dive-into-tails>
- <https://tails.boum.org/doc/first_steps/persistence/configure/index.en.html>

### Alternative OSs
- https://www.qubes-os.org/

## TODO
1. Restart from my main OS on Tails and Commit from there

## License

[![Public Domain](https://i.creativecommons.org/p/zero/1.0/88x31.png)](UNLICENSE)

To the extent possible under law, [Emerson Rocha](https://github.com/fititnt)
has waived all copyright and related or neighboring rights to this work to
[Public Domain](UNLICENSE).
