{ ... }:
{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/nvme0n1";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              size = "512M";
              type = "EF00"; # EFI System Partition
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [
                  "fmask=0022"
                  "dmask=0022"
                ];
              };
            };
            root = {
              size = "100%"; # 残り全部
              content = {
                type = "btrfs";
                extraArgs = [
                  "-L"
                  "nixos"
                  "-f"
                ]; # ラベル "nixos" を付与
                postCreateHook = ''
                  MNTPOINT=$(mktemp -d)
                  mount -t btrfs -o subvol=/ /dev/disk/by-label/nixos "$MNTPOINT"
                  trap 'umount "$MNTPOINT"; rm -rf "$MNTPOINT"' EXIT
                  btrfs subvolume snapshot -r "$MNTPOINT/root" "$MNTPOINT/root-blank"
                '';
                subvolumes = {
                  "/root" = {
                    mountpoint = "/";
                    mountOptions = [
                      "subvol=root"
                      "compress=zstd"
                      "noatime"
                    ];
                  };
                  "/home" = {
                    mountpoint = "/home";
                    mountOptions = [
                      "subvol=home"
                      "compress=zstd"
                      "noatime"
                    ];
                  };
                  "/nix" = {
                    mountpoint = "/nix";
                    mountOptions = [
                      "subvol=nix"
                      "compress=zstd"
                      "noatime"
                    ];
                  };
                  "/persist" = {
                    mountpoint = "/persist";
                    mountOptions = [
                      "subvol=persist"
                      "compress=zstd"
                      "noatime"
                    ];
                  };
                  "/log" = {
                    mountpoint = "/var/log";
                    mountOptions = [
                      "subvol=log"
                      "compress=zstd"
                      "noatime"
                    ];
                  };
                };
              };
            };
          };
        };
      };
    };
  };

  # disko が fileSystems を自動生成するが、
  # neededForBoot だけは追記が必要
  fileSystems."/persist".neededForBoot = true;
  fileSystems."/var/log".neededForBoot = true;

  fileSystems."/mnt/backup" = {
    device = "/dev/disk/by-uuid/9e8dda81-979c-403c-b078-c42721ba78b5";
    fsType = "xfs";
    options = [
      "defaults"
      "nofail"
      "noatime"
    ];
  };
}
