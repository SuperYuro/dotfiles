{ pkgs, ... }:

{
  nixpkgs.config = {
    cudaSupport = true;
  };
}
