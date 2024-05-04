{pkgs, ...}: {
  programs.nixvim = {
    enable = true;
    enableMan = true;
    options = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      tabstop = 2;
      wrap = false;
      swapfile = false;
      backup = false;
      undofile = true;
      hlsearch = false;
      incsearch = true;
      termguicolors = true;
      scrolloff = 8;
      signcolumn = "yes";
      updatetime = 50;
      foldlevelstart = 99;
    };
    globals.mapleader = " ";
    plugins = {
      gitsigns.enable = true;
      undotree.enable = true;
      nvim-tree.enable = true;
      lightline = {
    		enable = true;
				colorscheme = "catppuccin";
      };
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
				snippet.expand = "luasnip";
      	mapping = {
        	"<C-d>" = "cmp.mapping.scroll_docs(-4)";
        	"<C-f>" = "cmp.mapping.scroll_docs(4)";
       		"<C-e>" = "cmp.mapping.close()";
        	"<C-space>" = "cmp.mapping.complete()";
        	"<C-y>" = {
          	action = "cmp.mapping.confirm({
                                select = true, behavior = cmp.ConfirmBehavior.Insert })";
        	};
      	};
     	};
    };
    colorschemes.catppuccin.enable = true;
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
