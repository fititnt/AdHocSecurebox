# TailsOS for non whistleblowers: Where is my data on TailsOS?

> _**Explain Like I'm Five**: If have "Persistence" or "persistence" on the
path to the folder, the files saved there will will Persist when restart the
Tails._

## Too Long; Didin`t Read

> Note: this TL;DR was written by someone who just started to test Tails and
  wanted to keep some notes to self. This part may contain errors, and even
  if people could send pull requests, on this type of topic, people are less
  likely to do it. When in doubt, check the
  [Official documentation](#official-documentation).

- Tails is the *The Amnesic Incognito Live System*. This means that by default
  it will **NOT _save_** (aka "Persist") on reboot if you do not enable
    Persistence.
  - And even if you enable persistence:
      - It will not necessary save everyting except if you explicitly choose to.
        If you don't configure it right, the files are saved on the memory RAM.
      - On next reboot you can choose to not unlock your drive and just use
        software that already is installed
          - Or, if you don't Unlock your Persistent partition, but define
            an administrator password, you can install software. But these
            softwares, downloads, etc, are granted to not Persist on reboot.
- The **Persistent partition** (the "place where you can save your stuff", not
  the downloaded operational system), **created by Tails will be encrypted**.
    - Is possible to create additional layers of protection, but for the
      more-than-averange user it's already decent.
    - If you [Threat model](https://en.wikipedia.org/wiki/Threat_model) really
      need, even worst case scenario (e.g. not sure if downloaded from the
      right place) or someone very skilled had access to your pen-drive, you
      could use one Live installation of Tails to download another Tails,
      check the files fingerprints, and then migrate to another installation
      only your Persistent data.
- Your persistent data have two "main directories", one more focused for
  averange user see, and another that really have the data.
    - `/home/amnesia/Persistent`: 
    - `/live/persistence/TailsData_unlocked`: all data from Persistent volume
      (includes bdata from `/home/amnesia/Persistent` and all other data
      that averange user don't usually touch, but if you're reading this,
      you're likely to like that directory)
- `/live/persistence/TailsData_unlocked/persistence.conf`: this file is used
   by Tails to know how persistence is configured.


## Official documentation

- <https://tails.boum.org/doc/first_steps/persistence/index.en.html>
- <https://tails.boum.org/doc/first_steps/persistence/configure/index.en.html>
- <https://tails.boum.org/doc/first_steps/persistence/warnings/index.en.html>
- LUKS vs VeraCrypt? <https://tails.boum.org/doc/encryption_and_privacy/encrypted_volumes/index.en.html>

## Community content on the topic

- <https://gist.github.com/mc2pw/aeb4ca3972fea54d4858>
- <https://github.com/patrick-blom/dive-into-tails>