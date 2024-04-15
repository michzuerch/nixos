{pkgs, ...}: {
  home.packages = with pkgs; [
    go
    gotools
    golangci-lint
  ];
}
