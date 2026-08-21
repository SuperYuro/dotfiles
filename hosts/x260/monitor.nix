{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.nvtopPackages.intel
  ];
}
