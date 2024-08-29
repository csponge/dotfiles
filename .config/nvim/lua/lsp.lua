local on_attach = function(client, bufnr)
  local map = vim.keymap.set

  -- enable some settings
  vim.lsp.inlay_hint.enable()

  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  -- Telescope keybinds
  map('n', 'gi', '<cmd> Telescope lsp_implementations theme=dropdown<cr>', bufopts)
  map('n', 'gr', '<cmd>Telescope lsp_references theme=dropdown<cr>', bufopts)
  map('n', 'gd', '<cmd>Telescope lsp_definitions theme=dropdown<cr>', bufopts)
  map('n', '<leader>o', '<cmd>Telescope lsp_document_symbols theme=dropdown<cr>', bufopts)

  map('n', '<S-k>', vim.lsp.buf.hover, bufopts)
  map('n', 'gs', vim.lsp.buf.signature_help, bufopts)
  map('n', '<leader>r', vim.lsp.buf.rename, bufopts)
  map('n', '<leader>a', vim.lsp.buf.code_action, bufopts)
  map('n', '<leader>d', function() vim.lsp.buf.format { async = true } end, bufopts)
end

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = { "*.c", "*.h", "*.cpp", "*.cc" },
  callback = function(args)
    vim.lsp.start({
      name = 'clangd',
      cmd = { 'clangd' },
      root_dir = vim.fs.dirname(vim.fs.find({ '.git', 'makefile', 'CMakeLists.txt' }, { upward = true })[1]),
    })
  end
})

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = { "*.lua" },
  callback = function(args)
    vim.lsp.start({
      name = 'lua-language-server',
      cmd = { 'lua-language-server' },
      root_dir = vim.fs.dirname(vim.fs.find({ '.git' }, { upward = true })[1]),
    })
  end
})

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = { '*.ml' },
  callback = function(args)
    vim.cmd("set makeprg=dune\\ build")
    vim.lsp.start({
      name = 'ocamllsp',
      cmd = { 'ocamllsp' },
      root_dir = vim.fs.dirname(vim.fs.find({ '.git', 'dune-project' }, { upward = true })[1]),
    })
  end
})

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = { "*.go" },
  callback = function(args)
    vim.lsp.start({
      name = 'gopls',
      cmd = { 'gopls' },
      root_dir = vim.fs.dirname(vim.fs.find({ '.git', 'go.mod' }, { upward = true })[1]),
    })
  end
})

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = { "*.ts", "*.js", "*.tsx" },
  callback = function(args)
    vim.lsp.start({
      name = 'typescript-language-server',
      cmd = { 'typescript-language-server' },
      root_dir = vim.fs.dirname(vim.fs.find({ '.git', 'go.mod' }, { upward = true })[1]),
    })
  end
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    on_attach(args.data.client_id, args.buf)
  end,
})
