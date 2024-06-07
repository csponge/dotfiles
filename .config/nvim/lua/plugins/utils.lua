return {
  'nvim-lua/plenary.nvim',
  'BurntSushi/ripgrep',
  'sharkdp/fd',
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make'
  },
  {
    'stevearc/oil.nvim',
    opts = {
      default_file_explorer = true,
    }
  }
}
