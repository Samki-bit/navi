return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').setup()
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { "python", "lua", "javascript", "typescript", "tsx", "json", "yaml", "markdown", "bash", "html", "css" }, -- adjust to your list
      callback = function() vim.treesitter.start() end,
    })
  end,
}
