{ pkgs, ... }:

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
          "${mod}+r" = "exec fuzzel";
          "${mod}+e" = "exec thunar";
          "${mod}+l" = "exec swaylock";

          "${mod}+Left" = "focus left";
          "${mod}+Right" = "focus right";
          "${mod}+Up" = "focus up";
          "${mod}+Down" = "focus down";
          "${mod}+Shift+Left" = "move left";
          "${mod}+Shift+Right" = "move right";
          "${mod}+Shift+Up" = "move up";
          "${mod}+Shift+Down" = "move down";

          "${mod}+1" = "workspace number 1";
          "${mod}+2" = "workspace number 2";
          "${mod}+3" = "workspace number 3";
          "${mod}+4" = "workspace number 4";
          "${mod}+5" = "workspace number 5";
          "${mod}+6" = "workspace number 6";
          "${mod}+Shift+1" = "move container to workspace number 1";
          "${mod}+Shift+2" = "move container to workspace number 2";
          "${mod}+Shift+3" = "move container to workspace number 3";
          "${mod}+Shift+4" = "move container to workspace number 4";
          "${mod}+Shift+5" = "move container to workspace number 5";
          "${mod}+Shift+6" = "move container to workspace number 6";

          "${mod}+f" = "fullscreen";
          "${mod}+Shift+space" = "floating toggle";
          "${mod}+Shift+r" = "reload";

          # スクリーンショット
          "Print" = ''exec sh -c "mkdir -p ~/Pictures/Screenshots && grim ~/Pictures/Screenshots/$(date +%Y-%m-%d_%H-%M-%S).png"'';
          "${mod}+Shift+s" = ''exec sh -c "grim -g \"$(slurp)\" - | wl-copy"'';
          "${mod}+Print" = ''exec sh -c "mkdir -p ~/Pictures/Screenshots && grim -g \"$(slurp)\" ~/Pictures/Screenshots/$(date +%Y-%m-%d_%H-%M-%S).png"'';

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
          { command = "gsettings set org.gnome.desktop.interface gtk-theme 'catppuccin-frappe-mauve-standard+rimless'"; }
          { command = "gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'"; }
          { command = "gsettings set org.gnome.desktop.interface cursor-theme 'catppuccin-frappe-dark-cursors'"; }

          # 壁紙
          {
            command = "swaybg -m fill -i ${pkgs.nixos-artwork.wallpapers.nineish-catppuccin-frappe}/share/backgrounds/nixos/nix-wallpaper-nineish-catppuccin-frappe.png";
          }

          { command = "waybar"; }
        ];

        bars = [ ]; # waybarを別途起動するため内蔵barは無効化
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

    programs.waybar = {
      enable = true;
      settings = [
        {
          layer = "top";
          position = "bottom";
          height = 28;
          modules-left = [
            "sway/workspaces"
            "sway/window"
          ];
          modules-center = [ ];
          modules-right = [
            "cpu"
            "memory"
            "battery"
            "tray"
            "clock"
          ];

          "sway/workspaces" = {
            format = "{name}";
          };
          "sway/window" = {
            max-length = 50;
          };

          "cpu" = {
            interval = 1;
            format = " {usage}%";
          };
          "memory" = {
            interval = 1;
            format = " {used:0.1f}G/{total:0.1f}G";
          };
          "battery" = {
            interval = 30;
            states = {
              warning = 30;
              critical = 15;
            };
            format = "{icon} {capacity}%";
            format-charging = " {capacity}%";
            format-icons = [
              ""
              ""
              ""
              ""
              ""
            ];
            tooltip-format = "{timeTo}";
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
          font-size: 12px;
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

        #workspaces button.focused {
          background-color: #8caaee;
          color: #303446;
          font-weight: bold;
        }

        #workspaces button.urgent {
          background-color: #e78284;
          color: #303446;
        }

        #window {
          margin: 3px 4px;
          background-color: transparent;
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
        #battery,
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

        #battery {
          color: #81c8be;
        }

        #battery.warning {
          color: #ef9f76;
        }

        #battery.critical {
          color: #e78284;
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
          font = "Noto Sans Mono CJK JP:size=9";
          width = 250;
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
