{ pkgs, config, lib, ... }:

let
  lazy-nix-helper-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "lazy-nix-helper.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "b-src";
      repo = "lazy-nix-helper.nvim";
      rev = "63b20ed071647bb492ed3256fbda709e4bfedc45";
      hash = "<sha256 of archive of git commit>";
    };
  };

  sanitizePluginName = input:
  let
    name = lib.strings.getName input;
    intermediate = lib.strings.removePrefix "vimplugin-" name;
    result = lib.strings.removePrefix "lua5.1-" intermediate;
  in result;

  pluginList = plugins: lib.strings.concatMapStrings (plugin: "  [\"${sanitizePluginName plugin.name}\"] = \"${plugin.outPath}\",\n") plugins;

in
  {
    xdg.configFile."nvim/lua" = {
      source = ./neovim_config/lua;
      recursive = true;
    };

    programs.neovim = {
      enable = true;
       vimAlias = true;
       vimdiffAlias = true;
       withNodeJs = true;

      extraPackages = with pkgs; [
         gcc # needed for nvim-treesitter

         # HTML, CSS, JSON
         vscode-langservers-extracted

         # LazyVim defaults
         stylua
         shfmt

         # Markdown extra
         nodePackages.markdownlint-cli
         marksman

         # Docker extra
         nodePackages.dockerfile-language-server-nodejs
         hadolint
         docker-compose-language-service

         # JSON and YAML extras
         nodePackages.yaml-language-server

         # Custom
         editorconfig-checker
         shellcheck
      ];
      plugins = with pkgs.vimPlugins; [
          lazy-nix-helper-nvim
          lazy-nvim
#         # base distro
#         LazyVim
#         conform-nvim
#         nvim-lint
#         markdown-preview-nvim
#         headlines-nvim
#         #
#         #   # theme
#         dracula-nvim
#         #
#         #   # UI
#         bufferline-nvim
#         gitsigns-nvim
#         edgy-nvim
#         dashboard-nvim
#         toggleterm-nvim
#         trouble-nvim
#         lualine-nvim
#         which-key-nvim
#         nvim-web-devicons
#         mini-nvim
#         noice-nvim
#         nui-nvim
#         nvim-notify
#         nvim-lsp-notify
#         neo-tree-nvim
#         nvim-navic
#         dressing-nvim
#         aerial-nvim
#         #
#         #   # project management
#         project-nvim
#         neoconf-nvim
#         persistence-nvim
#         #
#         #   # smart typing
#         indent-blankline-nvim
#         guess-indent-nvim
#         vim-illuminate
#         #
#         #   # LSP
#         nvim-lspconfig
#         rust-tools-nvim
#         crates-nvim
#         null-ls-nvim
#         nvim-lightbulb # lightbulb for quick actions
#         # nvim-code-action-menu # code action menu
#         neodev-nvim
#         SchemaStore-nvim # load known formats for json and yaml
#         #
#         #   # cmp plugins
#         nvim-cmp # completion plugin
#         cmp-buffer # buffer completions
#         cmp-path # path completions
#         cmp_luasnip # snipper completions
#         cmp-nvim-lsp # LSP completions
#         #
#         #   # snippets
#         luasnip # snippet engine
#         friendly-snippets # a bunch of snippets to use
#         #
#         #   # search functionality
#         plenary-nvim
#         telescope-nvim
#         telescope-fzf-native-nvim
#         nvim-spectre
#         flash-nvim
#         #
#         #   # treesitter
#         nvim-treesitter-context
#         nvim-ts-autotag
#         nvim-treesitter-textobjects
#         nvim-treesitter.withAllGrammars
#         #
#         #   # comments
#         nvim-ts-context-commentstring
#         todo-comments-nvim
#         #
#         #   # leap
#         vim-repeat
#         leap-nvim
#         flit-nvim
#         #
#         #   # DAP
#         nvim-dap
#         nvim-dap-ui
#         nvim-dap-virtual-text
#         #
#         #   # neotest
#         neotest
#         neotest-rust
#         #
#         lazy-nvim
#         vim-startuptime
      ];
      extraLuaConfig = ''
        local plugins = {
        ${pluginList config.programs.neovim.plugins}
        }
        local lazy_nix_helper_path = "${lazy-nix-helper-nvim}"
        if not vim.loop.fs_stat(lazy_nix_helper_path) then
          lazy_nix_helper_path = vim.fn.stdpath("data") .. "/lazy_nix_helper/lazy_nix_helper.nvim"
          if not vim.loop.fs_stat(lazy_nix_helper_path) then
            vim.fn.system({
              "git",
              "clone",
              "--filter=blob:none",
              "https://github.com/b-src/lazy_nix_helper.nvim.git",
              lazy_nix_helper_path,
            })
          end
        end

        -- add the Lazy Nix Helper plugin to the vim runtime
        vim.opt.rtp:prepend(lazy_nix_helper_path)

        -- call the Lazy Nix Helper setup function
        local non_nix_lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
        local lazy_nix_helper_opts = { lazypath = non_nix_lazypath, input_plugin_table = plugins }
        require("lazy-nix-helper").setup(lazy_nix_helper_opts)

        -- get the lazypath from Lazy Nix Helper
        local lazypath = require("lazy-nix-helper").lazypath()
        if not vim.loop.fs_stat(lazypath) then
          vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable", -- latest stable release
            lazypath,
          })
        end
        vim.opt.rtp:prepend(lazypath)

        <additional config in init.lua>
      '';
    };
  }



# {pkgs, ...}: {
#   programs = {
#     neovim = {
#       enable = true;
#       vimAlias = true;
#       vimdiffAlias = true;
#       withNodeJs = true;
#       plugins = with pkgs.vimPlugins; [
#         # base distro
#         LazyVim
#         conform-nvim
#         nvim-lint
#         markdown-preview-nvim
#         headlines-nvim
#         #
#         #   # theme
#         dracula-nvim
#         #
#         #   # UI
#         bufferline-nvim
#         gitsigns-nvim
#         edgy-nvim
#         dashboard-nvim
#         toggleterm-nvim
#         trouble-nvim
#         lualine-nvim
#         which-key-nvim
#         nvim-web-devicons
#         mini-nvim
#         noice-nvim
#         nui-nvim
#         nvim-notify
#         nvim-lsp-notify
#         neo-tree-nvim
#         nvim-navic
#         dressing-nvim
#         aerial-nvim
#         #
#         #   # project management
#         project-nvim
#         neoconf-nvim
#         persistence-nvim
#         #
#         #   # smart typing
#         indent-blankline-nvim
#         guess-indent-nvim
#         vim-illuminate
#         #
#         #   # LSP
#         nvim-lspconfig
#         rust-tools-nvim
#         crates-nvim
#         null-ls-nvim
#         nvim-lightbulb # lightbulb for quick actions
#         # nvim-code-action-menu # code action menu
#         neodev-nvim
#         SchemaStore-nvim # load known formats for json and yaml
#         #
#         #   # cmp plugins
#         nvim-cmp # completion plugin
#         cmp-buffer # buffer completions
#         cmp-path # path completions
#         cmp_luasnip # snipper completions
#         cmp-nvim-lsp # LSP completions
#         #
#         #   # snippets
#         luasnip # snippet engine
#         friendly-snippets # a bunch of snippets to use
#         #
#         #   # search functionality
#         plenary-nvim
#         telescope-nvim
#         telescope-fzf-native-nvim
#         nvim-spectre
#         flash-nvim
#         #
#         #   # treesitter
#         nvim-treesitter-context
#         nvim-ts-autotag
#         nvim-treesitter-textobjects
#         nvim-treesitter.withAllGrammars
#         #
#         #   # comments
#         nvim-ts-context-commentstring
#         todo-comments-nvim
#         #
#         #   # leap
#         vim-repeat
#         leap-nvim
#         flit-nvim
#         #
#         #   # DAP
#         nvim-dap
#         nvim-dap-ui
#         nvim-dap-virtual-text
#         #
#         #   # neotest
#         neotest
#         neotest-rust
#         #
#         lazy-nvim
#         vim-startuptime
#       ];
#       extraLuaConfig = ''
#         vim.g.mapleader = " " -- Need to set leader before lazy for correct keybindings
#         require("lazy").setup({
#           performance = {
#             reset_packpath = false,
#             rtp = {
#                 reset = false,
#               }
#             },
#           dev = {
#             path = "${pkgs.vimUtils.packDir config.home-manager.users.michzuerch.programs.neovim.finalPackage.passthru.packpathDirs}/pack/myNeovimPackages/start",
#           },
#           install = {
#             -- Safeguard in case we forget to install a plugin with Nix
#             missing = false,
#           },
#         })
#       '';
#       extraPackages = with pkgs; [
#         gcc # needed for nvim-treesitter
#
#         # HTML, CSS, JSON
#         vscode-langservers-extracted
#
#         # LazyVim defaults
#         stylua
#         shfmt
#
#         # Markdown extra
#         nodePackages.markdownlint-cli
#         marksman
#
#         # Docker extra
#         nodePackages.dockerfile-language-server-nodejs
#         hadolint
#         docker-compose-language-service
#
#         # JSON and YAML extras
#         nodePackages.yaml-language-server
#
#         # Custom
#         editorconfig-checker
#         shellcheck
#       ];
#     };
#   };
#   xdg.configFile."nvim/lua" = {
#     recursive = true;
#     source = ./lua;
#   };
# }

