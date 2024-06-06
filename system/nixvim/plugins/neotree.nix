{
  programs.nixvim.plugins.neo-tree = {
    enable = true;
    autoCleanAfterSessionRestore = true;
    closeIfLastWindow = true;

    window = {
      position = "left";
    };

    filesystem = {
      followCurrentFile.enabled = true;
      filteredItems = {
        hideHidden = false;
        hideDotfiles = false;
        forceVisibleInEmptyFolder = true;
        hideGitignored = false;
      };
    };

    window.mappings = {
      "<bs>" = "navigate_up";
      "." = "set_root";
      "f" = "fuzzy_finder";
      "/" = "filter_on_submit";
      "h" = "show_help";
    };
  };
}
