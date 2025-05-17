local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
}

function M.config()
  local mappings = {
    { "<leader>aa", "gg<S-v>G", hidden = true }, -- select all
    { "<leader>q", "<cmd>confirm q<CR>", desc = "Quit" },
    { "<leader>h", "<cmd>nohlsearch<CR>", desc = "NOHL" },
    { "<leader>b", group = "Buffers"},
      { "<leader>bn",  "<cmd>bnext<CR>", desc = "Next" },
      { "<leader>bp",  "<cmd>bprevious<CR>", desc = "Previous" },
    { "<leader>d", group = "Debug" },
    { "<leader>f", group = "Find" },
    { "<leader>g", group = "Git" },
    { "<leader>l", group = "LSP" },
    { "<leader>p", group = "Plugins" },
--    t = { name = "Test" },
    { "<leader>T", group = "Treesitter" },
    { "<leader>a", group = "Tab" },
      {  "<leader>an",  "<cmd>$tabnew<cr>", desc = "New Empty Tab" },
      {  "<leader>aN",  "<cmd>tabnew %<cr>", desc = "New Tab" },
      {  "<leader>ao",  "<cmd>tabonly<cr>", desc = "Only" },
      {  "<leader>ah",  "<cmd>-tabmove<cr>", desc = "Move Left" },
      {  "<leader>al",  "<cmd>+tabmove<cr>", desc = "Move Right" },
  }

  local which_key = require "which-key"
  which_key.setup {
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
      presets = {
        operators = false,
        motions = false,
        text_objects = false,
        windows = false,
        nav = false,
        z = false,
        g = false,
      },
    },
    win = {
      border = "rounded",
      no_overlap = false,
      padding = { 2, 2, 2, 2 },
      title = false,
      title_pos = "center",
      zindex = 1000,
    },
    show_help = false,
    show_keys = false,
    disable = {
      buftypes = {},
      filetypes = { "TelescopePrompt" },
    },
  }

  local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
  }

  which_key.add(mappings, opts)
end

return M
