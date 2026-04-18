{ pkgs, ... }:

let
  # Mochaフレーバー、Mauveアクセントの例
  ctpPkg = pkgs.catppuccin-gtk.override {
    accents = [ "mauve" ];
    size = "standard";
    tweaks = [ "rimless" ];
    variant = "frappe";
  };

  # catppuccin/openbox リポジトリから取得
  catppuccinOpenbox = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "openbox";
    rev = "main";
    hash = "sha256-56da/tjKvFhBbDF6uBau/KMznWIKeCK6jynbRJRkpTc=";
  };

  themePath = "themes/catppuccin-frappe/openbox-3";
in
{
  environment.systemPackages = with pkgs; [
    waybar
    swaybg
    wl-clipboard
    grim
    slurp
    mako
    labwc-tweaks-gtk
    wlr-randr
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

  programs.labwc = {
    enable = true;
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --cmd labwc";
      };
    };
    useTextGreeter = true;
  };

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

  programs.foot = {
    enable = true;
    enableFishIntegration = true;
    theme = "catppuccin-frappe";
    settings = {
      main = {
        shell = "${pkgs.fish}/bin/fish";
        font = "PlemolJP Console NF:size=12";
        line-height = "19px";
        initial-window-size-pixels = "1920x1080";
      };
    };
  };

  home-manager.users.yuro = {
    wayland = {
      windowManager = {
        labwc = {
          enable = true;
          systemd.enable = true;
          autostart = [
            # IMEを起動する
            "fcitx5 -dr"
            # ディスプレイ配置
            " wlr-randr --output DP-6 --mode 1920x1080@60.000000Hz --transform 90 --pos 0,0 --output DP-4 --mode 3440x1440@180.000000Hz --transform normal --pos 1080,240 --output DP-5 --mode 2560x1440@74.968002Hz --transform normal --pos 4520,240"
            # テーマが読み込まれるようにする
            "gsettings set org.gnome.desktop.interface gtk-theme 'catppuccin-frappe-mauve-standard+rimless'"
            "gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'"
            "gsettings set org.gnome.desktop.interface cursor-theme 'catppuccin-frappe-dark-cursors'"
          ];
          environment = [
            "GTK_IM_MODULE=fcitx"
            "QT_IM_MODULE=fcitx"
            "XMODIFIERS=@im=fcitx"
            "XKB_DEFAULT_OPTIONS=ctrl:swapcaps"
          ];
          rc = {
            theme = {
              name = "catppuccin-frappe";
              font = {
                "@name" = "Noto Sans CJK JP";
                "@size" = "10";
              };
            };
            keyboard = {
              default = true;
              keybind = [
                {
                  "@key" = "A-Space";
                  action = {
                    "@name" = "Execute";
                    "@command" = "fuzzel";
                  };
                }
                # [Print] → 全画面スクリーンショット（ファイル保存）
                {
                  "@key" = "Print";
                  action = {
                    "@name" = "Execute";
                    command = "sh -c 'mkdir -p ~/Pictures/Screenshots && grim ~/Pictures/Screenshots/$(date +%Y-%m-%d_%H-%M-%S).png'";
                  };
                }
                # [Win+Shift+S] → 領域選択してクリップボードへ（Windows風）
                {
                  "@key" = "W-S-s";
                  action = {
                    "@name" = "Execute";
                    command = ''sh -c 'grim -g "$(slurp)" - | wl-copy' '';
                  };
                }
                # [Win+Print] → 領域選択してファイル保存
                {
                  "@key" = "W-Print";
                  action = {
                    "@name" = "Execute";
                    command = ''sh -c 'mkdir -p ~/Pictures/Screenshots && grim -g "$(slurp)" ~/Pictures/Screenshots/$(date +%Y-%m-%d_%H-%M-%S).png' '';
                  };
                }
              ];
            };
          };
        };
      };
    };
    programs.fuzzel = {
      enable = true;
      settings = {
        main = {
          terminal = "${pkgs.foot}/bin/foot";
          layer = "overlay";
          font = "Noto Sans Mono CJK JP:size=10";
          width = 250;
        };
      };
    };

    # GTKテーマ設定（GTK2/3）
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

    # Wayland/LabWC向け環境変数
    home.sessionVariables = {
      GTK_THEME = "catppuccin-frappe-mauve-standard+rimless";
      # QT5向け（任意）
      QT_STYLE_OVERRIDE = "kvantum";
    };

    # gsettingsでダークモードを宣言（GTKアプリが参照する）
    dconf.settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        gtk-theme = "catppuccin-frappe-mauve-standard+rimless";
        cursor-theme = "catppuccin-frappe-dark-cursors";
        cursor-size = 24;
      };
    };
    xdg.dataFile."${themePath}".source = "${catppuccinOpenbox}/themes/catppuccin-frappe/openbox-3";
  };

  # Install firefox.
  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
    languagePacks = [ "ja" ];
    policies = {
      AppAutoUpdate = false;
      BackgroundAppUpdate = false;
      DisplayMenuBar = "never";
    };
    preferences = {
      "browser.uidensity" = 1;
      "browser.backspace_action" = 0;
      "sidebar.revamp" = true;
      "browser.cache.disk.enable" = false;
      "browser.cache.memory.enable" = true;
      "browser.cache.memory.capacity" = -1;
      "browser.sessionstore.interval" = 3600000;
      "extensions.picket.enabled" = false;
      "full-screen-api.warning.timeout" = 0;
    };
  };

  programs.thunderbird = {
    enable = true;
  };

  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
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
