{ ... }:

{
  imports = [ ../common/virtualisation.nix ];

  # services.prometheus = {
  #   exporters = {
  #     libvirt = {
  #       enable = true;
  #       openFirewall = true;
  #     };
  #   };
  # };
}
