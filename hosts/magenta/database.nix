{ pkgs, ... }:

{
  imports = [ ../common/database.nix ];

  environment.systemPackages = with pkgs; [
    dbeaver-bin
  ];
}
