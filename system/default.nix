{ pkgs, ... }:

{
  imports = [
    ./catppuccin.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  programs.zsh.enable = true;
  environment.pathsToLink = [ "/share/zsh" ];

  programs.nix-ld.enable = true;

  nixpkgs.config.allowUnfree = true;

  users.users.yuro = {
    isNormalUser = true;
    description = "SuperYuro";
    shell = pkgs.zsh;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?
}
