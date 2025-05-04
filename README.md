# My guix Config

Config source template for setting up guix systems. Use nonguix packages as well. 

I have configs for two systems.
- QEMU VM. Simple, dev purpose.
- Laptop ENVY x360. Riced desktop setup with hyprland and waybar, no longer maintained. Probably doesn't work as well as it uses a few non-guix channels and packages. Keep here for reference.

## INSTALL guix on free hardware

I deploy this in QEMU VM. (WIP)

1. Check guix official manual, section `3.8 Installing Guix in a Virtual Machine`.
2. Install guix from iso using graphical installer.


## INSTALL on non-free hardware (deprecated)

Tested with my laptop at 2024. 

### Preparation
- Download nonguix install image from [nonguix](https://gitlab.com/nonguix/nonguix).
- Create USB install medium from the image.
- Boot into installer. Adjust PC BIOS setting if needed to enable USB boot and disable secure boot.
### Nonguix install
- Proceed with graphical install guide and stop at the final step, reviewing configuration. (if no warning of unsupported hardware than the device doesn't need nonguix firmware and this guide)
- Switch to TTY3. Use git/wget to download this repo.
- Update nonguix channels for installer. 
  ```sh
  cp channels.scm ~/.config/guix/
  guix pull && hash guix
  ```
  This might take a while if the install image from nonguix is old.

- `guix describe` (check if channels are there. If not, switch to a new TTY and login again).

- Mount partitions (Ideally /mnt should already be mounted, if not, mount /mnt, /mnt/efi, etc. according to your config)

- Compare the current config.scm with `/mnt/etc/config.scm`. Change the disk UUID, user names in this repo config.scm according to generated config (/mnt/etc/config.scm)

- Replace the config.scm in /mnt/etc/config.scm. Copy the channels.scm to /mnt/etc/ just for backup

- (Optional) Add substitutes from nonguix so we don't need to compile the linux kernel locally. Use wget to download the public key and authorize the key.

- Install `guix system init /mnt/etc`


## Reference
- [Systemcrafter](https://systemcrafters.net/craft-your-system-with-guix)
- [nonguix](https://gitlab.com/nonguix/nonguix)

