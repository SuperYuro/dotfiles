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

# 実機のディスクデバイス名を確認し、disko/x260.nix の device が
# 実機と異なる場合（SATA接続なら /dev/sda 等）は修正する
$ lsblk

$ sudo nix --experimental-features "nix-command flakes" \
$   run github:nix-community/disko/latest -- \
$   --mode disko ./disko/x260.nix

$ sudo nixos-install --flake .#x260

# hosts/x260/hardware-configuration.nix はプレースホルダのため、
# 実機の nixos-generate-config 出力に必ず差し替える
$ sudo nixos-generate-config --root /mnt
$ diff /mnt/etc/nixos/hardware-configuration.nix hosts/x260/hardware-configuration.nix
# ↑を見ながら hosts/x260/hardware-configuration.nix を更新し、
#   Intel graphics 向け extraPackages 等の手動追記を再度マージする
# その後 nixos-install --flake .#x260 を再実行する

# パスワードを /persist に設置（passwd の代わり）
$ sudo mkdir -p /mnt/persist/passwords
$ nix shell nixpkgs#mkpasswd -c 'mkpasswd -m sha-512' \
$   | sudo tee /mnt/persist/passwords/yuro
$ sudo chmod 600 /mnt/persist/passwords/yuro

$ sudo reboot
```

