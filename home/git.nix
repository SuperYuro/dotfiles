{ ... }:

{
  programs.git = {
    enable = true;
    ignores = [
    ];
    settings = {
      user = {
        name = "SuperYuro";
        email = "a.gpgtdmgp@gmail.com";
      };
      core = {
        bare = true;
        autocrlf = "input";
        editor = "nvim";
      };
      init = {
        defaultBranch = "main";
      };
      alias = {
        a = "add";
        al = "add --all";
        d = "diff";
        ds = "diff --staged";
        co = "checkout";
        cm = "commit";
        br = "branch";
        ba = "branch -a";
        sw = "switch";
        l = "log --oneline";
        r = "restore";
        rv = "revert";
        cl = "clone";
        st = "status";
        fh = "fetch";
        pl = "pull";
        rb = "rebase";
        ps = "push";
        sh = "stash";
        sp = "stash pop";
      };
      ghq = {
        root = "~/.ghq";
      };
    };
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      side-by-side = true;
      line-number = true;
    };
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper = {
      enable = true;
    };
    settings = {
      git_protocol = "https";
      prompt = "enabled";
    };
  };

  programs.lazygit = {
    enable = true;
    enableZshIntegration = true;
  };
}
