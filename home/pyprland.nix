{
  config,
  pkgs,
  ...
}: {
  home.file.".config/hypr/pyprland.json".text = ''
    {
      "pyprland": {
        "plugins": ["scratchpads", "magnify"]
      },
      "scratchpads": {
        "term": {
          "command": "alacritty --class scratchpad",
          "margin": 50
        }
      }
    }
  '';

  home.packages = with pkgs; [
    pyprland
  ];
}
