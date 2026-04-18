# dotfiles

## Installation

### Magenta

Hardware: 
- Intel Core Ultra 7 270K Plus
- AMD Radeon RX 9070XT

Software: 
- LabWC

```console
$ nix shell nixpkgs#git
$ git clone https://github.com/SuperYuro/dotfiles /tmp/dotfiles
$ cd /tmp/dotfiles

$ sudo nix --experimental-features "nix-command flakes" \
$   run github:nix-community/disko/latest -- \
$   --mode disko ./disko/magenta.nix

$ sudo nixos-install --flake .#magenta

$ sudo nixos-enter --root /mnt
$ passwd yuro
$ exit

$ sudo reboot
```

