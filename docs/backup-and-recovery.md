# Backup and restore strategies of Tails

## Tails Official guides and documentation
At least the following links are a good start if you're looking for official
references

- Backup TailsData: <https://tails.boum.org/doc/first_steps/persistence/backup/index.en.html>
- Restore (rescue) TailsData: <https://tails.boum.org/doc/first_steps/persistence/rescue/index.en.html>

## TailsOS-for-non-whistleblowers scripts

### Backup/restore from USB sticks
These scripts use as reference one of the strategies explained at the time of
writting and implement some extra checks. In short:


- **The backups are encrypted. The replica USB is ready all the times to
  replace the source USB stick. This strategy can work without access to
  internet**
- They assume that only one local copy of TailsData is considered a "source"
(have an empty file `.tailsdata-is-source`) and the rest are "replicas"
(implicitly).
  - If you try to backup to an external USB stick previously marked as an source,
    it will refuse and require manual action.
  - If you try to restore from an USB stick, and your current TailsData_unlocked
    is marked as an source, it will also refuse and require manual action.
  - If you restore from an USB stick that was marked as source, it will allow
    you restore, but show a notice that now you would have two sources
  - Both scripts (in special the one from backup) have suggestion to be
    added to you /home/amnesia/bin path (so you can execute at any time)

> Note: The "source/replica" names are inspired on [MySQL terms to replace old concept of
master/slave terminology](https://en.wikipedia.org/wiki/Master/slave_(technology))).

#### Backup

- Script: [bin/tails-backup-tailsdata-to-usb-stick](../bin/tails-backup-tailsdata-to-usb-stick)

#### Restore

- Script: [bin/tails-backup-tailsdata-to-usb-stick](../bin/tails-backup-tailsdata-to-usb-stick)