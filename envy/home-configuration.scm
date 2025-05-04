;; This "home-environment" file can be passed to 'guix home reconfigure'
;; to reproduce the content of your profile.  This is "symbolic": it only
;; specifies package names.  To reproduce the exact same profile, you also
;; need to capture the channels being used, as returned by "guix describe".
;; See the "Replicating Guix" section in the manual.

(use-modules (gnu home)
             (gnu home services)
             (gnu home services desktop)
             (gnu home services fontutils)
             (gnu home services guix)
             (gnu home services shells)
             (gnu home services shepherd)
             (gnu home services sound)
             (gnu home services ssh)
             (gnu home services syncthing)
             (gnu home services xdg)
             (gnu packages)
             (gnu packages admin)
             (gnu services)
             (guix channels)
             (guix gexp))

(home-environment
 ;; Below is the list of packages that will show up in your
 ;; Home profile, under ~/.guix-home/profile.
 (packages (specifications->packages (list
                                      ;; Fonts
                                      "font-google-noto"
                                      "font-google-noto-sans-cjk"
                                      "font-google-noto-emoji"
                                      "font-nerd-noto" ;; saayix
                                      "font-nerd-fira-code" ;; saayix
                                      "font-nerd-space-mono" ;; saayix
                                      ;; Desktop essentials
                                      "hyprland"
                                      "xdg-desktop-portal-hyprland" ;; FIXME
                                      "hyprcursor" ;; FIXME
                                      "hypridle"
                                      "hyprlock"
                                      "waybar" ;; wl status bar
                                      "grimshot" ;; hypr screenshot
                                      "wl-clipboard" ;; else some apps have issues
                                      "dunst" ;; desktop notify
                                      "wofi" ;; simple launcher
                                      "pavucontrol" ;; GUI audio control
                                      "pamixer" ;; cmd control
                                      "blueman" ;; FIXME
                                      "brightnessctl"
                                      "swww" ;; gif wp
                                      ;; Input method
                                      "fcitx5"
                                      "fcitx5-configtool"
                                      "fcitx5-rime"
                                      ;; GUI utils
                                      "keepassxc"
                                      "thunar"
                                      "wireshark"
                                      ;; Themes
                                      "flat-remix-gtk-theme"
                                      "bibata-cursor-theme"
                                      "papirus-icon-theme"
                                      "neofetch"
                                      ;; Browsers and Medias
                                      "librewolf"
                                      "ungoogled-chromium-wayland" ;; TODO: old version, why?
                                      "ublock-origin-chromium"
                                      "icedove-wayland" ;; thunderbird
                                      "irssi"
                                      "mpv"
                                      "swappy" ;; image edit & docking
                                      "imv"
                                      "sioyek"
                                      ;; Compression
                                      "unzip"
                                      "unrar-free"
                                      "xz"
                                      "bzip2" ;; Not must have since tar can directly extract
                                      ;; CLI utils
                                      "btop"
                                      "fd" ;; TODO: learn
                                      "file"
                                      "openssh"
                                      "ripgrep"
                                      "tree"
                                      ;; Code
                                      "gcc-toolchain"
                                      "clang"
                                      "libtool"
                                      "libvterm"
                                      "cmake"
                                      "make"
                                      "markdown"
                                      "python"
                                      "perl"
                                      "tidy-html"
                                      "shellcheck"
                                      "node"
                                      ;; Term and editor
                                      "kitty"
                                      "neovim"
                                      ;; Emacs pill
                                      "emacs-pgtk-xwidgets"
                                      ;; Nix
                                      "nix"
                                      )))
 ;; Below is the list of Home services.  To search for available
 ;; services, run 'guix home search KEYWORD' in a terminal.
 (services
  (list
   (service home-dbus-service-type)
   (service home-pipewire-service-type)
   ;; (service home-shepherd-service-type)
   (service home-syncthing-service-type
            (for-home
             (syncthing-configuration
              (user "oar")))) ;; Default user is root for some reason
   (service home-bash-service-type
            (home-bash-configuration
             (aliases '(("l" . "ls -ahl")))
             (guix-defaults? #t)))
   (service home-fish-service-type
            (home-fish-configuration
             (aliases '(("l" . "ls -ahl")))))
   (service home-shepherd-service-type)
   ;; FIXME: stablize your config before symlinking
   ;; (simple-service 'xdg-configs-service
   ;;                 home-xdg-configuration-files-service-type
   ;;                 ;; -> ~/.guix-home/files/.config/
   ;;                 ;; -> $XDG_CONFIG_DIR/ (by symlink-manager)
   ;;                 ;; FIXME: manual download a current-theme.conf (not symlinked)
   ;;                 `(("kitty/kitty.conf" ,(local-file "dotfiles/kitty/kitty.conf"))
   ;;                   ("hypr/hyprland.conf" ,(local-file "dotfiles/hypr/hyprland.conf"))
   ;;                   ("waybar/config.jsonc" ,(local-file "dotfiles/waybar/config.jsonc"))
   ;;                   ("waybar/style.css" ,(local-file "dotfiles/waybar/style.css"))))
   (simple-service 'variant-packages-service
                   home-channels-service-type
                   (list
                    (channel
                     (name 'nonguix)
                     (url "https://gitlab.com/nonguix/nonguix")
                     (introduction
                      (make-channel-introduction
                       "897c1a470da759236cc11798f4e0a5f7d4d59fbc"
                       (openpgp-fingerprint
                        "2A39 3FFF 68F4 EF7A 3D29  12AF 6F51 20A0 22FB B2D5"))))
                    (channel
                     (name 'saayix)
                     (branch "main")
                     (url "https://codeberg.org/look/saayix")
                     (introduction
                      (make-channel-introduction
                       "12540f593092e9a177eb8a974a57bb4892327752"
                       (openpgp-fingerprint
                        "3FFA 7335 973E 0A49 47FC  0A8C 38D5 96BE 07D3 34AB"))))
                    (channel
                     (name 'rosenthal)
                     (url "https://codeberg.org/hako/rosenthal.git")
                     (branch "trunk")
                     (introduction
                      (make-channel-introduction
                       "7677db76330121a901604dfbad19077893865f35"
                       (openpgp-fingerprint
                        "13E7 6CD6 E649 C28C 3385  4DF5 5E5A A665 6149 17F7"))))))
   ))
 ;; End of services
 )
;; End of home-environment
