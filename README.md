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

# パスワードを /persist に設置（passwd の代わり）
$ sudo mkdir -p /mnt/persist/passwords
$ nix shell nixpkgs#mkpasswd -c 'mkpasswd -m sha-512' \
$   | sudo tee /mnt/persist/passwords/yuro
$ sudo chmod 600 /mnt/persist/passwords/yuro

$ sudo reboot
```

### Midori

Hardware:
- AMD CPU
- NVIDIA GPU

Software:
- Server (headless)

```console
$ nix shell nixpkgs#git
$ git clone https://github.com/SuperYuro/dotfiles /tmp/dotfiles
$ cd /tmp/dotfiles

$ sudo nix --experimental-features "nix-command flakes" \
$   run github:nix-community/disko/latest -- \
$   --mode disko ./disko/midori.nix

$ sudo nixos-install --flake .#midori

# パスワードを /persist に設置（passwd の代わり）
$ sudo mkdir -p /mnt/persist/passwords
$ nix shell nixpkgs#mkpasswd -c 'mkpasswd -m sha-512' \
$   | sudo tee /mnt/persist/passwords/yuro
$ sudo chmod 600 /mnt/persist/passwords/yuro

$ sudo reboot
```

