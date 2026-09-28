{ ... }:

{
  services.tlp = {
    enable = true;
    settings = {
      # バッテリー充電閾値（旧 old/laptop/tlp/30battery-threshold.conf を移植）
      START_CHARGE_THRESH_BAT0 = 70;
      STOP_CHARGE_THRESH_BAT0 = 80;
      START_CHARGE_THRESH_BAT1 = 85;
      STOP_CHARGE_THRESH_BAT1 = 90;

      # 旧 old/laptop/tlp/30performance.conf を移植
      SATA_LINKPWR_ON_BAT = "max_performance";

      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 0;
    };
  };

  # tlpのradio/power management機能と衝突するため無効化
  networking.networkmanager.wifi.powersave = false;
  services.power-profiles-daemon.enable = false;
}
