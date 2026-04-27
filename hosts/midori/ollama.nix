{
  pkgs,
  lib,
  nixpkgs-unstable,
  ...
}:

let
  unstable = import nixpkgs-unstable {
    system = pkgs.system;
    config.allowUnfree = true;
  };
in
{
  services.ollama = {
    enable = true;
    openFirewall = true;
    package = unstable.ollama-cuda;
  };

  # DynamicUser=true だと /var/lib/private が 0700 必須になり Impermanence と競合するため無効化
  systemd.services.ollama.serviceConfig.DynamicUser = lib.mkForce false;
}
