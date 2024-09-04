{pkgs, ...}: {
  programs = {
    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 1d --keep 3";
      flake = "/home/michzuerch/Source/nixos";
    };
  };
  environment.systemPackages = with pkgs; [
    nix-output-monitor
    nvd
  ];
}
