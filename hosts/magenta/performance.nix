{ ... }:

{
  # デスクトップ用途向けのCPUスケジューラ
  services.scx = {
    enable = true;
    scheduler = "scx_bpfland";
  };

  # zramへのswap
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 50;
  };

  systemd.oomd.enable = true; # zramのロックアップ防止

  boot.kernel.sysctl = {
    "vm.swappiness" = 150; # zram swapを使うのであればこのぐらい
  };

  # tmpfsを使う
  boot.tmp = {
    useTmpfs = true;
  };
}
