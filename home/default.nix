{ pkgs, ... }:

{
  imports = [
    ./catppuccin.nix
    ./shell.nix
    ./starship.nix
    ./git.nix
    ./tmux.nix
    ./yt-dlp.nix
    ./cli.nix
    ./claude.nix
  ];

  home.username = "yuro";
  home.homeDirectory = "/home/yuro";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    nixfmt
    dust
    ghq
  ];
}
