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

    sh = { "shfmt" },
    bash = { "shfmt" },
    zsh = { "shfmt" },
    dotenv = { "shfmt" },

    nginx = { "nginxfmt" },
  },

  formatters = {
    nginxfmt = {
      command = "nginxfmt",
      stdin = true,
    },
  },
}

return options
