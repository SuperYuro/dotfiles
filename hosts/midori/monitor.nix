{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nvtopPackages.nvidia
  ];

  home-manager.users.yuro = {
    programs.btop = {
      enable = true;
      package = pkgs.btop-cuda;
      settings = {
        update_ms = 100;
        mem_graphs = false;
      };
    };
  };
}
