local map = vim.keymap.set
local opts = { silent = true, remap = true }

-- {{{ quick fix
map('n', '<space>co', '<cmd>copen<cr>', { noremap = true })
map('n', '[q', '<cmd>cprev<cr>', { noremap = true })
map('n', ']q', '<cmd>cnext<cr>', { noremap = true })
-- }}}

-- {{{ diagnostics
map('n', '<space>e', vim.diagnostic.open_float, opts)
map('n', '[d', vim.diagnostic.goto_prev, opts)
map('n', ']d', vim.diagnostic.goto_next, opts)
map('n', '<space>q', vim.diagnostic.setloclist, opts)
-- }}}

-- {{{ window movement
map('n', "<S-Up>", "<cmd>winc k<cr>", opts)
map('n', "<S-Down>", "<cmd>winc j<cr>", opts)
map('n', "<S-Left>", "<cmd>winc h<cr>", opts)
map('n', "<S-Right>", "<cmd>winc l<cr>", opts)
-- }}}

map('n', '<C-s>', '<cmd> source %<cr>', opts)

-- {{{ tabbing
map('n', '<M-,>', '<cmd>tabprev<cr>', opts)
map('n', '<M-.>', '<cmd>tabnext<cr>', opts)
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

-- {{{ grep
map('n', '<leader>g', ':grep ', { noremap = true })
-- }}}

-- {{{ telescope
map('n', '<leader>f', '<cmd>Telescope find_files<cr>', opts)
map('n', '<leader>g', '<cmd>Telescope live_grep<cr>', opts)
map('n', '<leader>s', '<cmd>Telescope grep_string<cr>', opts)
map('n', '<leader>b', '<cmd>Telescope buffers<cr>', opts)
-- }}}

local function toggle_background()
    local b = vim.o.background
    if b == 'dark' then
        b = 'light'
    else
        b = 'dark'
    end
    vim.o.background = b
end

map('n', '<leader>t', function() toggle_background() end, opts)

local function restart_lsp()
    local clients = vim.lsp.get_active_clients()
    vim.lsp.stop_client(clients)
    vim.cmd(":edit")
    print("lsp restarted")
end

map('n', '<leader>lr', function() restart_lsp() end, opts)

-- {{{ luasnip
local ls = require('luasnip')
map({'i'}, '<C-K>', function() ls.expand() end, {silent = true})
map({'i', 's'}, "<C-L>", function() ls.jump(1) end, {silent = true})
map({'i', 's'}, '<C-J>', function() ls.jump(-1) end, {silent = true})

map({'i', 's'}, '<C-E>', function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end, {silent = true})
-- }}}
