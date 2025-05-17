local M = {
  "nvim-lualine/lualine.nvim",
}

function M.config()
  -- local icons = require "seb.icons"
  -- local diff = {
  --   "diff",
  --   colored = false,
  --   symbols = { added = icons.git.LineAdded, modified = icons.git.LineModified, removed = icons.git.LineRemoved }, -- Changes the symbols used by the diff.
  -- }

  local diagnostics = {
    "diagnostics",
    sections = { "error", "warn" },
    colored = false, -- Displays diagnostics status in color if set to true.
    always_visible = true, -- Show diagnostics even if there are none.
  }

  local clients_lsp = function ()
    local clients = vim.lsp.get_clients { bufnr = 0 }
    if next(clients) == nil then
      return ''
    end
    local c = {}
    for _, client in pairs(clients) do
      if client.name ~= 'null-ls' then
        table.insert(c, client.name)
      end
    end
    return '[' .. table.concat(c, ', ') .. ']'
  end

  local filetype = {
    function()
      local filetype = vim.bo.filetype
      local upper_case_filetypes = {
        "json",
        "jsonc",
        "yaml",
        "toml",
        "css",
        "scss",
        "html",
        "xml",
      }

      if vim.tbl_contains(upper_case_filetypes, filetype) then
        return filetype:upper()
      end

      return filetype
    end,
  }

  local my_bg = ""
  local my_fg = ""
  if vim.env.USER == "root" then
    my_bg = "#f7768e"
    my_fg = "#ffffff"
  else
    my_bg = "#16161e"
    my_fg = "#7aa2f7"
  end

  local xx = require("lunar")
  require("lualine").setup {
    options = {
      -- component_separators = { left = "", right = "" },
      -- section_separators = { left = "", right = "" },
      -- component_separators = { left = "", right = "" },
      -- section_separators = { left = "", right = "" },
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },

      ignore_focus = { "NvimTree" },
    },
    sections = {
      -- lualine_a = { {"branch", icon =""} },
      -- lualine_b = { diff },
      -- lualine_c = { "diagnostics" },
      -- lualine_x = { copilot },
      -- lualine_z = { "progress" },
      -- lualine_a = { "mode" },
      lualine_a = {},
      lualine_b = { "branch" },
      lualine_c = { diagnostics },
      -- lualine_c = { diagnostics },
      -- lualine_x = { diff, "copilot", filetype },
      lualine_x = { filetype, { clients_lsp, color = { gui = "bold" }} },
      -- lualine_y = { "filetype" },
      lualine_y = { { "location", color = { bg = my_bg, fg = my_fg } }, { "progress", color = { bg = my_bg, fg = my_fg } } },
      lualine_z = {},
    },
    extensions = { "quickfix", "man", "fugitive", "oil" },
    -- extensions = { "quickfix", "man", "fugitive" },
  }
end

return M
