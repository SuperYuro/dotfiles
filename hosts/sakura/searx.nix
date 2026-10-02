{ ... }:

{
  services.searx = {
    enable = true;
    openFirewall = true;
    settings.server = {
      bind_address = "0.0.0.0";
      port = 8888;
    };
  };
}
