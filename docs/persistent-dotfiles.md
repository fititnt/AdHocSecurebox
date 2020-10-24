# TailsOS for non whistleblowers: Persistent dotfiles

## TL;DR

> urbandictionary for **Gambiarra**:
>
> A brazilian expression. It basically means to use improvised methods / solutions to solve a problem, with any avaiable material.
> 
> English equivalents would include "McGyverism", "Kludge","Quick Fix", "Alternative Engineering", "Workaround", and so on.

One way to explain the power of Tails Persistent Dotfiles is tell you
that is where you do your Gambiarra. They work like the averange dotfiles for
other operational systems, but since Tails also create symbolik links for any file
there (even if on subfolders) to your home directory, its very weird at first,
but eventually makes sense.

If you just don't plan to do live editing on the dotfiles themselves and
is just preparing for next restart, you may not need to add extra search
paths for binary files.

## Long explanation

> _"The Dotfiles feature is useful to make specific files persistent but not their entire folder._
>
> _On Tails and Linux in general, the name of configuration files often starts with a dot and are sometimes called dotfiles for this reason. The Dotfiles feature of the Persistent Storage makes it easy to persist such "dotfiles", for example ~/.gitconfig or ~/.bashrc._
>
> _As in the previous example, empty folders are ignored. The Dotfiles feature only links files, and not folders, from the Persistent Storage into the Home folder._
>
> ## Official documentation
> - _Tails Doc: Creating and configuring the Persistent Storage > Dotfiles_
>    - <https://tails.boum.org/doc/first_steps/persistence/configure/#index12h2>


- `/live/persistence/TailsData_unlocked/dotfiles/`
  - This is here your dotfiles (and folders) are stored on an TailsData_unlocked
    tails. Any file that you put here **on next Tails startup** will be synliked
    on your home directory.
  - One way to only deploy TailsOS-for-non-whistleblowers/bin files on your
    installation is copy all then to
    `/live/persistence/TailsData_unlocked/dotfiles/bin/` and then restart
    - This works because Tails (and likely several linux distros) on their
      ~/.profile have some option to add to the search path for executables the
      folder ~/bin
      - But remember: Tails will only synlink each individual file at startup
        of tails. If you add **after** tails initialized, they will not be
        on your path.
        - **The reason behind the TailsOS-for-non-whistleblowers add extra
          search paths is because the author adds new files without want
          to wait for a full restart. But in your averange user case you
          may not need it**
- `/media/amnesia/TailsData/dotfiles/`
  - This is the equivalent of dotfiles directory if you're doing backup or
    restore to an external Tails USB stick.
    - As reference, your "Persistent" equivalent from running Tails
      (`~/Persistent` or `/home/amnesia/Persistent`) on an external Tails
      USB stic would be `/media/amnesia/TailsData/Persistent`.