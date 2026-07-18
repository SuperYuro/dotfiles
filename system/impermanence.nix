{ lib, pkgs, ... }:
{
  boot.initrd.supportedFilesystems = [ "btrfs" ];

  # 起動ごとに /root サブボリュームを root-blank から復元してワイプする
  boot.initrd.systemd.services.impermanence-rollback = {
    description = "Rollback BTRFS root subvolume to a pristine state";
    wantedBy = [ "initrd.target" ];
    after = [ "initrd-root-device.target" ]; # LUKS等を使う場合は該当unit
    before = [ "sysroot.mount" ];
    unitConfig.DefaultDependencies = "no";
    serviceConfig.Type = "oneshot";
    path = with pkgs; [
      btrfs-progs
      util-linux
    ];
    script = ''
      mkdir -p /mnt
      mount -t btrfs -o subvol=/ /dev/disk/by-label/nixos /mnt
      btrfs subvolume delete /mnt/root
      btrfs subvolume snapshot /mnt/root-blank /mnt/root
      umount /mnt
    '';
  };

  environment.persistence."/persist" = {
    hideMounts = true;
    directories = [
      "/var/lib/nixos"
      "/etc/NetworkManager/system-connections"
      "/var/lib/bluetooth"
      "/var/lib/systemd/coredump"
      "/var/lib/containers"
      "/var/lib/ollama"
    ];
    files = [
      "/etc/machine-id"
      "/etc/ssh/ssh_host_ed25519_key"
      "/etc/ssh/ssh_host_ed25519_key.pub"
      "/etc/ssh/ssh_host_rsa_key"
      "/etc/ssh/ssh_host_rsa_key.pub"
    ];
  };

  # /etc/shadow はワイプされるため hashedPasswordFile で /persist から読む
  users.mutableUsers = false;
  users.users.yuro.hashedPasswordFile = "/persist/passwords/yuro";
}
