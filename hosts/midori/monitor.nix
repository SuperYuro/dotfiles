{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.nvtopPackages.nvidia
  ];

  home-manager.users.yuro.programs.btop.package = pkgs.btop-cuda;
}
