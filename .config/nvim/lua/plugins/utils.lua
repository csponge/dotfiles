return {
  {
    'stevearc/oil.nvim',
    opts = {
      default_file_explorer = true,
    }
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup {}
    end
  }
}
