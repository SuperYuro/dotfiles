{ lib, ... }:

{
  # scx_bpfland等のデスクトップ向け低遅延スケジューラはバッテリー駆動ノートPCの
  # 省電力特性と相性が悪いため無効化し、tlp + カーネルデフォルトスケジューラに委譲する
  services.scx.enable = lib.mkForce false;

  # X260は主流構成のRAM容量が少ないため、system/performance.nixのデフォルト(50%)より控えめにする
  # 実機のRAM容量確認後、必要に応じて調整すること
  zramSwap.memoryPercent = lib.mkForce 30;
}
