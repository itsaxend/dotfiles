return {
  "ojroques/nvim-osc52",
  lazy = false,
  config = function()
    local osc52 = require("osc52")
    osc52.setup {
      max_length = 0,
      silent = true,
      trim = true,
      tmux_passthrough = true,
    }

    -- Copy in visual mode
    vim.keymap.set("v", "<leader>c", osc52.copy_visual, { desc = "Copy with OSC52" })

    -- Auto copy on yank
    vim.api.nvim_create_autocmd("TextYankPost", {
      callback = function()
        if vim.v.event.operator == "y" and vim.v.event.regname == "" then
          osc52.copy_register('"')
        end
      end,
    })
  end,
}

