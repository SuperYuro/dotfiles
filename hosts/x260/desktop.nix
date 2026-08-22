{ pkgs, lib, ... }:

let
  # Mochaフレーバー、Mauveアクセントの例
  ctpPkg = pkgs.catppuccin-gtk.override {
    accents = [ "mauve" ];
    size = "standard";
    tweaks = [ "rimless" ];
    variant = "frappe";
  };

  mod = "Mod4";
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
    brightnessctl

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

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --cmd sway";
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
        font = "PlemolJP Console NF:size=11";
        line-height = "17px";
        initial-window-size-pixels = "1280x720";
        pad = "5x5 center";
        initial-color-theme = "dark";
      };
      colors-dark = {
        alpha = "0.8";
        alpha-mode = "matching";
        blur = "yes";
      };
    };
  };

  home-manager.users.yuro = {
    wayland.windowManager.sway = {
      enable = true;
      package = pkgs.sway;
      systemd.enable = true;
      wrapperFeatures.gtk = true;

      config = {
        modifier = mod;
        terminal = "foot";
        menu = "fuzzel";

        # ウィンドウ枠の配色。foot/bar/GTKと同じCatppuccin Frappe、
        # アクセントはGTKテーマ(mauve)に合わせる
        colors = {
          background = "#303446"; # base
          focused = {
            border = "#ca9ee6"; # mauve
            background = "#ca9ee6";
            text = "#232634"; # crust
            indicator = "#ca9ee6";
            childBorder = "#ca9ee6";
          };
          focusedInactive = {
            border = "#414559"; # surface0
            background = "#414559";
            text = "#c6d0f5"; # text
            indicator = "#414559";
            childBorder = "#414559";
          };
          unfocused = {
            border = "#232634"; # crust
            background = "#232634";
            text = "#a5adce"; # subtext0
            indicator = "#232634";
            childBorder = "#232634";
          };
          urgent = {
            border = "#e78284"; # red
            background = "#e78284";
            text = "#232634";
            indicator = "#e78284";
            childBorder = "#e78284";
          };
          placeholder = {
            border = "#232634";
            background = "#232634";
            text = "#c6d0f5";
            indicator = "#232634";
            childBorder = "#232634";
          };
        };

        # X260は内蔵ディスプレイ(eDP-1)のみ。外部出力を使う場合はここに追記する
        output = {
          "eDP-1" = {
            scale = "1";
          };
        };

        input = {
          "type:touchpad" = {
            tap = "enabled";
            natural_scroll = "enabled";
            dwt = "enabled";
            middle_emulation = "enabled";
            scroll_method = "two_finger";
            click_method = "clickfinger";
          };
          # TrackPoint。感度は実機で要調整
          "type:pointer" = {
            pointer_accel = "0.3";
            accel_profile = "adaptive";
          };
          "type:keyboard" = {
            xkb_options = "ctrl:swapcaps";
          };
        };

        keybindings = {
          "${mod}+Return" = "exec foot";
          "${mod}+Shift+q" = "kill";
          "${mod}+d" = "exec fuzzel";

          "${mod}+h" = "focus left";
          "${mod}+j" = "focus down";
          "${mod}+k" = "focus up";
          "${mod}+l" = "focus right";
          "${mod}+Left" = "focus left";
          "${mod}+Down" = "focus down";
          "${mod}+Up" = "focus up";
          "${mod}+Right" = "focus right";

          "${mod}+Shift+h" = "move left";
          "${mod}+Shift+j" = "move down";
          "${mod}+Shift+k" = "move up";
          "${mod}+Shift+l" = "move right";
          "${mod}+Shift+Left" = "move left";
          "${mod}+Shift+Down" = "move down";
          "${mod}+Shift+Up" = "move up";
          "${mod}+Shift+Right" = "move right";

          "${mod}+b" = "splith";
          "${mod}+v" = "splitv";
          "${mod}+e" = "toggle split";

          "${mod}+s" = "layout stacking";
          "${mod}+w" = "layout tabbed";

          "${mod}+space" = "focus mode_toggle";
          "${mod}+a" = "focus parent";

          "${mod}+1" = "workspace number 1";
          "${mod}+2" = "workspace number 2";
          "${mod}+3" = "workspace number 3";
          "${mod}+4" = "workspace number 4";
          "${mod}+5" = "workspace number 5";
          "${mod}+6" = "workspace number 6";
          "${mod}+7" = "workspace number 7";
          "${mod}+8" = "workspace number 8";
          "${mod}+9" = "workspace number 9";
          "${mod}+0" = "workspace number 10";
          "${mod}+Shift+1" = "move container to workspace number 1";
          "${mod}+Shift+2" = "move container to workspace number 2";
          "${mod}+Shift+3" = "move container to workspace number 3";
          "${mod}+Shift+4" = "move container to workspace number 4";
          "${mod}+Shift+5" = "move container to workspace number 5";
          "${mod}+Shift+6" = "move container to workspace number 6";
          "${mod}+Shift+7" = "move container to workspace number 7";
          "${mod}+Shift+8" = "move container to workspace number 8";
          "${mod}+Shift+9" = "move container to workspace number 9";
          "${mod}+Shift+0" = "move container to workspace number 10";

          "${mod}+f" = "fullscreen";
          "${mod}+Shift+space" = "floating toggle";
          "${mod}+Shift+r" = "reload";

          # スクリーンショット
          "Print" =
            ''exec sh -c "mkdir -p ~/Pictures/Screenshots && grim ~/Pictures/Screenshots/$(date +%Y-%m-%d_%H-%M-%S).png"'';
          "${mod}+Shift+s" = ''exec sh -c "grim -g \"$(slurp)\" - | wl-copy"'';
          "${mod}+Print" =
            ''exec sh -c "mkdir -p ~/Pictures/Screenshots && grim -g \"$(slurp)\" ~/Pictures/Screenshots/$(date +%Y-%m-%d_%H-%M-%S).png"'';

          # 輝度・音量（ノートPC向けファンクションキー）
          "--locked XF86MonBrightnessUp" = "exec brightnessctl set 5%+";
          "--locked XF86MonBrightnessDown" = "exec brightnessctl set 5%-";
          "--locked XF86AudioRaiseVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ +5%";
          "--locked XF86AudioLowerVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ -5%";
          "--locked XF86AudioMute" = "exec pactl set-sink-mute @DEFAULT_SINK@ toggle";
          "--locked XF86AudioMicMute" = "exec pactl set-source-mute @DEFAULT_SOURCE@ toggle";
        };

        startup = [
          # IMEを起動する
          { command = "fcitx5 -dr"; }

          # テーマが読み込まれるようにする
          {
            command = "gsettings set org.gnome.desktop.interface gtk-theme 'catppuccin-frappe-mauve-standard+rimless'";
          }
          { command = "gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'"; }
          {
            command = "gsettings set org.gnome.desktop.interface cursor-theme 'catppuccin-frappe-dark-cursors'";
          }

          # 壁紙
          {
            command = "swaybg -m fill -i ${pkgs.nixos-artwork.wallpapers.nineish-catppuccin-frappe}/share/backgrounds/nixos/nix-wallpaper-nineish-catppuccin-frappe.png";
          }
        ];

        bars = [
          {
            position = "bottom";
            statusCommand = "${pkgs.i3status}/bin/i3status";
            fonts = {
              names = [ "PlemolJP Console NF" ];
              size = 10.0;
            };
            colors = {
              background = "#232634";
              statusline = "#c6d0f5";
              separator = "#414559";
              focusedWorkspace = {
                border = "#ca9ee6";
                background = "#ca9ee6";
                text = "#303446";
              };
              activeWorkspace = {
                border = "#303446";
                background = "#303446";
                text = "#c6d0f5";
              };
              inactiveWorkspace = {
                border = "#232634";
                background = "#232634";
                text = "#a5adce";
              };
              urgentWorkspace = {
                border = "#e78284";
                background = "#e78284";
                text = "#303446";
              };
              bindingMode = {
                border = "#e78284";
                background = "#e78284";
                text = "#303446";
              };
            };
          }
        ];

        # 標準resizeモード(h/j/k/l+矢印、${mod}+r)はhome-managerのswayモジュールが
        # デフォルトで提供する。10%刻みリサイズとmod+rでの抜け操作をoldのi3設定に合わせて追加。
        modes.resize = lib.mkForce {
          h = "resize shrink width 10 px or 10 ppt";
          j = "resize grow height 10 px or 10 ppt";
          k = "resize shrink height 10 px or 10 ppt";
          l = "resize grow width 10 px or 10 ppt";
          Left = "resize shrink width 10 px or 10 ppt";
          Down = "resize grow height 10 px or 10 ppt";
          Up = "resize shrink height 10 px or 10 ppt";
          Right = "resize grow width 10 px or 10 ppt";
          Return = "mode default";
          Escape = "mode default";
          "${mod}+r" = "mode default";
        };
      };

      extraConfig = ''
        set $mode_system System (l) lock, (e) logout, (s) suspend, (r) reboot, (Shift+s) shutdown
        mode "$mode_system" {
            bindsym l exec swaylock, mode "default"
            bindsym e exec swaymsg exit, mode "default"
            bindsym s exec swaylock && systemctl suspend, mode "default"
            bindsym r exec systemctl reboot, mode "default"
            bindsym Shift+s exec systemctl poweroff, mode "default"
            bindsym Return mode "default"
            bindsym Escape mode "default"
        }
        bindsym ${mod}+Shift+e mode "$mode_system"
      '';

      extraSessionCommands = ''
        export GTK_IM_MODULE=fcitx
        export QT_IM_MODULE=fcitx
        export XMODIFIERS=@im=fcitx
      '';
    };

    services.swayidle = {
      enable = true;
      timeouts = [
        {
          timeout = 300;
          command = "${pkgs.swaylock}/bin/swaylock -f";
        }
        {
          timeout = 600;
          command = "${pkgs.wlopm}/bin/wlopm --off '*'";
          resumeCommand = "${pkgs.wlopm}/bin/wlopm --on '*'";
        }
      ];
      events = {
        before-sleep = "${pkgs.swaylock}/bin/swaylock -f";
      };
    };

    programs.i3status = {
      enable = true;
      enableDefault = false;

      general = {
        colors = true;
        interval = 1;
        color_good = "#a6d189";
        color_degraded = "#e5c890";
        color_bad = "#e78284";
      };

      modules = {
        cpu_usage = {
          position = 1;
          settings.format = "CPU: %usage";
        };
        memory = {
          position = 2;
          settings.format = "RAM: %used (%percentage_used)";
        };
        "ethernet _first_" = {
          position = 3;
          settings = {
            format_up = "E: %ip %speed";
            format_down = "";
          };
        };
        "wireless _first_" = {
          position = 4;
          settings = {
            format_up = "W: %essid %quality";
            format_down = "";
          };
        };
        "battery 0" = {
          position = 5;
          settings = {
            status_chr = "C";
            status_bat = "D";
            status_unk = "?";
            status_full = "F";
            low_threshold = 20;
            format = "0: %status %percentage";
            format_down = "";
          };
        };
        "battery 1" = {
          position = 6;
          settings = {
            status_chr = "C";
            status_bat = "D";
            status_unk = "?";
            status_full = "F";
            low_threshold = 20;
            format = "1: %status %percentage";
            format_down = "";
          };
        };
        "volume master" = {
          position = 7;
          settings = {
            format = "♪ %volume";
            format_muted = "♪ Muted";
            device = "default";
            mixer = "Master";
          };
        };
        time = {
          position = 8;
          settings.format = "%Y/%m/%d %H:%M:%S";
        };
      };
    };
    programs.fuzzel = {
      enable = true;
      settings = {
        main = {
          terminal = "${pkgs.foot}/bin/foot";
          layer = "overlay";
          # 配色はcatppuccin-nix(home/catppuccin.nix, frappe/mauve)が自動適用する
          font = "PlemolJP Console NF:size=7";
          width = 120;
        };
      };
    };

    # GTKテーマ設定（GTK2/3）
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

    # Wayland/Sway向け環境変数
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

    programs.chromium = {
      enable = true;
      # package = pkgs.ungoogled-chromium;
      extensions = [
        {
          id = "ddkjiahejlhfcafbddmgiahcphecmpfh"; # ublock origin
        }
        {
          id = "hfjbmagddngcpeloejdejnfgbamkjaeg"; # Vimium C
        }

      ];
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
