{ ... }:

{
  services.minecraft-server = {
    enable = true;
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
