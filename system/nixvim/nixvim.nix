{pkgs, ...}: {
  imports = [
    #./opts.nix
    #./keymaps.nix
    #./autocmds.nix
    #./plugins/plugins-bundle.nix
  ];

  programs.nixvim = {
    enable = true;

    defaultEditor = true;
    colorschemes.oxocarbon.enable = true;
    extraPlugins = with pkgs.vimPlugins; [
      nvim-web-devicons
    ];
  };
}
