{inputs, pkgs, ...}: {
  programs = {
    chromium = {enable = true;};
    brave = {enable = true;};
    firefox = {enable = true;};
    qutebrowser = {enable = false;};
  };
  home.packages = [
    inputs.zen-browser.packages.${pkgs.system}.default
  ];
}
