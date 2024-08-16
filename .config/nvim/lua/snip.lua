local ls = require("luasnip")

ls.add_snippets("all", {
    ls.parser.parse_snippet("expand", "-- this is what was expected!"),
})

ls.add_snippets("lua", {
    ls.parser.parse_snippet("lf", "local function $1 ($2)\n  $0\nend"),
})

ls.add_snippets("go", {
    ls.parser.parse_snippet("nil", "if err $1 nil {\n    $0\n}"),
    ls.parser.parse_snippet("if", "if $1 {\n    $0\n}"),
    ls.parser.parse_snippet("func", "func $1($2) $3 {\n    $0\n}"),
})
