local on_attach = function(client, bufnr)
  local map = vim.keymap.set

  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  -- Telescope keybinds
  map('n', 'gi', vim.lsp.buf.implementation, bufopts)
  map('n', 'gr', vim.lsp.buf.references, bufopts)
  map('n', 'gd', vim.lsp.buf.definition, bufopts)
  map('n', '<leader>o', vim.lsp.buf.workspace_symbol, bufopts)

  map('n', '<S-k>', vim.lsp.buf.hover, bufopts)
  map('n', 'gs', vim.lsp.buf.signature_help, bufopts)
  map('n', '<leader>r', vim.lsp.buf.rename, bufopts)
  map('n', '<leader>a', vim.lsp.buf.code_action, bufopts)
  map('n', '<leader>d', function() vim.lsp.buf.format { async = true } end, bufopts)
end

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    on_attach(args.data.client_id, args.buf)
  end,
})

return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require('lspconfig')
    local servers = { 'pyright', 'clangd', 'lua_ls', 'gopls' }

    for _, v in pairs(servers) do
      lspconfig[v].setup {}
    end

  end
}
