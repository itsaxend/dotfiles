require("nvchad.configs.lspconfig").defaults()

-- config server
vim.lsp.config("nginx_language_server", {})

-- enable servers
vim.lsp.enable({
  "html",
  "cssls",
  "nginx_language_server",
})

