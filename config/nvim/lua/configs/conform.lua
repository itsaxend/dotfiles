local options = {
  format_on_save = {
    timeout_ms = 3000,
    lsp_fallback = true,
  },

  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
    go = { "gofmt" },
    sh = { "shfmt" },
  },
}

return options
