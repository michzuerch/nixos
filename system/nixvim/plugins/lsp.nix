{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;
      nixvimInjections = true;
      folding = true;
      indent = true;
    };

    treesitter-refactor = {
      enable = true;
      highlightDefinitions = {
        enable = true;
        # Set to false if you have an `updatetime` of ~100.
        clearOnCursorMove = false;
      };
    };

    hmts.enable = true;

    # lspkind = {
    #   enable = true;
    #
    #   cmp = {
    #     enable = true;
    #     menu = {
    #       nvim_lsp = "[LSP]";
    #       nvim_lua = "[api]";
    #       path = "[path]";
    #       luasnip = "[snip]";
    #       buffer = "[buffer]";
    #       neorg = "[neorg]";
    #       cmp_tabby = "[Tabby]";
    #     };
    #   };
    # };

    lsp = {
      enable = true;
      servers = {
        nil-ls.enable = true;
        nixd.enable = true;
        java-language-server.enable = true;
        jsonls.enable = true;
        lua-ls.enable = true;
        #lsp.servers.pylsp.enable = true;
        rust-analyzer.enable = true;
        rust-analyzer.installCargo = false;
        rust-analyzer.installRustc = false;
        tsserver.enable = true;
        yamlls.enable = true;
        astro.enable = true;
        bashls.enable = true;
        cssls.enable = true;
        docker-compose-language-service.enable = true;
      };
    };
  };
}
