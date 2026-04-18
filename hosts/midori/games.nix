{ pkgs, nixpkgs-unstable, ... }:

let
  unstable = import nixpkgs-unstable {
    system = pkgs.system;
    config.allowUnfree = true;
  };
in
{
  services.minecraft-server = {
    enable = true;
    package = unstable.minecraft-server;

    eula = true;
    openFirewall = true;

    serverProperties = {
      difficulty = 2;
      gamemode = 0;
      max-players = 1;
      motd = "Private Minecraft Server";
    };

    jvmOpts = "-Xms2048M -Xmx4096M -XX:+UseG1GC";
  };
}
