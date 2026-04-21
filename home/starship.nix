{ ... }:

{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      "$schema" = "https://starship.rs/config-schema.json";
      format = ''
        [](black)$os$hostname$directory$git_branch$git_status$env_var[](black)$fill[](black)$cmd_duration$dart$deno$dotnet$golang$nodejs$python$ruby$rust$time[](black)
        $character
      '';
      add_newline = false;
      palette = "catppuccin_frappe";
      package = {
        disabled = true;
      };
      palettes = {
        nordfox = {
          foreground = "#cdcecf";
          background = "#2e3440";
          separator = "#60728a";
          black = "#3b4252";
          red = "#bf616a";
          green = "#a3be8c";
          yellow = "#ebcb8b";
          blue = "#81a1c1";
          cyan = "#88c0d0";
          white = "#e6e9f0";
        };
        catppuccin_frappe = {
          foreground = "#c6d0f5";
          background = "#303446";
          separator = "#a5adce";
          black = "#414559";
          red = "#e78284";
          green = "#a6d189";
          yellow = "#e5c890";
          blue = "#8caaee";
          cyan = "#99d1db";
          white = "#b5bfe2";
        };
      };
      os = {
        format = "[ $symbol ]($style)";
        style = "bg:black fg:foreground bold";
        disabled = false;
        symbols = {
          Alpaquita = " ";
          Alpine = " ";
          AlmaLinux = " ";
          Amazon = " ";
          Android = " ";
          Arch = " ";
          Artix = " ";
          CentOS = " ";
          Debian = " ";
          DragonFly = " ";
          Emscripten = " ";
          EndeavourOS = " ";
          Fedora = " ";
          FreeBSD = " ";
          Garuda = "󰛓 ";
          Gentoo = " ";
          HardenedBSD = "󰞌 ";
          Illumos = "󰈸 ";
          Kali = " ";
          Linux = " ";
          Mabox = " ";
          Macos = " ";
          Manjaro = " ";
          Mariner = " ";
          MidnightBSD = " ";
          Mint = " ";
          NetBSD = " ";
          NixOS = " ";
          OpenBSD = "󰈺 ";
          openSUSE = " ";
          OracleLinux = "󰌷 ";
          Pop = " ";
          Raspbian = " ";
          Redhat = " ";
          RedHatEnterprise = " ";
          RockyLinux = " ";
          Redox = "󰀘 ";
          Solus = "󰠳 ";
          SUSE = " ";
          Ubuntu = " ";
          Unknown = " ";
          Void = " ";
          Windows = "󰍲 ";
        };
      };
      hostname = {
        ssh_only = true;
        ssh_symbol = " ";
        format = "[ $ssh_symbol$hostname]($style)[ ](bg:black fg:foreground)";
        style = "italic bg:black fg:cyan";
      };
      directory = {
        truncation_length = 0;
        truncate_to_repo = true;
        format = "[ $read_only]($read_only_style)[$path ]($style)";
        style = "bg:black fg:foreground bold";
        read_only = "󰌾 ";
        read_only_style = "bg:black fg:red";
        truncation_symbol = "";
        use_os_path_sep = false;
      };
      git_branch = {
        format = "[ ](bg:black fg:foreground)[$symbol $branch ]($style)";
        symbol = "";
        style = "bg:black fg:green";
      };
      git_status = {
        format = "[$all_status ]($style)";
        style = "bg:black fg:foreground";
        conflicted = "=";
        ahead = "⇡";
        behind = "⇣";
        diverged = "⇕";
        up_to_date = "";
        untracked = "?";
        stashed = "$";
        modified = "!";
        staged = "+";
        renamed = "»";
        deleted = "✘";
      };
      env_var = {
        venv = {
          variable = "VIRTUAL_ENV";
          format = "[ ](bg:black fg:foreground)[venv]($style)[ ](bg:black fg:foreground)";
          style = "bg:black fg:blue underline bold italic";
        };
      };
      fill = {
        symbol = " ";
        style = "black";
      };
      cmd_duration = {
        min_time = 2000;
        show_milliseconds = false;
        format = "[ 󱦟 $duration ]($style)";
        style = "bg:black fg:foreground";
      };
      time = {
        format = "[  $time ]($style)";
        time_format = "%H:%M";
        style = "bg:black fg:foreground";
        disabled = false;
      };
      dart = {
        format = "[ $symbol $version ]($style)[](bg:black fg:foreground)";
        version_format = "v\${raw}";
        symbol = "";
        detect_extensions = [ "dart" ];
        detect_files = [
          "pubspec.yaml"
          "pubspec.yml"
          "pubspec.lock"
        ];
        style = "bg:black fg:blue";
      };
      deno = {
        format = "[ $symbol $version ]($style)[](bg:black fg:foreground)";
        version_format = "v\${raw}";
        symbol = "";
        detect_extensions = [ ];
        detect_files = [
          "deno.json"
          "deno.jsonc"
        ];
        style = "bg:black fg:green";
      };
      dotnet = {
        format = "[ $symbol $version ]($style)[](bg:black fg:foreground)";
        version_format = "v\${raw}";
        symbol = "󰪮";
        detect_extensions = [
          "csproj"
          "fsproj"
          "xproj"
          "sln"
        ];
        detect_files = [ ];
        style = "bg:black fg:blue";
      };
      golang = {
        format = "[ $symbol $version ]($style)[](bg:black fg:foreground)";
        version_format = "v\${raw}";
        symbol = "󰟓";
        detect_extensions = [ "go" ];
        detect_files = [ "go.mod" ];
        style = "bg:black fg:blue";
      };
      nodejs = {
        format = "[ $symbol $version ]($style)[](bg:black fg:foreground)";
        version_format = "v\${raw}";
        symbol = "󰎙";
        detect_extensions = [ ];
        detect_files = [
          "package.json"
          ".node-version"
        ];
        detect_folders = [ "node_modules" ];
        style = "bg:black fg:green";
      };
      python = {
        format = "[ $symbol $version ]($style)[](bg:black fg:foreground)";
        version_format = "v\${raw}";
        symbol = "";
        detect_extensions = [ "py" ];
        detect_files = [
          "pyproject.toml"
          "requirements.txt"
          ".python-version"
        ];
        detect_folders = [
          "venv"
          ".venv"
        ];
        style = "bg:black fg:blue";
      };
      ruby = {
        format = "[ $symbol $version ]($style)[](bg:black fg:foreground)";
        version_format = "v\${raw}";
        symbol = "";
        detect_extensions = [ "rb" ];
        detect_files = [
          "Gemfile"
          ".ruby-version"
        ];
        detect_folders = [ ];
        style = "bg:black fg:red";
      };
      rust = {
        format = "[ $symbol $version ]($style)[](bg:black fg:foreground)";
        version_format = "v\${raw}";
        symbol = "";
        detect_extensions = [ "rs" ];
        detect_files = [
          "Cargo.toml"
          "Cargo.lock"
        ];
        detect_folders = [ ];
        style = "bg:black fg:red";
      };
    };
  };
}
