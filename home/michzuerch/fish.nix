{pkgs, ...}: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
    # vendor = {
    #   completions.enable = true;
    #   config.enable = true;
    #   functions.enable = true;
    # };
  };

  home.packages = with pkgs; [
    fishPlugins.done
    fishPlugins.fzf-fish
    fishPlugins.forgit
    fishPlugins.hydro
    fzf
    fishPlugins.grc
    grc
    fishPlugins.z
    fishPlugins.autopair
  ];
}
