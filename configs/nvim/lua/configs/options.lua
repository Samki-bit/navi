vim.opt.shiftwidth = 4   -- Size of an indent
vim.opt.tabstop = 4      -- Number of spaces tabs count for
vim.opt.softtabstop = 4  -- Number of spaces a tab counts for while editing
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
})
vim.opt.number = true    
vim.opt.relativenumber = true


