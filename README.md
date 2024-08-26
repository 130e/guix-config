# My Nonguix Config
Personal guix system config with non gnu packages. Here are the install notes for myself.

## INSTALL
### Preparation
* Download nonguix install image from [nonguix](https://gitlab.com/nonguix/nonguix).
* Create USB install medium from the image.
* Boot into installer. Adjust PC BIOS setting if needed to enable USB boot and disable secure boot.
### Nonguix install
* Proceed with graphical install guide and stop at the final step, reviewing configuration. (if no warning of unsupported hardware than the device doesn't need nonguix firmware and this guide)
* Switch to TTY3. Use git/wget to download this repo.
* Update nonguix channels for installer. 

```
# cp channels.scm ~/.config/guix/
# guix pull && hash guix
```

This might take a long time if the install image from nonguix is old

guix describe (check if channels are there. If not, switch to a new TTY and login again)

* Compare the current config.scm with /mnt/etc/config.scm 

(Ideally /mnt should already be mounted, if not, mount /mnt, /mnt/efi, etc. according to your config)

Change the disk UUID, user names in this repo config.scm according to generated config (/mnt/etc/config.scm)

* Replace the config.scm in /mnt/etc/config.scm. Copy the channels.scm to /mnt/etc/ just for backup

* (optional) Add substitutes from nonguix so we don't need to compile the linux kernel locally. Use wget to download the public key and authorize the key.

* Install
```
# guix system init /mnt/etc
```


## Reference
* [Systemcrafter](https://systemcrafters.net/craft-your-system-with-guix)
* [nonguix](https://gitlab.com/nonguix/nonguix)

