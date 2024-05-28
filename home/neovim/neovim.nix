{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    vimAlias = true;
    vimdiffAlias = true;
    withNodeJs = true;
    extraPackages = with pkgs; [
          gcc # needed for nvim-treesitter

          # HTML, CSS, JSON
          vscode-langservers-extracted

          # LazyVim defaults
          stylua
          shfmt

          # Markdown extra
          nodePackages.markdownlint-cli
          marksman

          # Docker extra
          nodePackages.dockerfile-language-server-nodejs
          hadolint
          docker-compose-language-service

          # JSON and YAML extras
          nodePackages.yaml-language-server

          # Custom
          editorconfig-checker
          shellcheck
        ];

  };

  xdg.configFile."nvim" = {
    recursive = true;
    source = ./config;
  };
}
