# nixos/persistence.nix
{ ... }:
{
  environment.persistence."/persist" = {
    hideMounts = true; # mount コマンドで表示されなくなる

    directories = [
      # ネットワーク
      "/etc/NetworkManager/system-connections"

      # システム状態
      "/var/log"
      "/var/lib/nixos" # UID/GID マッピング
      "/var/lib/systemd/coredump"
      "/var/lib/systemd/timers"

      # デスクトップ用途
      "/var/lib/bluetooth" # Bluetooth ペアリング情報
      "/var/lib/cups" # プリンタ設定
      {
        directory = "/var/lib/colord";
        user = "colord";
        group = "colord";
        mode = "u=rwx,g=rx,o=";
      }
    ];

    files = [
      "/etc/machine-id" # systemd のマシン識別子
      # SSH ホストキー（サーバー用途があれば）
      # "/etc/ssh/ssh_host_ed25519_key"
      # "/etc/ssh/ssh_host_ed25519_key.pub"
    ];
  };

  # sudo の講義メッセージをリセットしない（毎起動リセットされるため）
  security.sudo.extraConfig = ''
    Defaults lecture = never
  '';
}
