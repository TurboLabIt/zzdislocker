# zzdislocker

A simple wrapper script to make [dislocker](https://github.com/Aorimn/dislocker) usable by non-geeks. Tested on Ubuntu/Lubuntu 17.10 and later.

**Parli italiano?** » Leggi: [Guida a Bitlocker con Ubuntu: come leggere/scrivere le chiavette USB con dislocker](https://turbolab.it/crittografia-945/guida-bitlocker-ubuntu-come-leggere-scrivere-chiavette-usb-dislocker-1587)


# Install

Just execute:

```shell
sudo apt install curl -y && curl -s https://raw.githubusercontent.com/TurboLabIt/zzdislocker/master/setup.sh | sudo bash

````


# Run it

Connect your Bitlocker-drive, let it spin for a minute, then execute `zzdislocker`.

Provide the Bitlocker password when asked.

Your drive will then be mounted into `/media/dislocker/MYDRIVE/` and popup into the GUI.

Wen you're done, close everything and unmount the drive with a single command: `zzundislocker`.

# Password saving

If your main Linux partition is itself encrypted, you can store your Bitlocker password for automatic unlocking and additional convenience. Copy the provided sample configuration file (`zzdislocker.default.conf`) to your own `zzdislocker.conf` and set `BITLOCKER_PASSWORD=myBitlockerPassword`:

`sudo cp /usr/local/turbolab.it/zzdislocker/zzdislocker.default.conf /etc/turbolab.it/zzdislocker.conf && sudo nano /etc/turbolab.it/zzdislocker.conf`

Please note that this is a big security risk: be sure to know what you're doing.
