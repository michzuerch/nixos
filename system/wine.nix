{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    wine
    winetricks
    wine64
  ];
}
