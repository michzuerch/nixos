{pkgs, ...}: {
  home.packages = with pkgs; [
    neovim
    ripgrep
    fd
    nodejs_22
    gnumake
    gcc
    ansible-language-server
    marksman
    gopls
    dockerfile-language-server-nodejs
    docker-compose-language-service
    cmake-language-server
    helm-ls
    nil
    nixd
    lua-language-server
    stylua
    pyright
    vscode-js-debug
    typescript-language-server
    golangci-lint-langserver
  ];
  home.sessionVariables = {
    EDITOR = "nvim";
  };
  home.file = {
    "neovim-configs" = {
      source = ./configs;
      target = ".config/nvim";
      recursive = true;
    };
  };
  programs.zsh.shellAliases = {
    v = "nvim";
  };
}
