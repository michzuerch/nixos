{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    enableMan = true;
    vimAlias = true;
    viAlias = true;
    withNodeJs = true;

    editorconfig.enable = true;

    colorschemes.catppuccin.enable = true;
    # colorschemes.tokyonight.enable = true;
    # plugins.lightline.enable = true;
    plugins = {
      bufferline.enable = true;
      noice.enable = true;
    };
  };
}
