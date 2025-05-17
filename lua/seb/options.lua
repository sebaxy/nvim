local my_options = {
  backup = false,  -- creates a backup file
  clipboard = "unnamedplus",  -- allows neovim to access the system clipboard
  cmdheight = 1,  -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" },  -- mostly just for cmp
  conceallevel = 0,  -- so that `` is visible in markdown files
  cursorline = true,  -- highlight the current line
  expandtab = true,  -- convert tabs to spaces
  fileencoding = "utf-8",  -- the encoding written to a file
  guifont = "monospace:h17",  -- the font used in graphical neovim applications
  hlsearch = false,  -- highlight all matches on previous search pattern
  ignorecase = true,  -- ignore case in search patterns
  laststatus = 3,
  linebreak = true,
  mouse = "a",  -- allow the mouse to be used in neovim
  number = true,  -- set numbered lines
  numberwidth = 4,  -- set number column width to 2 {default 4}
  pumblend = 10,
  pumheight = 10,  -- pop up menu height
  relativenumber = true,  -- set relative numbered lines
  ruler = false,
  scrolloff = 8,
  shiftwidth = 2,  -- the number of spaces inserted for each indentation
  showcmd = false,
  showmode = false, -- we don't need to see things like -- INSERT,  -- anymore
  showtabline = 1,  -- always show tabs
  sidescrolloff = 8,
  signcolumn = "yes",  -- always show the sign column, otherwise it would shift the text each time
  smartcase = true,  -- smart case
  smartindent = true,  -- make indenting smarter again
  splitbelow = true,  -- force all horizontal splits to go below current window
  splitright = true,  -- force all vertical splits to go to the right of current window
  swapfile = false,  -- creates a swapfile
  tabstop = 2,  -- insert 2 spaces for a tab
  termguicolors = true,  -- set term gui colors (most terminals support this)
  timeoutlen = 1000,  -- time to wait for a mapped sequence to complete (in milliseconds)
  title = true,
  titlelen = 0,  -- do not shorten title
  undofile = true,  -- enable persistent undo
  updatetime = 100,  -- faster completion (4000ms default)
  wrap = false,  -- display lines as one long line
  writebackup = false,  -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
}

for k, v in pairs(my_options) do
  vim.opt[k] = v
end

vim.opt.fillchars = vim.opt.fillchars + "eob: "
vim.opt.fillchars:append {
  stl = " ",
}

vim.opt.shortmess:append "c"

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]

vim.g.netrw_banner = 0
vim.g.netrw_mouse = 2

