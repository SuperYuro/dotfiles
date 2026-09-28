# dotfiles

## Installation

### Hinotori

Hardware: 
- AMD Ryzen 9 9950X
- AMD Radeon RX 9070XT

Software: 
- LabWC

```console
$ nix shell nixpkgs#git
$ git clone https://github.com/SuperYuro/dotfiles /tmp/dotfiles
$ cd /tmp/dotfiles

$ sudo nix --experimental-features "nix-command flakes" \
    run github:nix-community/disko/latest -- \
    --mode disko ./disko/hinotori.nix

$ sudo nixos-install --flake .#hinotori

# パスワードを /persist に設置（passwd の代わり）
$ sudo mkdir -p /mnt/persist/passwords
$ nix shell nixpkgs#mkpasswd -c 'mkpasswd -m sha-512' \
    | sudo tee /mnt/persist/passwords/yuro
$ sudo chmod 600 /mnt/persist/passwords/yuro

$ sudo reboot
```

### Midori

Hardware:
- Intel Core Ultra 7 270K Plus
- NVIDIA GeForce RTX 5060Ti 16GB

Software:
- Server (headless)

```console
$ nix shell nixpkgs#git
$ git clone https://github.com/SuperYuro/dotfiles /tmp/dotfiles
$ cd /tmp/dotfiles

$ sudo nix --experimental-features "nix-command flakes" \
    run github:nix-community/disko/latest -- \
    --mode disko ./disko/midori.nix

$ sudo nixos-install --flake .#midori

# パスワードを /persist に設置（passwd の代わり）
$ sudo mkdir -p /mnt/persist/passwords
$ nix shell nixpkgs#mkpasswd -c 'mkpasswd -m sha-512' \
    | sudo tee /mnt/persist/passwords/yuro
$ sudo chmod 600 /mnt/persist/passwords/yuro

$ sudo reboot
```

### X260

Hardware:
- Lenovo ThinkPad X260
- Intel Core i5/i7 (Skylake)
- Intel HD Graphics 520

Software:
- Sway

```console
$ nix shell nixpkgs#git
$ git clone https://github.com/SuperYuro/dotfiles /tmp/dotfiles
$ cd /tmp/dotfiles

$ sudo nix --experimental-features "nix-command flakes" \
    run github:nix-community/disko/latest -- \
    --mode disko ./disko/x260.nix

$ sudo nixos-install --flake .#x260

# パスワードを /persist に設置（passwd の代わり）
$ sudo mkdir -p /mnt/persist/passwords
$ nix shell nixpkgs#mkpasswd -c 'mkpasswd -m sha-512' \
    | sudo tee /mnt/persist/passwords/yuro
$ sudo chmod 600 /mnt/persist/passwords/yuro

$ sudo reboot
```

