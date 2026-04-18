{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./locale.nix
    ./boot-loader.nix
    ./ffmpeg.nix
    ./desktop.nix
    ./monitor.nix
    ./games.nix
  ];

  networking.hostName = "magenta"; # Define your hostname.

  networking.networkmanager.enable = true;

  users.users.yuro.extraGroups = [
    "networkmanager"
    "wheel"
    "video"
    "render"
    "docker"
  ];

  security.sudo = {
    wheelNeedsPassword = false;
  };

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    vim
    curl
    wget

    docker-compose
    docker-buildx
  ];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

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
  };

  virtualisation.docker = {
    enable = true;
  };
}
