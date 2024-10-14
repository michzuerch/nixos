{pkgs, ...}: {
  home.packages = with pkgs; [
    neovim
    ripgrep
    fd
    nodejs_22
    gnumake
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
