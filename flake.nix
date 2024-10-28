{
  description = "nixos michzuerch october 2024";

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];

      imports = [
        ./hosts
        ./lib
        ./modules
        ./pkgs
        ./pre-commit-hooks.nix
      ];

      perSystem =
        { config
        , pkgs
        , ...
        }: {
          devShells.default = pkgs.mkShell {
            packages = [
              pkgs.alejandra
              pkgs.git
              pkgs.nodePackages.prettier
              config.packages.repl
            ];
            name = "dots";
            DIRENV_LOG_FORMAT = "";
            shellHook = ''
              ${config.pre-commit.installationScript}
            '';
          };

          formatter = pkgs.alejandra;
        };
    };

  systems.url = "github:nix-systems/default-linux";

  inputs = {
    flake-compat.url = "github:edolstra/flake-compat";

    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.systems.follows = "systems";
    };

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # nixpkgs.url = "github:nixos/nixpkgs/master";

    alejandra.inputs.nixpkgs.follows = "nixpkgs";
    alejandra.url = "github:kamadorueda/alejandra/3.0.0";

    anyrun.inputs.nixpkgs.follows = "nixpkgs";
    anyrun.url = "github:fufexan/anyrun";

    chaotic.url = "https://flakehub.com/f/chaotic-cx/nyx/*.tar.gz";

    yazi.url = "github:sxyazi/yazi";

    tailray.inputs.nixpkgs.follows = "nixpkgs";
    tailray.url = "github:NotAShelf/tailray";

    zen-browser.inputs.nixpkgs.follows = "nixpkgs";
    zen-browser.url = "github:fufexan/zen-browser-flake";

    auto-cpufreq.inputs.nixpkgs.follows = "nixpkgs";
    auto-cpufreq.url = "github:AdnanHodzic/auto-cpufreq";

    # catppuccin.url = "github:catppuccin/nix";
    catppuccin.url = "github:ryand56/catppuccin-nix";

    disko.inputs.nixpkgs.follows = "nixpkgs";
    disko.url = "github:nix-community/disko";

    hardware.url = "github:NixOS/nixos-hardware/master";

    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";

    hyprland-plugins.inputs.hyprland.follows = "hyprland";
    hyprland-plugins.url = "github:hyprwm/hyprland-plugins";

    hyprland.inputs.nixpkgs.follows = "nixpkgs";
    hyprland.url = "github:hyprwm/Hyprland";

    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
    nix-index-database.url = "github:Mic92/nix-index-database";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    nixos-cosmic.inputs.nixpkgs.follows = "nixpkgs";
    nixos-cosmic.url = "github:lilyinstarlight/nixos-cosmic";

    nsearch.inputs.nixpkgs.follows = "nixpkgs";
    nsearch.url = "github:niksingh710/nsearch";

    nur.url = "github:nix-community/nur";

    rose-pine-hyprcursor.inputs.nixpkgs.follows = "nixpkgs";
    rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";

    rust-overlay.inputs.nixpkgs.follows = "nixpkgs";
    rust-overlay.url = "github:oxalica/rust-overlay";

    helix.url = "github:helix-editor/helix";

    lanzaboote.url = "github:nix-community/lanzaboote";

    sops-nix.inputs.nixpkgs.follows = "nixpkgs";

    hm = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-compat.follows = "flake-compat";
      };
    };

  };

}
