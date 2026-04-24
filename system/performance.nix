{ ... }:

{
  services.scx.enable = true;

  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 50;
  };

  systemd.oomd.enable = true; # zramのロックアップ防止

  boot.kernel.sysctl = {
    "vm.swappiness" = 150; # zram swapを使うのであればこのぐらい
  };

  boot.tmp.useTmpfs = true;
}
