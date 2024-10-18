#                  ↓ make sure osConfig is in the argument set
{
  inputs,
  pkgs,
  osConfig,
  ...
}: {
  programs.anyrun.extraConfigFiles."nixos-options.ron".text = let
    #               ↓ home-manager refers to the nixos configuration as osConfig
    nixos-options = osConfig.system.build.manual.optionsJSON + "/share/doc/nixos/options.json";
    # merge your options
    options = builtins.toJSON {
      ":nix" = [nixos-options];
    };
    # or alternatively if you wish to read any other documentation options, such as home-manager
    # get the docs-json package from the home-manager flake
    # hm-options = inputs.home-manager.packages.${pkgs.system}.docs-json + "/share/doc/home-manager/options.json";
    # options = builtins.toJSON {
    #   ":nix" = [nixos-options];
    #   ":hm" = [hm-options];
    #   ":something-else" = [some-other-option];
    #   ":nall" = [nixos-options hm-options some-other-option];
    # };
  in ''
    Config(
        // add your option paths
        options: ${options},
     )
  '';
}
