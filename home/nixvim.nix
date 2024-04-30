{pkgs, ...}: {
  programs.nixvim = {
    enable = true;
    enableMan = true;
    options = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
    };
    globals.mapleader = " ";
    plugins = {
      lightline.enable = true;
      lsp = {
        enable = true;
        servers = {
          tsserver.enable = true;
          lua-ls.enable = true;
          rust-analyzer.enable = true;
        };
      };
      telescope.enable = true;
      #oil.enable = true;
      treesitter.enable = true;
      luasnip.enable = true;
      nvim-cmp = {
        enable = true;
        autoEnableSources = true;
        #	sources = [
        #	  { name = "nvim_lsp"; }
        #	  { name = "path"; }
        #	  { name = "buffer"; }
        #	];
        #mapping = {
        #  "<CR>" = "cmp.mapping.confirm({ select = true })";
        #  "<Tab>" = {
        #    action = ''
        #      function(fallback)
        #	if cmp.visible() then
        #	  cmp.select_next_item()
        #	elseif luasnip.expandable() then
        #	  luasnip.expand()
        #	elseif luasnip.expand_or_jumpable() then
        #	  luasnip.expand_or_jump()
        #	elseif check_backspace() then
        #	  fallback()
        #	else
        #	  fallback()
        #	end
        #     end
        #    '';
        #    modes = [ "i" "s" ];
        #  };
        #};
      };
    };
    colorschemes.gruvbox.enable = true;
    keymaps = [
      {
        action = "<cmd>Telescope live_grep<CR>";
        key = "<leader>g";
      }
    ];
    autoCmd = [
      {
        event = ["BufEnter" "BufWinEnter"];
        pattern = ["*.c" "*.h"];
        command = "echo 'Entering a c or c++ file'";
      }
    ];
    highlight = {
      Comment.fg = "#ff00ff";
      Comment.bg = "#000000";
      Comment.underline = true;
      Commend.bold = true;
    };

    extraPlugins = with pkgs.vimPlugins; [
      comment-nvim
    ];
  };
}
