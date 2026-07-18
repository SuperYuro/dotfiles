{ pkgs, nixpkgs-unstable, ... }:

let
  unstable = import nixpkgs-unstable {
    system = pkgs.stdenv.hostPlatform.system;
    config.allowUnfree = true;
  };
in
{
  environment.systemPackages = [
    (unstable.ffmpeg-full.override (import ../../lib/ffmpeg-flags.nix { gpu = "amd"; }))
  ];
}
