{ ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autocd = true;
    autosuggestion = {
      enable = true;
    };
    syntaxHighlighting = {
      enable = true;
    };
    defaultKeymap = "emacs";
    history = {
      append = true;
      ignoreDups = true;
      ignoreSpace = true;
      save = 100000000;
      saveNoDups = false;
      size = 100000000;
    };
    shellAliases = {
      c = "cd";
      th = "touch";
      md = "mkdir";
      g = "git";
      v = "nvim";
      pyvenv = "goto-venv";
      tm = "launch-tmux";
      gl = "ghq-tmux";
      wcl = "wc -l";
      da = "direnv allow";
    };
    zsh-abbr = {
      enable = true;
      abbreviations = {
        dp = "docker compose";
      };
    };
    siteFunctions = {
      launch-tmux = ''
        if [[ $# -eq 0 ]]; then
          tmux new-session -A -s "''${PWD##*/}"
        else
          tmux new-session -A -s "$1"
        fi
      '';
      ghq-tmux = ''
        local repository="$(ghq root)/$(ghq list | fzf --layout=reverse)"

        if [[ -z "$repository" || "$repository" == "$(ghq root)/" ]]; then
          return 0
        fi

        local session_name="''${repository##*/}"

        tmux new-session -A -s "$session_name" -c "$repository"
      '';
      goto-venv = ''
        local venv_dirs=(".venv" "venv")
        for dir in "''${venv_dirs[@]}"; do
          if [[ -e "$dir/bin/activate" ]]; then
            source "$dir/bin/activate"
            zsh
            deactivate
            return 0
          fi
        done
        echo "No venv script files are found."
        return 1
      '';
    };
  };
}
