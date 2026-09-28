{ pkgs, ... }:

{
  networking.networkmanager.enable = true;

  security.sudo.wheelNeedsPassword = false;

  environment.systemPackages = with pkgs; [
    vim
    curl
    wget
    net-tools

    p7zip
  ];

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = true;
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
  };
}
