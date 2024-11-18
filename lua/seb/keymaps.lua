local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<C-i>", "<C-i>", opts)

-- Utils
keymap("n", "<leader>aa", "gg<S-v>G", opts) -- select all
keymap("n", "<C-s>", ":w!<CR>", opts) -- save
keymap("n", "<C-x>", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- find & replace under the cursor
keymap({"n", "v"}, "<leader>d", "\"_d") -- delete into void

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-tab>", "<c-6>", opts)

-- Tmux window navigation
keymap("n", "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>", opts)
keymap("n", "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>", opts)
keymap("n", "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>", opts)
keymap("n", "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>", opts)
-- keymap("n", "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>") ,

-- Resize with arrows
keymap({ "n", "v", "i" }, "<C-w><Up>", ":resize +2<CR>", opts)
keymap({ "n", "v", "i" }, "<C-w><down>", ":resize -2<CR>", opts)
keymap({ "n", "v", "i" }, "<C-w><left>", ":vertical resize +2<CR>", opts)
keymap({ "n", "v", "i" }, "<C-w><right>", ":vertical resize -2<CR>", opts)

-- Cursor position after action
keymap("n", "n", "nzz", opts) -- in the middle
keymap("n", "N", "Nzz", opts)
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

keymap("n", "<s-j>", "mzJ`z", opts) -- in place

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- paste over into void 
keymap("x", "p", [["_dP]])

vim.cmd [[:amenu 10.100 mousemenu.Goto\ Definition <cmd>lua vim.lsp.buf.definition()<CR>]]
vim.cmd [[:amenu 10.110 mousemenu.References <cmd>lua vim.lsp.buf.references()<CR>]]
-- vim.cmd [[:amenu 10.120 mousemenu.-sep- *]]

vim.keymap.set("n", "<RightMouse>", "<cmd>:popup mousemenu<CR>")
vim.keymap.set("n", "<Tab>", "<cmd>:popup mousemenu<CR>")

-- Moving around
keymap({ "n", "o", "x" }, "<s-h>", "^", opts)
keymap({ "n", "o", "x" }, "<s-l>", "g_", opts)

-- Moving lines
keymap("i", "<m-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("i", "<m-k>", "<Esc>:m .-2<CR>==gi", opts)
keymap("n", "<m-j>", ":m .+1<CR>==", opts)
keymap("n", "<m-k>", ":m .-2<CR>==", opts)
keymap("v", "<m-j>", ":m '>+1<CR>gv-gv", opts)
keymap("v", "<m-k>", ":m '<-2<CR>gv-gv", opts)

-- tailwind bearable to work with
keymap({ "n", "x" }, "j", "gj", opts)
keymap({ "n", "x" }, "k", "gk", opts)
keymap("n", "<leader>w", ":lua vim.wo.wrap = not vim.wo.wrap<CR>", opts)


vim.api.nvim_set_keymap('t', '<C-;>', '<C-\\><C-n>', opts)
