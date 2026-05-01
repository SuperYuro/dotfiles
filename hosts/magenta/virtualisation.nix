{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    podman-compose
    podman-desktop

    dnsmasq
  ];

  programs.virt-manager = {
    enable = true;
  };

  virtualisation = {
    containers.enable = true;
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
    lxc = {
      enable = true;
    };
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
      };
    };
  };

  users.users.yuro.extraGroups = [
    "podman"
    "libvirtd"
  ];
}
