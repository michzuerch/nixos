{pkgs, ...}: {
  programs.bash = {
    enable = true;
    enableCompletion = true;
  };

  programs.bat = {
    enable = true;
    catppuccin.enable = true;
  };

  programs.fzf = {
    enable = true;
    catppuccin.enable = true;
    defaultCommand = "fd --type f --hidden --no-ignore --follow --exclude .git";
    enableZshIntegration = true;
    enableFishIntegration = false;
  };

  programs.jq.enable = true;

  programs.gitui.enable = true;

  programs.dircolors.enable = true;

  #programs.command-not-found.enable = true;
  programs.nix-index = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.direnv.enable = true;
  programs.direnv.enableZshIntegration = true;
  programs.direnv.nix-direnv.enable = true;

  home.packages = with pkgs; [
    # bandwhich
    bat
    cowsay
    # delta
    direnv
    du-dust
    eza
    fd
    gcc
    gnumake
    grex
    gtop
    krusader
    ncdu
    procs
    pwgen
    sd
    sqlite
    tealdeer
    tig
    tokei
    unzip
  ];
}
