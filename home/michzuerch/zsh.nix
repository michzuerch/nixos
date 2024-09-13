{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    autocd = true;
    defaultKeymap = "viins";
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    dotDir = ".config/zsh";
    initExtra = ''
      if [[ -o interactive ]]; then
          export OPENAI_API_KEY=$(cat /run/secrets/openai_api_key)
      fi
    '';
  };
}
