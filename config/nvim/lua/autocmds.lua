require "nvchad.autocmds"

-- Redirect NvChad LSP formatting to conform.nvim
---@diagnostic disable-next-line: duplicate-set-field
vim.lsp.buf.format = function(opts)
  opts = opts or {}
  require("conform").format {
    async = opts.async,
    timeout_ms = opts.timeout_ms,
    lsp_fallback = true,
  }
end

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = {
    "nginx.conf",
    "*.nginx",
    "sites-enabled/*",
    "sites-available/*",
  },
  callback = function()
    vim.bo.filetype = "nginx"
  end,
})
