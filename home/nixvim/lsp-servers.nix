{...}: {
  programs = {
    nixvim = {
      plugins = {
        lsp.servers.nixd.enable = true;
        lsp.servers.cssls.enable = true;
        lsp.servers.java-language-server.enable = true;
        lsp.servers.jsonls.enable = true;
        lsp.servers.lua-ls.enable = true;
        #lsp.servers.pylsp.enable = true;
        lsp.servers.rust-analyzer.enable = true;
        lsp.servers.rust-analyzer.installCargo = true;
        lsp.servers.rust-analyzer.installRustc = true;
        lsp.servers.tsserver.enable = false;
        lsp.servers.yamlls.enable = true;
        lsp.servers.efm.enable = true;

        #michzuerch new servers
        lsp.servers.astro.enable = true;
        lsp.servers.cmake.enable = true;
        lsp.servers.docker-compose-language-service.enable = true;
        lsp.servers.dockerls.enable = true;
        lsp.servers.emmet_ls.enable = true;
        lsp.servers.gopls.enable = true;
        lsp.servers.golangci-lint-ls.enable = true;
        lsp.servers.graphql.enable = true;
        lsp.servers.html.enable = true;
        lsp.servers.htmx.enable = true;
        lsp.servers.sqls.enable = true;
        lsp.servers.svelte.enable = true;
        lsp.servers.tailwindcss.enable = true;
        lsp.servers.terraformls.enable = true;


      };
    };
  };
}
