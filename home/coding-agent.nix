{ ... }:

{
  programs.claude-code = {
    enable = true;
    settings = {
      enabledPlugins = {
        "frontend-design@claude-plugins-official" = true;
        "code-review@claude-plugins-official" = true;
        "typescript-lsp@claude-plugins-official" = true;
        "code-simplifier@claude-plugins-official" = true;
        "commit-commands@claude-plugins-official" = true;
        "pr-review-toolkit@claude-plugins-official" = true;
        "pyright-lsp@claude-plugins-official" = true;
        "csharp-lsp@claude-plugins-official" = true;
        "rust-analyzer-lsp@claude-plugins-official" = true;
        "claude-code-setup@claude-plugins-official" = true;
        "feature-dev@claude-plugins-official" = true;
        "gopls-lsp@claude-plugins-official" = true;
        "microsoft-docs@claude-plugins-official" = true;
      };
      language = "Japanese";
      autoUpdatesChannel = "stable";
      env = {
        EDITOR = "nvim";
        VISUAL = "nvim";
        CLAUDE_CODE_NO_FLICKER = 1;
      };
    };
  };

  programs.opencode = {
    enable = true;
    settings = {
      lsp = true;
      provider = {
        "llama.cpp" = {
          npm = "@ai-sdk/openai-compatible";
          name = "llama-server (local)";
          options = {
            baseURL = "http://127.0.0.1:8080/v1";
          };
          models = {
            "Qwen3.8-27B-UD-Q4_K_M.gguf" = {
              name = "Qwen3.8 27B Q4_K_M";
              limit = {
                context = 524288;
                output = 65536;
              };
            };
          };
        };
      };
    };
  };
}
