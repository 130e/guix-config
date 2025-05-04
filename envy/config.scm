;; This is an operating system configuration generated
;; by the graphical installer.
;;
;; Once installation is complete, you can learn and modify
;; this file to tweak the system configuration, and pass it
;; to the 'guix system reconfigure' command to effect your
;; changes.


;; Indicate which modules to import to access the variables
;; used in this configuration.
(use-modules (gnu)
             (nongnu packages linux)
             (nongnu system linux-initrd))
(use-service-modules cups desktop networking ssh xorg pm admin)

(operating-system
 (kernel linux)
 (initrd microcode-initrd)
 (firmware (list linux-firmware))
 (locale "en_US.utf8")
 (timezone "America/Los_Angeles")
 (keyboard-layout (keyboard-layout "us"))
 (host-name "EnvySea")

 ;; The list of user accounts ('root' is implicit).
 (users (cons* (user-account
                 (name "oar")
                 (comment "Oarfish")
                 (group "users")
                 (home-directory "/home/oar")
                 (supplementary-groups '("wheel" "netdev" "audio" "video" "lp")))
               %base-user-accounts))
 (sudoers-file   (plain-file "sudoers" "\
root ALL=(ALL) ALL
%wheel ALL=(ALL) NOPASSWD: ALL\n"))
 ;; Packages installed system-wide.  Users can also install packages
 ;; under their own account: use 'guix search KEYWORD' to search
 ;; for packages and 'guix install PACKAGE' to install a package.
 ;; TODO: Check what are base-packages
 (packages (append (list (specification->package "git-minimal")
                         (specification->package "curl")
                         (specification->package "vim")
                         (specification->package "openssh")
                         (specification->package "bluez")
                         (specification->package "bluez-alsa")) %base-packages))

 ;; Below is the list of system services.  To search for available
 ;; services, run 'guix system search KEYWORD' in a terminal.
 ;; Desktop services enable some useful utilities services by default.
 ;; https://guix.gnu.org/manual/en/html_node/Desktop-Services.html
 (services (append (list (service bluetooth-service-type
                                  (bluetooth-configuration
                                   (name "EnvySea")
                                   (auto-enable? #t)
                                   (experimental #t))) ;; Allow some more bluetooth features
                         (service tlp-service-type) ;; laptop battery management
                         (service file-database-service-type) ;; updatedb once/week
                         (service package-database-service-type)) ;; guix updatedb once/week
                   (modify-services %desktop-services
                                    (delete gdm-service-type) ;; gdm is enabled by default
                                    ;; Add non-guix substitutes to skip building kernel locally
                                    (guix-service-type config => (guix-configuration
                                                                  (inherit config)
                                                                  (substitute-urls
                                                                   (append (list "https://substitutes.nonguix.org")
                                                                           %default-substitute-urls))
                                                                  (authorized-keys
                                                                   ;;(append (list (local-file "./non-guix.pub"))
                                                                   (append (list (plain-file "non-guix.pub"
                                                                                             "(public-key (ecc \
(curve Ed25519) (q #C1FD53E5D4CE971933EC50C9F307AE2171A2D3B52C804642A7A35F84F3A4EA98#)))"))
                                                                           %default-authorized-guix-keys)))))))
 (bootloader (bootloader-configuration
              (bootloader grub-efi-bootloader)
              (targets (list "/boot/efi"))
              (keyboard-layout keyboard-layout)))
 (swap-devices (list (swap-space
                      (target (uuid
                               "7e4e1cb3-472e-484d-b589-71cc06c22f42")))))

 ;; The list of file systems that get "mounted".  The unique
 ;; file system identifiers there ("UUIDs") can be obtained
 ;; by running 'blkid' in a terminal.
 (file-systems (cons* (file-system
                       (mount-point "/boot/efi")
                       (device (uuid "8571-B900"
                                     'fat32))
                       (type "vfat"))
                      (file-system
                       (mount-point "/")
                       (device (uuid
                                "b551eca4-4364-4f92-942f-f49bc6239a7f"
                                'ext4))
                       (type "ext4")) %base-file-systems)))
