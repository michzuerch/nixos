{pkgs, ...}: {
  home.packages = with pkgs; [
    vscode-js-debug
    typescript-language-server
    golangci-lint-langserver
  ];
}
