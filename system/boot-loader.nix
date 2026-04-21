{ pkgs, ... }:

{
  # Bootloader.
  boot = {
    loader = {
      systemd-boot.enable = false;

      efi.canTouchEfiVariables = true;

      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
      };
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };
}
