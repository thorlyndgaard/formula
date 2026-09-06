# MansaOS

My NixOS formula


Example installation steps:

_This assumes you are inside a live NixOS iso, active network connection, and ssh keys configured to access the git repository._

- Format driver
  `nix --experimental-features "nix-command flakes" run git+https://git.seikm.com/Seikm/MansaOS#mansao-installer -- format --device "/dev/disk/by-id/ata-KINGSTON_SA400S37960G_50026B77853CCEF7" --swapFileSize "16G" fish--ephemeralEnable true --ephemeralType "btrfs" --mainPartitionSize "740G"`

- Get hardware configuration (optional)
  `sudo nixos-generate-config --no-filesystems --root /mnt`

- Install MansaOS
  `nix --experimental-features "nix-command flakes" run git+https://git.seikm.com/Seikm/MansaOS#mansao-installer -- install --root /mnt --flake .#lux`
