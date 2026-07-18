{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./performance.nix
    ./tlp.nix
    ./desktop.nix
    ../../system/impermanence.nix
  ];

  networking.hostName = "x260";

  hardware.bluetooth.enable = true;

  # 蓋を閉じたらサスペンド
  services.logind.settings.Login = {
    HandleLidSwitch = "suspend";
    HandleLidSwitchExternalPower = "suspend";
    HandleLidSwitchDocked = "ignore";
  };

  users.users.yuro.extraGroups = [
    "networkmanager"
    "wheel"
    "video"
    "render"
  ];
}
