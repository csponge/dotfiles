vim.api.nvim_create_autocmd('TermOpen', {
    pattern = "*",
    callback = function(args)
        vim.o.rnu    = false -- Relative numbers
        vim.o.number = false -- numbers
    end
})
