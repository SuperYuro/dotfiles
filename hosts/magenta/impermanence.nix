# nixos/impermanence.nix
{ ... }:
{
  # initrd で root を毎起動リセットする systemd サービス
  boot.initrd.systemd.enable = true;
  boot.initrd.systemd.services.rollback = {
    description = "Rollback BTRFS root to blank snapshot";
    wantedBy = [ "initrd.target" ];
    before = [ "sysroot-var-lib-nixos.mount" ];
    after = [ "sysroot.mount" ];
    unitConfig.DefaultDependencies = "no";
    serviceConfig.Type = "oneshot";
    script = ''
      mkdir -p /btrfs_tmp
      mount /dev/disk/by-label/nixos -o subvol=/ /btrfs_tmp

      if [[ -e /btrfs_tmp/@ ]]; then
        mkdir -p /btrfs_tmp/old_roots
        timestamp=$(date --date="@$(stat -c %Y /btrfs_tmp/@)" "+%Y-%m-%d_%H:%M:%S")
        mv /btrfs_tmp/@ "/btrfs_tmp/old_roots/$timestamp"
      fi

      btrfs subvolume create /btrfs_tmp/@
      umount /btrfs_tmp
    '';
  };
}
