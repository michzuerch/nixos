{...}: {
  programs.nixvim.plugins = {
    cmp-treesitter.enable = true;
    treesitter = {
      enable = true;
      nixGrammars = true;
      indent = true;
    };
    treesitter-context = {
      enable = true;
      settings = {
        max_lines = 2;
      };
    };
    treesitter-refactor = {
      enable = true;
      highlightCurrentScope.enable = true;
      highlightCurrentScope.disable = [
        "nix"
      ];
      highlightDefinitions.enable = true;
      navigation.enable = true;
      smartRename.enable = true;
    };
    rainbow-delimiters.enable = true;
  };
}
