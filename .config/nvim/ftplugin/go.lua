vim.o.tabstop        = 4
vim.o.softtabstop    = 4
vim.o.shiftwidth     = 4

local ls = require("luasnip")

ls.add_snippets("go", {
  ls.parser.parse_snippet("nil", "if err $1 nil {\n    $0\n}"),
  ls.parser.parse_snippet("if", "if $1 {\n    $0\n}"),
  ls.parser.parse_snippet("func", "func $1($2) $3 {\n    $0\n}"),
})
