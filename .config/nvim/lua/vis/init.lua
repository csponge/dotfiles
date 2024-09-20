local M = {}

local palette = {
  -- base colors
  background = "#141414",
  background_lighter = "#222222",
  separator = "#1f1f1f",
  foreground = "#d3dedb",
  dimmed = "#696969",

  -- main colors

  -- red
  salmon = "#FFBDB7",
  light_red = "#FF9B9B",
  red = "#FF2A2D",

  -- slate
  light_slate = "#99a58b",
  slate = "#b2b568",

  -- green
  green = "#55a046",

  -- orange
  light_orange = "#FFD69D",
  orange = "#FFB372",
  dark_orange = "#fe7c02",

  -- blue
  dark_blue = "#465571",
  light_blue = "#5597c9",

  -- purple
  purple = "#CBC3E3",
  pale = "#FFE3E3",

  -- yellow
  yellow = "#FFFF80",
  gold = "#e4b80e",

  -- diff
  diff_green = "#5f875f",
  diff_change = "#5f87af",
  diff_text = "#c6c6c6",
  diff_delete = "#af5faf",
}

local highlights2 = {
  Normal = { fg = palette.foreground, bg = palette.background },
  EndOfBuffer = { fg = palette.light_blue, bg = "NONE" },
  StatusLine = { fg = palette.separator, bg = palette.slate },
  StatusLineNC = { fg = palette.separator, bg = palette.slate },
  StatusLineTerm = { fg = palette.separator, bg = palette.slate },
  StatusLineTermNC = { fg = palette.separator, bg = palette.slate },
  VertSplit = { fg = palette.separator, bg = palette.slate },
  PmenuSel = { fg = palette.background, bg = palette.slate },
  Pmenu = { fg = "NONE", bg = palette.separator },
  PmenuSbar = { fg = "NONE", bg = palette.background },
  PmenuThumb = { fg = "NONE", bg = palette.yellow },
  CurSearch = { fg = palette.separator, bg = palette.light_red },
  TabLineSel = { fg = palette.background, bg = palette.slate },
  TabLine = { fg = palette.pale, bg = palette.separator },
  TabLineFill = { fg = palette.light_blue, bg = palette.separator },
  ToolbarLine = { fg = "NONE", bg = "NONE" },
  ToolbarButton = { fg = palette.background, bg = palette.yellow },
  NonText = { fg = palette.pale, bg = "NONE", },
  SpecialKey = { fg = palette.dark_orange, bg = "NONE", },
  QuickFixLine = { fg = palette.separator, bg = palette.light_blue },
  Folded = { fg = palette.grey, bg = palette.black },
  FoldColumn = { fg = palette.light_blue, bg = palette.separator },
  CursorLine = { fg = "NONE", bg = palette.separator },
  CursorColumn = { fg = "NONE", bg = palette.separator },
  ColorColumn = { fg = "NONE", bg = palette.separator },
  CursorLineNr = { fg = "NONE", bg = palette.separator },
  Visual = { fg = "NONE", bg = palette.dark_blue },
  SignColumn = { fg = "NONE", bg = palette.background },
  VisualNOS = { fg = palette.yellow, bg = palette.green },
  LineNr = { fg = palette.foreground, bg = "NONE" },
  Error = { fg = palette.red, bg = palette.background },
  ErrorMsg = { fg = palette.red, bg = palette.background },
  ModeMsg = { fg = palette.background, bg = palette.yellow },
  WarningMsg = { fg = palette.yellow, bg = "NONE" },
  MoreMsg = { fg = palette.green, bg = "NONE" },
  Question = { fg = palette.yellow, bg = "NONE" },
  MatchParen = { bold = true },
  Search = { fg = palette.background, bg = palette.orange },
  IncSearch = { fg = palette.background, bg = palette.orange },
  Todo = { fg = palette.orange, bg = "NONE" },
  WildMenu = { fg = palette.background, bg = palette.yellow },
  Underlined = { fg = palette.light_blue, bg = "NONE" },
  Cursor = { fg = palette.salmon, bg = palette.yellow },
  lCursor = { fg = palette.background, bg = palette.red },
  SpellBad = { fg = palette.red, bg = "NONE" },
  SpellCap = { fg = palette.gold, bg = "NONE" },
  SpellLocal = { fg = palette.red, bg = "NONE" },
  SpellRare = { fg = palette.light_orange, bg = "NONE" },
  Comment = { fg = palette.green, italic = true },
  String = { fg = palette.light_orange, bg = "NONE" },
  Identifier = { fg = palette.slate, bg = "NONE" },
  Function = { fg = palette.dark_orange, bg = "NONE" },
  Special = { fg = palette.dark_orange, bg = "NONE" },
  Statement = { fg = palette.purple },
  Constant = { fg = palette.slate, bg = "NONE" },
  PreProc = { fg = palette.orange, bg = "NONE" },
  Type = { fg = palette.purple, bg = "NONE" },
  Operator = { fg = palette.pale, bg = "NONE" },
  Define = { fg = palette.orange, bg = "NONE" },
  Structure = { fg = palette.purple, bg = "NONE" },
  Directory = { fg = palette.slate, bg = "NONE" },
  Conceal = { fg = palette.separator, bg = "NONE" },
  Ignore = { fg = "NONE", bg = "NONE" },
  Title = { fg = palette.yellow, bg = "NONE" },
  DiffAdd = { fg = palette.pale, bg = palette.diff_green },
  DiffChange = { fg = palette.pale, bg = palette.diff_change },
  DiffText = { fg = palette.pale, bg = palette.diff_text },
  DiffDelete = { fg = palette.pale, bg = palette.diff_delete },
  Keyword = { fg = palette.light_blue },
  Number = { fg = palette.foreground },
  Substitute = { fg = palette.separator, bg = palette.orange },
  -- CursorIM	Like Cursor, but used when in IME mode.
  CursorIM = { link = "Cursor" },
  -- NormalFloat	Normal text in floating windows.
  NormalFloat = { fg = palette.foreground, bg = palette.background_lighter },
  -- FloatBorder	Border of floating windows.
  FloatBorder = { fg = palette.slate, bg = palette.slate },
  -- FloatTitle	Title of floating windows.
  FloatTitle = { fg = palette.dimmed, bg = palette.background_lighter, bold = true },
  -- FloatFooter	Footer of floating windows.
  FloatFooter = { fg = palette.dimmed, bg = palette.background_lighter },
  -- NormalNC	Normal text in non-current windows.
  NormalNC = { link = "Normal" },
  -- PmenuKind	Popup menu: Normal item "kind".
  PmenuKind = { fg = palette.dimmed, bg = palette.background_lighter },
  -- PmenuKindSel	Popup menu: Selected item "kind".
  PmenuKindSel = { fg = palette.background, bg = palette.slate },
  -- PmenuExtra	Popup menu: Normal item "extra text".
  PmenuExtra = { fg = palette.foreground, bg = palette.background_lighter },
  -- PmenuExtraSel	Popup menu: Selected item "extra text".
  PmenuExtraSel = { fg = palette.background, bg = palette.slate },
  -- PmenuSbar	Popup menu: Scrollbar.
  cBlock = { fg = palette.dark_orange },

  -- lsp
  ["@keyword"] = { link = "Keyword" },
  ["@lsp.type.keyword"] = { link = "Keyword" },
  ["@lsp.type.macro"] = { link = "Macro" },
  ["@lsp.type.method"] = { fg = palette.dark_orange },        -- Function
  ["@lsp.type.namespace"] = { link = "@module" },             -- Structure
  ["@lsp.type.parameter"] = { link = "@variable.parameter" }, -- Identifier
  ["@lsp.type.property"] = { link = "Identifier" },
  ["@lsp.type.struct"] = { link = "Structure" },
  ["@lsp.type.type"] = { link = "Type" },
  -- ["@lsp.type.typeParameter"] = { link = "TypeDef" },
  ["@lsp.type.variable"] = { fg = palette.slate }, -- Identifier
  ["@lsp.type.comment"] = { link = "Comment" },    -- Comment


  ["@lsp.type.selfParameter"] = { link = "@variable.builtin" },
  -- ["@lsp.type.builtinConstant"] = { link = "@constant.builtin" },
  ["@lsp.type.builtinConstant"] = { link = "@constant.builtin" },
  ["@lsp.type.magicFunction"] = { link = "@function.builtin" },


  ["@lsp.mod.readonly"] = { link = "Constant" },
  ["@lsp.mod.typeHint"] = { link = "Type" },
  -- ["@lsp.mod.defaultLibrary"] = { link = "Special" },
  -- ["@lsp.mod.builtin"] = { link = "Special" },


  ["@lsp.typemod.operator.controlFlow"] = { link = "@keyword.exception" },
  ["@lsp.typemod.keyword.documentation"] = { link = "Special" },

  ["@lsp.typemod.variable.global"] = { link = "Constant" },
  ["@lsp.typemod.variable.static"] = { link = "Constant" },
  ["@lsp.typemod.variable.defaultLibrary"] = { link = "Special" },

  ["@lsp.typemod.function.builtin"] = { link = "@function.builtin" },
  ["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
  ["@lsp.typemod.method.defaultLibrary"] = { link = "@function.builtin" },

  ["@lsp.typemod.operator.injected"] = { link = "Operator" },
  ["@lsp.typemod.string.injected"] = { link = "String" },
  ["@lsp.typemod.variable.injected"] = { link = "@variable" },

  ["@lsp.typemod.function.readonly"] = { fg = palette.salmon, bold = true },

  ["@lsp.type.enum"] = { fg = palette.light_slate },
  ["@lsp.type.enumMember"] = { fg = palette.dark_orange },

  LspInlayHint = { bg = "NONE", fg = palette.dimmed },

  LspReferenceText = { bg = palette.purple },
  LspReferenceRead = { link = "LspReferenceText" },
  LspReferenceWrite = { bg = palette.purple, underline = true },

  DiagnosticError = { fg = palette.red },
  DiagnosticWarn = { fg = palette.orange },
  DiagnosticInfo = { fg = palette.light_blue },
  DiagnosticHint = { fg = palette.yellow },
  DiagnosticOk = { fg = palette.green },

  DiagnosticFloatingError = { link = "DiagnosticError" },
  DiagnosticFloatingWarn = { link = "DiagnosticWarn" },
  DiagnosticFloatingInfo = { link = "DiagnosticInfo" },
  DiagnosticFloatingHint = { link = "DiagnosticHint" },
  DiagnosticFloatingOk = { link = "DiagnosticOk" },

  DiagnosticSignError = { fg = palette.red, bg = palette.base0 },
  DiagnosticSignWarn = { fg = palette.orange, bg = palette.base0 },
  DiagnosticSignInfo = { fg = palette.light_blue, bg = palette.base0 },
  DiagnosticSignHint = { fg = palette.light_blue, bg = palette.base0 },

  DiagnosticVirtualTextError = { link = "DiagnosticError" },
  DiagnosticVirtualTextWarn = { link = "DiagnosticWarn" },
  DiagnosticVirtualTextInfo = { link = "DiagnosticInfo" },
  DiagnosticVirtualTextHint = { link = "DiagnosticHint" },

  DiagnosticUnderlineError = { undercurl = true, sp = palette.red },
  DiagnosticUnderlineWarn = { undercurl = true, sp = palette.orange },
  DiagnosticUnderlineInfo = { undercurl = true, sp = palette.light_blue },
  DiagnosticUnderlineHint = { undercurl = true, sp = palette.light_blue },

  LspSignatureActiveParameter = { fg = palette.orange },
  LspCodeLens = { fg = palette.pale },

  -- vcs
  diffAdded = { fg = palette.green },
  diffRemoved = { fg = palette.red },
  diffDeleted = { fg = palette.red },
  diffChanged = { fg = palette.red },
  diffOldFile = { fg = palette.red },
  diffNewFile = { fg = palette.green },
  -- diffFile = { fg = c.steelGray },
  -- diffLine = { fg = c.steelGray },
  -- diffIndexLine = { link = 'Identifier' },

  -- ["@lsp.type.class"] = { link = "Structure" },
  -- ["@lsp.type.decorator"] = { link = "Function" },
  -- ["@lsp.type.enum"] = { link = "Structure" },
  -- ["@lsp.type.enumMember"] = { link = "Constant" },
  -- ["@lsp.type.function"] = { link = "Function" },
  -- ["@lsp.type.interface"] = { link = "Structure" },
  -- ["@lsp.type.typeParameter"] = { link = "TypeDef" },

  -- ["@lsp.type.builtinConstant"] = { link = "@constant.builtin" },


  -- ["@lsp.mod.defaultLibrary"] = { link = "Special" },
  -- ["@lsp.mod.builtin"] = { link = "Special" },


  --  Character	a character constant: 'c', '\n'
  Character = { link = "String" },
  --  Number		a number constant: 234, 0xff
  --  Boolean	a boolean constant: TRUE, false
  Boolean = { fg = palette.light_blue, bold = true },
  --  Float		a floating point constant: 2.3e10
  Float = { link = "Number" },

  -- *Identifier	any variable name
  -- *Underlined	text that stands out, HTML links
  -- Underlined = { fg = theme.syn.special1, underline = true },
  Bold = { bold = true },
  Italic = { italic = true },

  qfLineNr = { link = "lineNr" },
  qfFileName = { link = "Directory" },

  -- htmlH1 = {},
  -- htmlH2 = {},

  -- mkdHeading = {},
  -- mkdCode = {},
  -- mkdCodeDelimiter = {},
  -- mkdCodeStart = {},
  -- mkdCodeEnd = {},
  -- mkdLink = {},

  -- markdownHeadingDelimiter = {},
  -- markdownCode = { fg = theme.syn.string },
  -- markdownCodeBlock = { fg = theme.syn.string },
  -- markdownEscape = { fg = "NONE" },
  -- markdownH1 = {},
  -- markdownH2 = {},
  -- markdownLinkText = {},

  -- @variable                       various variable names
  ["@variable"] = { fg = palette.slate },
  -- @variable.builtin (Special)     built-in variable names (e.g. `this`, `self`)
  ["@variable.builtin"] = { fg = palette.purple, italic = true },
  -- @variable.parameter             parameters of a function
  ["@variable.parameter"] = { fg = palette.yellow },
  -- @variable.parameter.builtin     special parameters (e.g. `_`, `it`)
  -- @variable.member                object and struct fields
  ["@variable.member"] = { fg = palette.light_blue },
  --
  -- @constant (Constant)              constant identifiers
  -- @constant.builtin       built-in constant values
  -- @constant.macro         constants defined by the preprocessor
  --
  -- @module (Structure)      modules or namespaces
  -- @module.builtin         built-in modules or namespaces
  -- @label                  `GOTO` and other labels (e.g. `label:` in C), including heredoc labels
  --
  -- @string                 string literals
  -- @string.documentation   string documenting code (e.g. Python docstrings)
  -- @string.regexp          regular expressions
  ["@string.regexp"] = { fg = palette.green },
  -- @string.escape          escape sequences
  ["@string.escape"] = { fg = palette.light_orange },
  -- @string.special         other special strings (e.g. dates)
  -- @string.special.symbol  symbols or atoms
  ["@string.special.symbol"] = { fg = palette.light_blue },
  -- @string.special.path    filenames
  -- @string.special.url (Underlined)     URIs (e.g. hyperlinks)
  -- ["@string.special.url"] = { fg = theme.syn.special1, undercurl = true },
  -- @character              character literals
  -- @character.special      special characters (e.g. wildcards)
  --
  -- @boolean                boolean literals
  -- @number                 numeric literals
  -- @number.float           floating-point number literals
  --
  ["@lsp.type.class"] = { fg = palette.gold },
  -- @type                   type or class definitions and annotations
  -- @type.builtin           built-in types
  -- @type.definition        identifiers in type definitions (e.g. `typedef <type> <identifier>` in C)
  --
  -- @attribute              attribute annotations (e.g. Python decorators, Rust lifetimes)
  ["@attribute"] = { link = "Constant" },
  -- @attribute.builtin      builtin annotations (e.g. `@property` in Python)
  -- @property               the key in key/value pairs
  --
  -- @function               function definitions
  -- @function.builtin       built-in functions
  -- @function.call          function calls
  -- @function.macro         preprocessor macros
  --
  -- @function.method        method definitions
  -- @function.method.call   method calls
  --
  -- @constructor            constructor calls and definitions
  ["@constructor"] = { fg = palette.purple },
  -- ["@constructor.lua"] = { fg = theme.syn.keyword },
  -- @operator               symbolic operators (e.g. `+`, `*`)
  ["@operator"] = { link = "Operator" },
  --
  -- @keyword                keywords not fitting into specific categories
  -- @keyword.coroutine      keywords related to coroutines (e.g. `go` in Go, `async/await` in Python)
  -- @keyword.function       keywords that define a function (e.g. `func` in Go, `def` in Python)
  -- @keyword.operator       operators that are English words (e.g. `and`, `or`)
  ["@keyword.function"] = { fg = palette.light_blue, bold = true },
  ["@keyword.operator"] = { fg = palette.yellow, bold = true },
  -- @keyword.import         keywords for including modules (e.g. `import`, `from` in Python)
  ["@keyword.import"] = { link = "PreProc" },
  -- @keyword.type           keywords defining composite types (e.g. `struct`, `enum`)
  -- @keyword.modifier       keywords defining type modifiers (e.g. `const`, `static`, `public`)
  -- @keyword.repeat         keywords related to loops (e.g. `for`, `while`)
  -- @keyword.return         keywords like `return` and `yield`
  ["@keyword.return"] = { fg = palette.purple },
  -- @keyword.debug          keywords related to debugging
  -- @keyword.exception      keywords related to exceptions (e.g. `throw`, `catch`)
  -- ["@keyword.exception"] = vim.tbl_extend("force", { fg = theme.syn.special3 }, config.statementStyle),

  ["@keyword.luap"] = { link = "@string.regex" },
  --
  ["@keyword.conditional"] = { fg = palette.purple },
  -- @keyword.conditional.ternary ternary operator (e.g. `?`, `:`)
  --
  -- @keyword.directive           various preprocessor directives and shebangs
  -- @keyword.directive.define    preprocessor definition directives
  --
  -- @punctuation.delimiter  delimiters (e.g. `;`, `.`, `,`)
  -- ["@punctuation.delimiter"] = { fg = theme.syn.punct },
  -- @punctuation.bracket    brackets (e.g. `()`, `{}`, `[]`)
  ["@punctuation.bracket"] = { fg = palette.light_blue },
  -- @punctuation.special    special symbols (e.g. `{}` in string interpolation)
  -- ["@punctuation.special"] = { fg = theme.syn.special1 },
  --
  -- @comment                line and block comments
  -- @comment.documentation  comments documenting code
  --
  -- @comment.error          error-type comments (e.g. `ERROR`, `FIXME`, `DEPRECATED`)
  -- ["@comment.error"] = { fg = theme.ui.fg, bg = theme.diag.error, bold = true },
  -- @comment.warning        warning-type comments (e.g. `WARNING`, `FIX`, `HACK`)
  -- ["@comment.warning"] = { fg = theme.ui.fg_reverse, bg = theme.diag.warning, bold = true },
  -- @comment.todo           todo-type comments (e.g. `TODO`, `WIP`)
  -- @comment.note           note-type comments (e.g. `NOTE`, `INFO`, `XXX`)
  -- ["@comment.note"] = { fg = theme.ui.fg_reverse, bg = theme.diag.hint, bold = true },
  --
  -- @markup.strong          bold text
  ["@markup.strong"] = { bold = true },
  -- @markup.italic          italic text
  ["@markup.italic"] = { italic = true },
  -- @markup.strikethrough   struck-through text
  ["@markup.strikethrough"] = { strikethrough = true },
  -- @markup.underline       underlined text (only for literal underline markup!)
  ["@markup.underline"] = { underline = true },
  --
  -- @markup.heading         headings, titles (including markers)
  ["@markup.heading"] = { link = "Function" },
  -- @markup.heading.1       top-level heading
  -- @markup.heading.2       section heading
  -- @markup.heading.3       subsection heading
  -- @markup.heading.4       and so on
  -- @markup.heading.5       and so forth
  -- @markup.heading.6       six levels ought to be enough for anybody
  --
  -- @markup.quote           block quotes
  ["@markup.quote"] = { link = "@variable.parameter" },
  -- @markup.math            math environments (e.g. `$ ... $` in LaTeX)
  ["@markup.math"] = { link = "Constant" },
  -- @markup.environment     environments (e.g. in LaTeX)
  ["@markup.environment"] = { link = "Keyword" },
  --
  -- @markup.link            text references, footnotes, citations, etc.
  -- @markup.link.label      link, reference descriptions
  -- @markup.link.url        URL-style links
  ["@markup.link.url"] = { link = "@string.special.url" },
  -- @markup.raw             literal or verbatim text (e.g. inline code)
  ["@markup.raw"] = { link = "String" },
  -- @markup.raw.block       literal or verbatim text as a stand-alone block
  --
  -- @markup.list            list markers
  -- @markup.list.checked    checked todo-style list markers
  -- @markup.list.unchecked  unchecked todo-style list markers
  --
  -- @diff.plus              added text (for diff files)
  -- ["@diff.plus"] = { fg = theme.vcs.added },
  -- @diff.minus             deleted text (for diff files)
  -- ["@diff.minus"] = { fg = theme.vcs.removed },
  -- @diff.delta             changed text (for diff files)
  -- ["@diff.delta"] = { fg = theme.vcs.changed },
  --
  -- @tag                    XML-style tag names (e.g. in XML, HTML, etc.)
  -- @tag.builtin            XML-style tag names (e.g. HTML5 tags)
  -- @tag.attribute          XML-style tag attributes
  -- ["@tag.attribute"] = { fg = theme.syn.identifier },
  -- @tag.delimiter          XML-style tag delimiters
  -- ["@tag.delimiter"] = { fg = theme.syn.punct },
}

local function set_hightlights()
  for hl, spec in pairs(highlights2) do
    vim.api.nvim_set_hl(0, hl, spec)
  end
end

function M.init()
  if vim.g.colors_name then
    vim.cmd("hi clear")
    vim.cmd("syntax reset")
  end
  vim.g.colors_name = "slated"

  set_hightlights()
end

return M
