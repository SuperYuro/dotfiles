{ pkgs, ... }:

{
  environment.systemPackages = [
    (pkgs.llama-cpp.override {
      rocmSupport = true;
      vulkanSupport = true;
    })
  ];
}
