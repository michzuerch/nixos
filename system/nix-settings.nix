_: {
  # Nix Configuration
  nix = {
    settings = {
      builders-use-substitutes = true;
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
      trusted-users = ["root" "michzuerch"];
      substituters = [
        "https://anyrun.cachix.org"
        "https://cuda-maintainers.cachix.org"
        "https://cache.nixos.org/"
        "https://hyprland.cachix.org"
        "https://devenv.cachix.org"
        "https://cosmic.cachix.org/"
      ];
      trusted-public-keys = [
        "anyrun.cachix.org-1:pqBobOjl7nKlsUMV25u9QHa9btJK65/8vnO3p346s="
        "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
        "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="
        "yazi.cachix.org-1:Dcdz63NZKfvUCbDGngQDAZq6kOroIrFoyO064uvLh8k="
      ];
      extra-substituters = [
        "https://nix-community.cachix.org"
        "https://yazi.cachix.org"
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };
  };
}
