require "nvchad.autocmds"

-- Redirect NvChad LSP formatting to conform.nvim
---@diagnostic disable-next-line: duplicate-set-field
vim.lsp.buf.format = function(opts)
  opts = opts or {}
  require("conform").format({
    async = opts.async,
    timeout_ms = opts.timeout_ms,
    lsp_fallback = true,
  })
end
