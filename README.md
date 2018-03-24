# zzdislocker

A simple wrapper script to make [dislocker](https://github.com/Aorimn/dislocker) usable by non-geeks. Tested on Ubuntu/Lubuntu 17.10 and later.

**Parli italiano?** » Leggi: [Guida a Bitlocker con Ubuntu: come leggere/scrivere le chiavette USB con dislocker](https://turbolab.it/crittografia-945/guida-bitlocker-ubuntu-come-leggere-scrivere-chiavette-usb-dislocker-1587)


# Install
Just execute:

`curl -s https://raw.githubusercontent.com/TurboLabIt/zzdislocker/master/setup.sh | sudo sh`


# Run it
Connect your Bitlocker-drive, let it spin for a minute, then execute `zzdislocker`.

Provide the Bitlocker password when asked.

Your drive will then be mounted into `/media/mount/` and popup into the GUI.
