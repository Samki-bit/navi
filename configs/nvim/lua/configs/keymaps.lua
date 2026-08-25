vim.g.mapleader = " "
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set('t', 'jj', [[<C-\><C-n>]], {noremap = true})

-- Navigate between splits
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>")

-- Quit file
vim.keymap.set("n", "<C-q>", "<cmd> q <CR>", {noremap = true})

--Delete line
vim.keymap.set("n", "dl", "d$", {noremap = true})
vim.keymap.set("n", "cl", "c$", {noremap = true})

-- Window management
vim.keymap.set("n", "<leader>v", "<C-w>v")      -- split window vertically
vim.keymap.set("n", "<leader>h", "<C-w>s")      -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=")     -- make split windows equal width & height
vim.keymap.set("n", "<leader>xs", ":close<CR>") -- close current split window

vim.keymap.set('n', '<C-c>', '<cmd>noh<CR>')

-- Move lines up and down in Normal Mode
vim.keymap.set("n", "J", ":m .+1<CR>==")
vim.keymap.set("n", "K", ":m .-2<CR>==")

-- Move lines up and down in Visual Mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
