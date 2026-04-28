{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./performance.nix
    ./ffmpeg.nix
    ./server.nix
    ./monitor.nix
    ./ollama.nix
    ./virtualisation.nix
    ../../system/impermanence.nix
  ];

  networking.hostName = "midori";

  users.users.yuro = {
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "render"
      "podman"
    ];
  };

  services.avahi.extraServiceFiles = {
    ssh = "${pkgs.avahi}/etc/avahi/services/ssh.service";
  };
}
