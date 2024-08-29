return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'BurntSushi/ripgrep',
    'sharkdp/fd',
    'nvim-telescope/telescope-fzf-native.nvim'
  },
  config = function()
    require('telescope').setup {
      defaults = {
        preview = false
      }
    }
    require('telescope').load_extension('fzf')
  end
}
