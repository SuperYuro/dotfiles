{ pkgs, ... }:

let
  # Mochaフレーバー、Mauveアクセントの例
  ctpPkg = pkgs.catppuccin-gtk.override {
    accents = [ "mauve" ];
    size = "standard";
    tweaks = [ "rimless" ];
    variant = "frappe";
  };
in
{
  environment.systemPackages = with pkgs; [
    swaybg
    swayidle
    swaylock
    wlopm
    wl-clipboard
    grim
    slurp
    mako

    vlc
  ];

  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      fcitx5-gtk
    ];
  };

  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      plemoljp-nf
    ];
    fontconfig = {
      defaultFonts = {
        serif = [ "Noto Serif CJK JP" ];
        sansSerif = [ "Noto Sans CJK JP" ];
        monospace = [ "Noto Sans Mono CJK JP" ];
      };
    };
  };

  security.pam.services.swaylock = { };

  security.rtkit = {
    enable = true;
  };
  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse = {
      enable = true;
    };
  };

  home-manager.users.yuro = {
    # GTKテーマ設定(GTK2/3)
    gtk.gtk4.theme = null;
    gtk = {
      enable = true;
      theme = {
        name = "catppuccin-frappe-mauve-standard+rimless";
        package = ctpPkg;
      };
      # アイコンはcatppuccin.gtk.iconが設定するので省略可
      cursorTheme = {
        name = "catppuccin-frappe-dark-cursors";
        package = pkgs.catppuccin-cursors.frappeDark;
        size = 24;
      };
    };

    # Wayland向け環境変数
    home.sessionVariables = {
      GTK_THEME = "catppuccin-frappe-mauve-standard+rimless";
      # QT5向け(任意)
      QT_STYLE_OVERRIDE = "kvantum";
    };

    # gsettingsでダークモードを宣言(GTKアプリが参照する)
    dconf.settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        gtk-theme = "catppuccin-frappe-mauve-standard+rimless";
        cursor-theme = "catppuccin-frappe-dark-cursors";
        cursor-size = 24;
      };
    };
  };

  programs.thunderbird = {
    enable = true;
  };

  programs.thunar = {
    enable = true;
    plugins = with pkgs; [
      thunar-archive-plugin
      thunar-volman
    ];
  };
  programs.xfconf.enable = true;

  services.gvfs = {
    enable = true;
  };
  services.tumbler = {
    enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = "gtk";
  };

  # gsettingsが動作するためにdconf有効化
  programs.dconf.enable = true;
}
