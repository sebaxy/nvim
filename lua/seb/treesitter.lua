local M = {
  "nvim-treesitter/nvim-treesitter",
  -- event = { "BufReadPost", "BufNewFile" },
  -- build = ":TSUpdate",
  dependencies = {
    {
      -- event = "VeryLazy",
    },
  },
}

function M.config()
  local wk = require "which-key"
  wk.add({
    { "<leader>Ti", "<cmd>TSConfigInfo<CR>", desc = "Info" },
  })

  require("nvim-treesitter.configs").setup {
    ensure_installed = { "lua", "markdown", "markdown_inline", "bash", "python" }, -- put the language you want in this array
    ignore_install = { "" },
    sync_install = false,
    highlight = {
      enable = true,
      -- disable = { "markdown" },
      additional_vim_regex_highlighting = false,
    },
    auto_install = true,
    modules = {},
    indent = {
      enable = true,
      disable = { "yaml" },
    },
    autopairs = { enable = true },
  }
end

return M
