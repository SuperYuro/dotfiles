{ pkgs, ... }:

{
  services.ollama = {
    enable = true;
    # iGPU (Radeon 780M) 用の Vulkan ビルド
    package = pkgs.ollama-vulkan;
  };
}
