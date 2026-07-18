{ pkgs, nixpkgs-unstable, ... }:

let
  unstable = import nixpkgs-unstable {
    system = pkgs.stdenv.hostPlatform.system;
    config.allowUnfree = true;
  };

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
    swaybg
    swayidle
    swaylock
    wlopm
    wl-clipboard
    grim
    slurp
    mako
    wlr-randr

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

  programs.labwc = {
    enable = true;
    package = unstable.labwc;
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

  programs.foot = {
    enable = true;
    enableZshIntegration = true;
    theme = "catppuccin-frappe";
    settings = {
      main = {
        font = "PlemolJP Console NF:size=13";
        line-height = "19px";
        initial-window-size-pixels = "1920x1080";
        pad = "5x5 center";
      };
    };
  };

  home-manager.users.yuro = {
    wayland = {
      windowManager = {
        labwc = {
          enable = true;
          package = unstable.labwc;
          systemd.enable = true;
          autostart = [
            # IMEを起動する
            "fcitx5 -dr"

            # ディスプレイ配置
            "wlr-randr --output DP-6 --mode 1920x1080@60.000000Hz --transform 90 --pos 0,0 --output DP-4 --mode 3440x1440@180.000000Hz --transform normal --pos 1080,240 --output DP-5 --mode 2560x1440@74.968002Hz --transform normal --pos 4520,240"

            # テーマが読み込まれるようにする
            "gsettings set org.gnome.desktop.interface gtk-theme 'catppuccin-frappe-mauve-standard+rimless'"
            "gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'"
            "gsettings set org.gnome.desktop.interface cursor-theme 'catppuccin-frappe-dark-cursors'"

            # 壁紙
            "swaybg -m fill -i ${pkgs.nixos-artwork.wallpapers.nineish-catppuccin-frappe}/share/backgrounds/nixos/nix-wallpaper-nineish-catppuccin-frappe.png &"

            "waybar &"
          ];
          environment = [
            "GTK_IM_MODULE=fcitx"
            "QT_IM_MODULE=fcitx"
            "XMODIFIERS=@im=fcitx"
            "XKB_DEFAULT_OPTIONS=ctrl:swapcaps"
          ];
          rc = {
            desktops = {
              names.name = [
                "1"
                "2"
                "3"
                "4"
                "5"
                "6"
              ];
              popupTime = 1000;
            };
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
                # =========================================
                # ウィンドウ管理
                # =========================================

                # Alt+F4 → ウィンドウを閉じる
                {
                  "@key" = "A-F4";
                  action."@name" = "Close";
                }
                # Win+↑ → 最大化トグル
                {
                  "@key" = "W-Up";
                  action."@name" = "ToggleMaximize";
                }
                # Win+↓ → 最小化
                {
                  "@key" = "W-Down";
                  action."@name" = "Minimize";
                }
                # Win+← → 左半分にスナップ
                {
                  "@key" = "W-Left";
                  action = {
                    "@name" = "SnapToEdge";
                    direction = "left";
                  };
                }
                # Win+→ → 右半分にスナップ
                {
                  "@key" = "W-Right";
                  action = {
                    "@name" = "SnapToEdge";
                    direction = "right";
                  };
                }
                # Win+Shift+← → 左のモニターへ移動
                {
                  "@key" = "W-S-Left";
                  action = {
                    "@name" = "MoveToOutput";
                    direction = "left";
                  };
                }
                # Win+Shift+→ → 右のモニターへ移動
                {
                  "@key" = "W-S-Right";
                  action = {
                    "@name" = "MoveToOutput";
                    direction = "right";
                  };
                }
                # Win+D → デスクトップを表示/非表示
                {
                  "@key" = "W-d";
                  action."@name" = "ToggleShowDesktop";
                }

                # =========================================
                # アプリ起動
                # =========================================

                # Win+R → fuzzel（「ファイル名を指定して実行」相当）
                {
                  "@key" = "W-r";
                  action = {
                    "@name" = "Execute";
                    command = "fuzzel";
                  };
                }
                # Win+E → thunar（エクスプローラー相当）
                {
                  "@key" = "W-e";
                  action = {
                    "@name" = "Execute";
                    command = "thunar";
                  };
                }
                # Win+L → swaylock（ロック画面）
                {
                  "@key" = "W-l";
                  action = {
                    "@name" = "Execute";
                    command = "swaylock";
                  };
                }
                # Alt+Space → fuzzel（アプリランチャー）
                {
                  "@key" = "A-Space";
                  action = {
                    "@name" = "Execute";
                    command = "fuzzel";
                  };
                }

                # =========================================
                # 仮想デスクトップ
                # =========================================

                # Win+Ctrl+← → 前の仮想デスクトップ
                {
                  "@key" = "W-C-Left";
                  action = {
                    "@name" = "GoToDesktop";
                    to = "left";
                  };
                }
                # Win+Ctrl+→ → 次の仮想デスクトップ
                {
                  "@key" = "W-C-Right";
                  action = {
                    "@name" = "GoToDesktop";
                    to = "right";
                  };
                }
                # Win+Ctrl+Shift+← → ウィンドウを前のデスクトップへ
                {
                  "@key" = "W-C-S-Left";
                  action = {
                    "@name" = "SendToDesktop";
                    to = "left";
                  };
                }
                # Win+Ctrl+Shift+→ → ウィンドウを次のデスクトップへ
                {
                  "@key" = "W-C-S-Right";
                  action = {
                    "@name" = "SendToDesktop";
                    to = "right";
                  };
                }

                # Win+1〜6 → ワークスペース直接切り替え
                {
                  "@key" = "W-1";
                  action = {
                    "@name" = "GoToDesktop";
                    to = "1";
                  };
                }
                {
                  "@key" = "W-2";
                  action = {
                    "@name" = "GoToDesktop";
                    to = "2";
                  };
                }
                {
                  "@key" = "W-3";
                  action = {
                    "@name" = "GoToDesktop";
                    to = "3";
                  };
                }
                {
                  "@key" = "W-4";
                  action = {
                    "@name" = "GoToDesktop";
                    to = "4";
                  };
                }
                {
                  "@key" = "W-5";
                  action = {
                    "@name" = "GoToDesktop";
                    to = "5";
                  };
                }
                {
                  "@key" = "W-6";
                  action = {
                    "@name" = "GoToDesktop";
                    to = "6";
                  };
                }

                # =========================================
                # スクリーンショット（既存設定）
                # =========================================

                # Print → 全画面スクリーンショット（ファイル保存）
                {
                  "@key" = "Print";
                  action = {
                    "@name" = "Execute";
                    command = "sh -c 'mkdir -p ~/Pictures/Screenshots && grim ~/Pictures/Screenshots/$(date +%Y-%m-%d_%H-%M-%S).png'";
                  };
                }
                # Win+Shift+S → 領域選択してクリップボードへ
                {
                  "@key" = "W-S-s";
                  action = {
                    "@name" = "Execute";
                    command = ''sh -c 'grim -g "$(slurp)" - | wl-copy' '';
                  };
                }
                # Win+Print → 領域選択してファイル保存
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

    services.swayidle = {
      enable = true;
      timeouts = [
        {
          timeout = 600;
          command = "${pkgs.wlopm}/bin/wlopm --off '*'";
          resumeCommand = "${pkgs.wlopm}/bin/wlopm --on '*'";
        }
      ];
    };

    programs.waybar = {
      enable = true;
      settings = [
        {
          output = [
            "DP-4"
            "DP-5"
          ];
          layer = "top";
          position = "bottom";
          height = 30;
          modules-left = [
            "ext/workspaces"
            "wlr/taskbar"
          ];
          modules-center = [ ];
          modules-right = [
            "cpu"
            "memory"
            "tray"
            "clock"
          ];

          "ext/workspaces" = {
            format = "{name}";
            on-click = "activate";
            sort-by-name = true;
          };
          "wlr/taskbar" = {
            sort-by-app-id = true;
            format = "{icon} {title}";
            on-click = "activate";
          };

          "cpu" = {
            interval = 1;
            format = " {usage}%";
          };
          "memory" = {
            interval = 1;
            format = " {used:0.1f}G/{total:0.1f}G";
          };
          "tray" = {
            icon-size = 16;
            spacing = 8;
          };
          "clock" = {
            interval = 1;
            format = " {:%H:%M:%S}";
            format-alt = " {:%Y-%m-%d %a}";
            tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          };
        }
      ];
      style = ''
        * {
          font-family: "PlemolJP Console NF", monospace;
          font-size: 13px;
          min-height: 0;
          border: none;
          border-radius: 0;
          box-shadow: none;
        }

        window#waybar {
          background-color: #232634;
          color: #c6d0f5;
        }

        #workspaces {
          margin: 3px 4px;
          padding: 0;
          background-color: transparent;
        }

        #workspaces button {
          padding: 2px 8px;
          margin: 2px 2px;
          background-color: #303446;
          color: #a5adce;
          border-radius: 5px;
          min-width: 24px;
          transition: all 0.15s ease;
        }

        #workspaces button:hover {
          background-color: #414559;
          color: #c6d0f5;
        }

        #workspaces button.active {
          background-color: #8caaee;
          color: #303446;
          font-weight: bold;
        }

        #workspaces button.urgent {
          background-color: #e78284;
          color: #303446;
        }

        #taskbar {
          margin: 3px 4px;
          background-color: transparent;
        }

        #taskbar button {
          padding: 2px 6px;
          margin: 2px 2px;
          background-color: #303446;
          color: #c6d0f5;
          border-radius: 5px;
          transition: all 0.15s ease;
        }

        #taskbar button:hover {
          background-color: #414559;
        }

        #taskbar button.active {
          background-color: #51576d;
        }

        #clock {
          padding: 2px 12px;
          margin: 3px 4px;
          background-color: #303446;
          color: #babbf1;
          border-radius: 5px;
          font-weight: bold;
        }

        #cpu,
        #memory,
        #tray {
          padding: 2px 10px;
          margin: 3px 2px;
          background-color: #303446;
          border-radius: 5px;
        }

        #cpu {
          color: #e5c890;
        }

        #memory {
          color: #a6d189;
        }

        #tray {
          color: #c6d0f5;
          margin-right: 6px;
        }

        #tray > .passive {
          -gtk-icon-effect: dim;
        }

        #tray > .needs-attention {
          -gtk-icon-effect: highlight;
          background-color: #ef9f76;
        }
      '';
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
      "browser.tabs.inTitlebar" = 0;
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
