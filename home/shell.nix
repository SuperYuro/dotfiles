{ ... }:

{
  programs.fish = {
    enable = true;
    shellAliases = {
      c = "cd";
      th = "touch";
      md = "mkdir";
      g = "git";
      v = "nvim";
      pyvenv = "goto-venv";
    };
    shellAbbrs = {
      wcl = "wc -l";
      tm = "open-tmux";
      gl = "ghq-tmux";
      dp = "docker compose";
      da = "direnv allow";
    };
    functions = {
      ghq-tmux = ''
        function ghq-tmux
          set -l repository (ghq root)/(ghq list | fzf --layout=reverse)

          if test -z "$repository"
            return 0
          end

          set -l session_name (basename $repository)

          # 新しいセッションを作成（作業ディレクトリを指定）
          tmux new-session -A -s $session_name -c $repository
        end
      '';
      goto-venv = ''
        function goto-venv
          set -l venv_dirs ".venv" venv

          for dir in $venv_dirs
            if test -e "$dir/bin/activate.fish"
              # 仮想環境をアクティブにする
              source "$dir/bin/activate.fish"

              # 新しいシェルインスタンスを開始
              fish

              # シェルインスタンスが終了したら仮想環境を終了する
              deactivate
              return 0
            end
          end

          echo "No venv script files are found."
          return 1
        end
      '';
      open-tmux = ''
        function open-tmux
          if test (count $argv) -eq 0
            tmux new-session -A -s (basename (pwd))
          else
            tmux new-session -A -s $argv[1]
          end
        end
      '';
    };
  };
}
