-- setup lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

require("lazy").setup("plugins")
require('autocmds')
require('keybinds')
require('snip')
require('lsp')

-- {{{ options
-- Visual
-- {{{ options
vim.o.termguicolors  = true -- Use true colors, required for some plugins
vim.o.wrap           = true
vim.o.rnu            = true -- Relative numbers
vim.o.number         = true -- numbers
vim.wo.cursorline    = true
vim.o.background     = 'light'
vim.g.have_nerd_font = true

vim.o.hlsearch       = false
vim.o.ignorecase     = true -- Ignore case when using lowercase in search
vim.o.smartcase      = true -- But don't ignore it when using upper case
vim.o.smarttab       = true
vim.o.smartindent    = true
vim.o.expandtab      = true -- Convert tabs to spaces.
vim.o.tabstop        = 4
vim.o.softtabstop    = 4
vim.o.shiftwidth     = 4
vim.o.mouse          = 'a'

vim.o.hidden         = true -- Do not save when switching buffers
vim.o.fileencoding   = 'utf-8'
vim.o.spell          = false
vim.o.spelllang      = 'en_us'
vim.o.completeopt    = 'menuone,noinsert,noselect'
vim.o.timeout        = true
vim.o.timeoutlen     = 300
vim.opt.showmode     = false
vim.opt.undofile     = true
vim.opt.ignorecase   = true
vim.opt.smartcase    = true
vim.opt.updatetime   = 250
vim.opt.scrolloff    = 10
vim.opt.incsearch    = true
vim.opt.wildmenu     = true
vim.opt.wildmode     = 'longest,full' -- Display auto-complete in Command Mode
vim.opt.wildoptions  = 'fuzzy'
vim.opt.path:append('**')
-- }}}

-- }}}

vim.cmd.colorscheme("catppuccin")
