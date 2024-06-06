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
        #lsp.servers.pylsp.enable = true;
        #nil-ls.enable = true;
        astro.enable = true;
        bashls.enable = true;
        cssls.enable = true;
        docker-compose-language-service.enable = true;
        dockerls.enable = true;
        emmet-ls.enable = true;
        eslint.enable = true;
        gopls.enable = true;
        graphql.enable = true;
        html.enable = true;
        htmx.enable = true;
        java-language-server.enable = true;
        jsonls.enable = true;
        lua-ls.enable = true;
        nixd.enable = true;
        rust-analyzer.enable = true;
        rust-analyzer.installCargo = false;
        rust-analyzer.installRustc = false;
        sqls.enable = true;
        svelte.enable = true;
        tailwindcss.enable = true;
        terraformls.enable = true;
        tsserver.enable = true;
        yamlls.enable = true;
      };
    };
  };
}
