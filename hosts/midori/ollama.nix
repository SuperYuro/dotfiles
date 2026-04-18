{ ... }:

{
  services.ollama = {
    enable = true;
    openFirewall = true;
    acceleration = "cuda";
  };
}
