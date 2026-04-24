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

  networking.hostName = "magenta"; # Define your hostname.

  networking.networkmanager.enable = true;

  users.users.yuro.extraGroups = [
    "networkmanager"
    "wheel"
    "video"
    "render"
  ];

  security.sudo = {
    wheelNeedsPassword = false;
  };

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    vim
    curl
    wget

    net-tools
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
}
