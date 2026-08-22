{
  pkgs,
  lib,
  nixpkgs-unstable,
  ...
}:

let
  unstable = import nixpkgs-unstable {
    system = pkgs.stdenv.hostPlatform.system;
    config.allowUnfree = true;
  };
in
import ../common/ollama.nix {
  inherit lib;
  package = unstable.ollama-cuda;
}
