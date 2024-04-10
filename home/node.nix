{ pkgs, ... }: {

  #  home.configFile."npm/config".text = ''
  #        cache=$XDG_CACHE_HOME/npm
  #        prefix=$XDG_DATA_HOME/npm
  #      '';

  home.packages = with pkgs; [
    bun
    nodejs_21
  ];
}
