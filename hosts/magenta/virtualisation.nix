{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    docker-compose
    docker-buildx

    dnsmasq
  ];

  programs.virt-manager = {
    enable = true;
  };

  virtualisation.docker = {
    enable = true;
  };

  virtualisation.libvirtd = {
    enable = true;

    qemu = {
      swtpm.enable = true;
    };
  };

  users.users.yuro.extraGroups = [
    "docker"
    "libvirtd"
  ];
}
