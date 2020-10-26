# TailsOS-for-non-whistleblowers/less-wrong.md

1. **The official Tails documentation is less wrong than this repository.**
2. **The official Tails documentation and usage with friendly GUIs instead
   of kung-fu scripting is likely to be less complex than use this repository**
    - Do not blame Tails because this repository seems make things hard.
3. **Most warnings when using Tails that you will see are there for an reason
   and are directed for their end users.**
    - You may not care because of your threat model or because you are just
      testing an OS to run on untrusted hardware, not-so-friendly internet
     or to deal with offline cryptographic operations
4. **Tails can run from crappy cheap USB sticks resonable fine compared to
   most live Linux Distros**
    - As reference, the tests made by the initial author where made on a
      4 USD dolar, 64GB USB stick (around 25MB/s read, 5-7MB/s write) from
      Aliexpress. (free shipping)
    - Take this as reference (an consider that the initial author
      intentionally was doing stress tests and trying to break things)
      before blame Tails.
5. **Tails, if have to fail, is likely to in ways that actually protect
   security and privacy**
    - User don't have option to create non-encrypted persistance. Tails
      itself may be singe 1.2GB file unencrypted, but near everyting else
      user create would be either on RAM or encrypted.
6. **Crappy cheap USB sticks can fail. But if they do, is likely to be on
   writte operations but is more likely than not possible to recover**
    - If you is implementing custom software, consider running from RAM
      and rsync back to disc from time to time. This not only will be
      faster but make your USB lasts longer.
        - Not all sofware use /tmp. For example
          `docs/vscode-portable-setup.sh` freeze sometimes if running not
          from RAM.
