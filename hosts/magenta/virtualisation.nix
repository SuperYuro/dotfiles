{ pkgs, ... }:

{
  imports = [ ../common/virtualisation.nix ];

  environment.systemPackages = with pkgs; [
    podman-desktop

    dnsmasq
  ];

  programs.virt-manager = {
    enable = true;
  };

  virtualisation = {
    lxc = {
      enable = true;
    };
  };

  users.users.yuro.extraGroups = [
    "podman"
    "libvirtd"
  ];
}
