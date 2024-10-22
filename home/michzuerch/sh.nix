{pkgs, ...}: {
  programs = {
    bash = {
      enable = true;
      enableCompletion = true;
    };

    bat = {
      enable = true;
      catppuccin.enable = true;
    };

    fzf = {
      enable = true;
      catppuccin.enable = true;
      defaultCommand = "fd --type f --hidden --no-ignore --follow --exclude .git";
      enableZshIntegration = true;
      enableFishIntegration = false;
    };

    jq.enable = true;

    broot.enable = true;

    gitui.enable = true;

    dircolors.enable = true;

    #programs.command-not-found.enable = true;
    nix-index = {
      enable = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
    };

    direnv = {
      enable = true;
      enableZshIntegration = true;
      # enableFishIntegration = true;
      nix-direnv.enable = true;
    };

    eza = {
      enable = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
      git = true;
      icons = "auto";
    };
  };

  home.packages = with pkgs; [
    asciicam # Terminal webcam
    asciinema-agg # Convert asciinema to .gif
    bandwhich
    bat
    bc # Terminal calculator
    breezy # Terminal brz client
    chafa # Terminal image viewer
    chatgpt-cli
    chroma # Code syntax highlight
    clinfo # OpenGFL info
    cowsay
    croc # Filetransfer
    curlie
    cyme # modern lsusb
    delta
    direnv
    doggo
    du-dust
    fd
    gcc
    gnumake
    gping
    grex
    gtop
    hydra-check
    just
    krusader
    ncdu
    netdiscover # Modern arp
    nix-init
    nix-melt
    nix-output-monitor
    nix-tree
    nurl # Nix url fetcher
    p7zip
    procs
    pwgen
    sd
    sqlite
    tealdeer
    tig
    tokei
    unzip
    zoxide
  ];
}
