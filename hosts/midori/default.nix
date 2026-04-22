{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./ffmpeg.nix
    ./server.nix
    ./monitor.nix
    ./ollama.nix
    ../../system/impermanence.nix
  ];

  networking.hostName = "midori"; # Define your hostname.

  networking.networkmanager.enable = true;

  users.users.yuro = {
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "render"
      "docker"
    ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOfPIHLXZYsZQg6MSDgEXMKegtN6+yOmx/YC5nfuwKBD yuro@midori"
    ];
  };

  security.sudo = {
    wheelNeedsPassword = false;
  };

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    vim
    curl
    wget

    net-tools

    docker-compose
    docker-buildx
  ];

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    nssmdns6 = true;
    openFirewall = true;
    publish = {
      enable = true;
      workstation = true;
      addresses = true;
    };
    extraServiceFiles = {
      ssh = "${pkgs.avahi}/etc/avahi/services/ssh.service";
    };
  };

  virtualisation.docker = {
    enable = true;
  };
}
