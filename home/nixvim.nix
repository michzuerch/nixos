{pkgs, ...}: {
  programs.nixvim = {
    enable = true;
    enableMan = true;
    options = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;

    };
    plugins = {
      lightline.enable = true;

    };
    colorschemes.gruvbox.enable  = true;
  };
}
