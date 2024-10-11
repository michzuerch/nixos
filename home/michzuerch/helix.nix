{pkgs, ...}: {
  programs.helix = {
    enable = true;
    catppuccin.enable = true;

    # https://docs.helix-editor.com/languages.html
    languages = {
      language = [
        {
          name = "nix";
          auto-format = false;
          formatter.command = "${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt";
        }
      ];
    };

    settings = {
      editor = {
        indent-guides = {
          render = true;
        };
        bufferline = "multiple";
        cursorline = true;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };

        lsp.display-messages = true;
      };

      keys = {
        normal = {";" = "command_mode";};
        select = {";" = "command_mode";};
      };
    };
  };
}
