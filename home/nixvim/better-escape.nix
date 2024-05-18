{...}: {
  programs.nixvim.plugins.better-escape = {
    enable = true;
    clearEmptyLines = false;
    mapping = ["jj" "jk"];
    timeout = "300";
  };
}
