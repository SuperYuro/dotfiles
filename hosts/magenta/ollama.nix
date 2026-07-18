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
{
  services.ollama = {
    enable = true;
    openFirewall = true;
    loadModels = [
      #
    ];
    package = unstable.ollama-rocm;
  };

  # DynamicUser=true だと /var/lib/private が 0700 必須になり Impermanence と競合するため無効化
  systemd.services.ollama.serviceConfig.DynamicUser = lib.mkForce false;

  # Impermanence で /persist に models ディレクトリがまだ無いと ReadWritePaths= の
  # mount namespace セットアップ自体が失敗する (226/NAMESPACE) ため、StateDirectory に
  # models も含めて起動前に自動作成させる
  systemd.services.ollama.serviceConfig.StateDirectory = lib.mkForce [
    "ollama"
    "ollama/models"
  ];
}
