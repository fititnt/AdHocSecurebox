# TailsOS for non whistleblowers: How to install custom binaries on Tails

**Please read [docs/persistent-dotfiles.md](persistent-dotfiles.md).
This other document explain what already is not common to other linux systems**.

If you do not want to read everyting, consider copy the pertinent files from
[../bin/](../bin/) (this git repository) to the path
`/live/persistence/TailsData_unlocked/dotfiles/bin`<sup>Persistent</sup>
and then restart Tails. The expected result will be this:

```bash
amnesia@amnesia:~$ echo $PATH
/home/amnesia/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games
amnesia@amnesia:~$ example.sh
This is an example
amnesia@amnesia:~$ sudo example.sh
[sudo] password for amnesia: 
sudo: example.sh: command not found
amnesia@amnesia:~$ sudo /home/amnesia/bin/example.sh
[sudo] password for amnesia: 
This is an example
```