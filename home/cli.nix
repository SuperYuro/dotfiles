{ ... }:

{
  programs.lsd = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.bat = {
    enable = true;
  };

  programs.ripgrep = {
    enable = true;
  };

  programs.ripgrep-all = {
    enable = true;
  };

  programs.fd = {
    enable = true;
    hidden = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.vim = {
    enable = true;
    defaultEditor = true;
    settings = {
      background = "dark";
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      tabstop = 2;
    };
  };

  programs.fastfetch = {
    enable = true;
  };

  programs.pandoc = {
    enable = true;
  };

  programs.btop = {
    enable = true;
    settings = {
      update_ms = 100;
      mem_graphs = false;
    };
  };
}
