{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./performance.nix
    ./ffmpeg.nix
    ./desktop.nix
    ./monitor.nix
    ./games.nix
    ./ollama.nix
    ./virtualisation.nix
    ../../system/impermanence.nix
  ];

  # libvirt は magenta 固有のため system/impermanence.nix に含めず個別に宣言する
  environment.persistence."/persist".directories = [ "/var/lib/libvirt" ];

  networking.hostName = "magenta";

  hardware.bluetooth = {
    enable = true;
    settings = {
      General = {
        Experimental = true;
      };
    };
  };
  services.blueman.enable = true;

  users.users.yuro.extraGroups = [
    "networkmanager"
    "wheel"
    "video"
    "render"
  ];
}
