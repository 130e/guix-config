(list (channel
        (name 'guix)
        (url "https://git.savannah.gnu.org/git/guix.git")
        (branch "master")
        (introduction
          (make-channel-introduction
            "9edb3f66fd807b096b48283debdcddccfea34bad"
            (openpgp-fingerprint
              "BBB0 2DDF 2CEA F6A8 0D1D  E643 A2A0 6DF2 A33A 54FA"))))
      (channel
        (name 'nonguix)
        (url "https://gitlab.com/nonguix/nonguix")
        (branch "master")
        (introduction
          (make-channel-introduction
            "897c1a470da759236cc11798f4e0a5f7d4d59fbc"
            (openpgp-fingerprint
              "2A39 3FFF 68F4 EF7A 3D29  12AF 6F51 20A0 22FB B2D5"))))
      (channel
        (name 'saayix)
        (url "https://codeberg.org/look/saayix")
        (branch "main")
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
              "13E7 6CD6 E649 C28C 3385  4DF5 5E5A A665 6149 17F7"))))
      (channel
        (name 'nebula)
        (url "https://git.sr.ht/~apoorv569/nebula")
        (branch "master")
        (introduction
          (make-channel-introduction
            "2f1be757b40f78456220823b71aace5277c5f33d"
            (openpgp-fingerprint
              "53B4 8418 D76A 3EF1 1BCC  92A8 4FDB 05CF 5D67 6283")))))
