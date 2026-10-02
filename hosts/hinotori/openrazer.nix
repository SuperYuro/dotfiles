{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    openrazer-daemon
    polychromatic
  ];

  hardware.openrazer = {
    enable = true;
  };

  users.users.yuro.extraGroups = [ "openrazer" ];
}
