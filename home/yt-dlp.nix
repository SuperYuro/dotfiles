{ pkgs, ... }:

{
  programs.yt-dlp = {
    enable = true;
    settings = {
      sleep-interval = 5;
      max-sleep-interval = 20;
      output = "~/Videos/YouTube/%(channel)s/%(title)s.%(ext)s";
      write-thumbnail = true;
      embed-metadata = true;
      format = "bestvideo+bestaudio";
    };
  };

  home.packages = with pkgs; [
    mutagen
    deno
  ];
}
