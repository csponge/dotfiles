local map = vim.keymap.set
local opts = { silent = true, remap = true }

-- {{{ quick fix
map('n', '<space>co', '<cmd>copen<cr>', { noremap = true })
map('n', '[q', '<cmd>cprev<cr>', { noremap = true })
map('n', ']q', '<cmd>cnext<cr>', { noremap = true })
-- }}}

-- {{{ diagnostics
map('n', '<space>e', vim.diagnostic.open_float, opts)
map('n', '<C-,>', vim.diagnostic.goto_prev, opts)
map('n', '<C-.>', vim.diagnostic.goto_next, opts)
map('n', '<space>q', vim.diagnostic.setloclist, opts)
-- }}}

-- {{{ window movement
map('n', "<C-Up>", "<cmd>winc k<cr>", opts)
map('n', "<C-Down>", "<cmd>winc j<cr>", opts)
map('n', "<C-Left>", "<cmd>winc h<cr>", opts)
map('n', "<C-Right>", "<cmd>winc l<cr>", opts)
-- }}}

map('n', '<C-s>', '<cmd> source %<cr>', opts)

-- {{{ tabbing
map('n', '<M-t>', '<cmd>tabnew<cr>', opts)
map('n', '<M-,>', '<cmd>tabprev<cr>', opts)
map('n', '<M-.>', '<cmd>tabnext<cr>', opts)
-- }}}

-- {{{ term
map('n', '<C-t>', '<cmd>term<cr>', opts)
-- }}}

-- {{{ navigation
map("n", "-", "<cmd>Oil<cr>", opts)
-- }}}

-- {{{ compiling
map('n', '<leader>cc', '<cmd>make<cr>', { desc = 'Compile' })
map('n', '<leader>co', '<cmd>copen<cr>', { desc = 'Open compile errors' })
map('n', '<leader>cn', '<cmd>cnext<cr>', { desc = 'Open compile errors' })
map('n', '<leader>cp', '<cmd>cprevious<cr>', { desc = 'Open compile errors' })
-- }}}

-- {{{ searching
map('n', '<leader>g', ':grep ', { noremap = true })
map('n', '<leader>f', ':find ', { noremap = true})
map('n', '<leader>b', ':buffer ', { noremap = true})
-- }}}

-- {{{ luasnip
local ls = require('luasnip')

map('n', '<leader><leader>s', "<cmd> source /home/colten/.config/nvim/lua/snip.lua<cr>", opts)

map({ 'i' }, '<C-k>', function() ls.expand() end, { silent = true })
map({ 'i', 's' }, "<C-n>", function() ls.jump(1) end, { silent = true })
map({ 'i', 's' }, '<C-p>', function() ls.jump(-1) end, { silent = true })

map({ 'i', 's' }, '<C-e>', function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { silent = true })
-- }}}
