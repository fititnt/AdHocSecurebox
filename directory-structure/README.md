# AdHocSecurebox/directory-structure

> TODO: add some description (fititnt, 2020-11-08 23:23 BRT)

- [generic-linux/](generic-linux): Suggestion of directory structure
  to use on an Non-Tails Linux distributions.
  - `/workspace` (workspace at root /) is open to discussion (and
    maybe worth make it configurable) but the folders inside
    still a good idea to keep.
- [tails-with-persistence/](tails-with-persistence/): directory structure
  if you boot up Tails and unlock Persiscence.
  - `/live/persistence/TailsData_unlocked/Persistent` and
    `/home/amnesia/Persistent/` are paths to same content.
- [tails-without-persistence/](tails-without-persistence): directory structure
  if you start from Tails live USB without persistence and plan to create
  the paths manually.
  - Tip: the quickstart `AdHocSecurebox` example assumes this directory
    structure, but the scripts are made in such way that they could work
    if you have persistence enabled too.