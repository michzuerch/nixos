{pkgs, ...}: {
  home.packages = [pkgs.ueberzugpp pkgs.libsixel];

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    shellWrapperName = "y";

    settings = {
      manager = {show_hidden = true;};
      preview = {
        max_width = 1000;
        max_height = 1000;
      };
    };

    # plugins = {
    #   chmod = "${yazi-plugins}/chmod.yazi";
    #   full-border = "${yazi-plugins}/full-border.yazi";
    #   max-preview = "${yazi-plugins}/max-preview.yazi";
    #   starship = pkgs.fetchFromGitHub {
    #     owner = "Rolv-Apneseth";
    #     repo = "starship.yazi";
    #     rev = "...";
    #     sha256 = "sha256-...";
    #   };
    # };
    #
    # initLua =
    #   "	require(\"full-border\"):setup()\n	require(\"starship\"):setup()\n";
    #
    # keymap = {
    #   manager.prepend_keymap = [
    #     {
    #       on = "T";
    #       run = "plugin --sync max-preview";
    #       desc = "Maximize or restore the preview pane";
    #     }
    #     {
    #       on = [ "c" "m" ];
    #       run = "plugin chmod";
    #       desc = "Chmod on selected files";
    #     }
    #   ];
    # };
  };
}
