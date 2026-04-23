{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    docker-compose
    docker-buildx
  ];

  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      swtpm = {
        enable = true;
      };
    };
  };

  # services.prometheus = {
  #   exporters = {
  #     libvirt = {
  #       enable = true;
  #       openFirewall = true;
  #     };
  #   };
  # };

  virtualisation.docker = {
    enable = true;
  };
}
