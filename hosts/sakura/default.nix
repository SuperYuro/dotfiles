{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./performance.nix
    ./ollama.nix
    ./open-webui.nix
    ./searx.nix
    ./database.nix
    ./monitor.nix
    ../../system/impermanence.nix
  ];

  networking.hostName = "sakura";

  # impermanence により /var/lib は毎ブートで消えるため永続化
  environment.persistence."/persist".directories = [
    "/var/lib/ollama"
    "/var/lib/open-webui"
    "/var/lib/postgresql"
    "/var/lib/qdrant"
  ];

  users.users.yuro = {
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "render"
    ];
  };

  services.avahi.extraServiceFiles = {
    ssh = "${pkgs.avahi}/etc/avahi/services/ssh.service";
  };
}
