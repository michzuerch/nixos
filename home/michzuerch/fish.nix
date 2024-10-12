{ pkgs, ... }: {
  programs.fish = {
    enable = true;
  };

  home.package = with pkgs; [
    fishPlugins.done
    fishPlugins.fzf-fish
    fishPlugins.forgit
    fishPlugins.hydro
    fzf
    fishPlugins.grc
    grc
  ];
}
