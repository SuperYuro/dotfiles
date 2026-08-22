{ config, pkgs, ... }:

{
  environment.systemPackages = [
    (pkgs.nvtopPackages.amd.override {
      intel = true;
    })
  ];

  home-manager.users.yuro.programs.btop.package = pkgs.btop-rocm;
}
