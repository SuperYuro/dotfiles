{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.nvtopPackages.amd
  ];

  home-manager.users.yuro.programs.btop.package = pkgs.btop-rocm;
}
