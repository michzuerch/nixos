{ pkgs, ... }:
{
  programs.zellij = {
    enable = false;
    package = pkgs.zellij;
    catppuccin.enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    settings = {
      theme = "catppuccin-mocha";
      default_shell = "zsh";
      copy_command = "wl-copy";
      copy_on_select = true;
    };
  };
}
