# NOTE: このファイルは実機の `nixos-generate-config` 出力ではなく、ThinkPad X260
# (Skylake i5/i7, Intel HD Graphics 520) の一般的な構成から手動で作成したプレースホルダです。
# インストール時は必ず以下を実行し、実機の出力へ差し替えてください:
#   nixos-generate-config --root /mnt
#   diff /mnt/etc/nixos/hardware-configuration.nix hosts/x260/hardware-configuration.nix
{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = [
    "xhci_pci"
    "nvme"
    "ahci"
    "usbhid"
    "usb_storage"
    "sd_mod"
    "sdhci_pci"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";
  };

  environment.systemPackages = with pkgs; [
    libva-utils
  ];

  # tlp (hosts/x260/tlp.nix) にCPUガバナー制御を委譲するため、ここでは固定しない

  hardware = {
    cpu.intel.updateMicrocode = true;

    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        intel-media-driver # iHD VA-API
        intel-vaapi-driver # i965 VA-API（Gen9世代はこちらの方が安定する場合がある）
        vpl-gpu-rt # oneVPL (QSV)
        intel-compute-runtime # Intel OpenCL
      ];
    };
  };
}
