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

    };
    colorschemes.gruvbox.enable  = true;
    keymaps = [
      {
	action = "<cmd>Telescope live_grep<CR>";
	key = "<leader>g";
      }
    ];
    autoCmd = [
      {
	event = [ "BufEnter" "BufWinEnter" ];
	pattern = [ "*.c" "*.h" ];
	command = "echo 'Entering a c or c++ file'";
      }
    ];
    highlight = {
      Comment.fg = "#ff00ff";
      Comment.bg = "#000000";
      Comment.underline = true;
      Commend.bold = true;
    };
  };
}
