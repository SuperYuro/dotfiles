{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (pkgs.nvtopPackages.amd.override {
      intel = true;
    })
    btop-rocm
  ];
}
