vim.o.tabstop        = 2
vim.o.softtabstop    = 2
vim.o.shiftwidth     = 2

local ls = require("luasnip")

ls.add_snippets("lua", {
  ls.parser.parse_snippet("lf", "local function $1 ($2)\n  $0\nend"),
})
