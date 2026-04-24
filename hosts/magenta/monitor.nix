{ config, pkgs, ... }:

{
  environment.systemPackages = [
    (pkgs.nvtopPackages.amd.override {
      intel = true;
    })
  ];

  home-manager.users.yuro = {
    programs.btop = {
      enable = true;
      package = pkgs.btop-rocm;
      settings = {
        update_ms = 100;
        mem_graphs = false;
      };
    };
  };
}
