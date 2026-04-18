{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    focusEvents = true;
    keyMode = "vi";
    mouse = true;
    shortcut = "x";
    shell = "${pkgs.fish}/bin/fish";
    terminal = "xterm-256color";
    historyLimit = 1048576;
    extraConfig = ''
      # Split window vertical
      bind h split-window -h

      # Split window horizontal
      bind v split-window -v

      set -gs terminal-overrides ",*:RGB"

      set -g escape-time 1
      set -g pane-base-index 1
      set -g renumber-windows on
      set -g status-position "top"

      set -g mode-style "fg=#232634,bg=#c6d0f5"
      set -g message-style "fg=#232634,bg=#c6d0f5"
      set -g message-command-style "fg=#232634,bg=#c6d0f5"
      set -g pane-border-style "fg=#c6d0f5"
      set -g pane-active-border-style "fg=#8caaee"
      set -g status "on"
      set -g status-justify "left"
      set -g status-style "fg=#c6d0f5,bg=#232634"
      set -g status-left-length "100"
      set -g status-right-length "100"
      set -g status-left-style NONE
      set -g status-right-style NONE
      set -g status-left "#[fg=#232634,bg=#8caaee,bold] #H #[nobold,nounderscore,noitalics]"
      set -g status-right "#[fg=#232634,bg=#8caaee,nobold,nounderscore,noitalics]#[bold] #S "
      setw -g window-status-activity-style "underscore,fg=#414559,bg=#232634"
      setw -g window-status-separator ""
      setw -g window-status-style "NONE,fg=#414559,bg=#232634"
      setw -g window-status-format "  #I  #W  "
      setw -g window-status-current-format "#[fg=#c6d0f5,bg=#232634,nobold,nounderscore,noitalics]#[fg=#232634,bg=#c6d0f5,bold] #I  #W #[nobold,nounderscore,noitalics]"
    '';
  };
}
