local M = {}

local palette = {
    black = "#000000",
    background = "#262626",
    slate = "#afaf87",
    darkgrey = "#333333",
    darkgrey1 = "#4a4a4a",
    darkred = "#ff0000",
    red = "#ffafaf",
    darkgreen = "#5f8700",
    green = "#00875f",
    darkyellow = "#ffff00",
    yellow = "#d7d787",
    yellow2 = "#ffd700",
    darkblue = "#87d7ff",
    blue = "#5f87d7",
    darkmagenta = "#d7d787",
    purple = "#c3b1e1",
    cyan = "#00ffff",
    grey = "#666666",
    white = "#ffffff",
    orange = "#d7875f",
    lightorange = "#ffd7af",
    diff_green = "#5f875f",
    diff_change = "#5f87af",
    diff_text = "#c6c6c6",
    diff_delete = "#af5faf",
}

local highlights2 = {
    Normal = { fg = palette.white, bg = palette.background },
    EndOfBuffer = { fg = palette.blue, bg = "NONE" },
    StatusLine = { fg = palette.black, bg = palette.slate },
    StatusLineNC = { fg = palette.grey, bg = palette.slate },
    StatusLineTerm = { fg = palette.black, bg = palette.slate },
    StatusLineTermNC = { fg = palette.grey, bg = palette.slate },
    VertSplit = { fg = palette.grey, bg = palette.slate },
    PmenuSel = { fg = palette.background, bg = palette.yellow },
    Pmenu = { fg = "NONE", bg = palette.darkgrey1 },
    PmenuSbar = { fg = "NONE", bg = palette.background },
    PmenuThumb = { fg = "NONE", bg = palette.yellow },
    CurSearch = { fg = palette.black, bg = palette.orange },
    TabLineSel = { fg = palette.black, bg = palette.slate },
    TabLine = { fg = palette.grey, bg = palette.darkgrey },
    TabLineFill = { fg = palette.cyan, bg = palette.darkgrey },
    ToolbarLine = { fg = "NONE", bg = "NONE" },
    ToolbarButton = { fg = palette.background, bg = palette.yellow },
    NonText = { fg = palette.blue, bg = "NONE", },
    SpecialKey = { fg = palette.green, bg = "NONE", },
    QuickFixLine = { fg = palette.black, bg = palette.blue },
    Folded = { fg = palette.grey, bg = palette.black },
    FoldColumn = { fg = palette.blue, bg = palette.black },
    CursorLine = { fg = "NONE", bg = palette.darkgrey },
    CursorColumn = { fg = "NONE", bg = palette.darkgrey },
    ColorColumn = { fg = "NONE", bg = palette.black },
    CursorLineNr = { fg = "NONE", bg = palette.darkgrey },
    Visual = { fg = palette.yellow, bg = palette.darkgreen },
    SignColumn = { fg = "NONE", bg = palette.background },
    VisualNOS = { fg = palette.yellow, bg = palette.darkgreen },
    LineNr = { fg = palette.grey, bg = "NONE" },
    Error = { fg = palette.darkred, bg = palette.white },
    ErrorMsg = { fg = palette.darkred, bg = palette.black },
    ModeMsg = { fg = palette.background, bg = palette.yellow },
    WarningMsg = { fg = palette.cyan, bg = "NONE" },
    MoreMsg = { fg = palette.green, bg = "NONE" },
    Question = { fg = palette.yellow, bg = "NONE" },
    MatchParen = { bold = true },
    Search = { fg = palette.black, bg = palette.orange },
    IncSearch = { fg = palette.black, bg = palette.orange },
    Todo = { fg = palette.darkred, bg = palette.darkyellow },
    WildMenu = { fg = palette.background, bg = palette.yellow },
    Underlined = { fg = palette.blue, bg = "NONE" },
    Cursor = { fg = palette.darkgrey, bg = palette.yellow },
    lCursor = { fg = palette.background, bg = palette.red },
    SpellBad = { fg = palette.darkred, bg = "NONE" },
    SpellCap = { fg = palette.darkyellow, bg = "NONE" },
    SpellLocal = { fg = palette.red, bg = "NONE" },
    SpellRare = { fg = palette.lightorange, bg = "NONE" },
    Comment = { fg = palette.grey, italic = true },
    String = { fg = palette.darkblue, bg = "NONE" },
    Identifier = { fg = palette.red, bg = "NONE" },
    Function = { fg = palette.lightorange, bg = "NONE" },
    Special = { fg = palette.yellow, bg = "NONE" },
    Statement = { fg = palette.purple },
    Constant = { fg = palette.red, bg = "NONE" },
    PreProc = { fg = palette.orange, bg = "NONE" },
    Type = { fg = palette.purple, bg = "NONE" },
    Operator = { fg = palette.orange, bg = "NONE" },
    Define = { fg = palette.yellow, bg = "NONE" },
    Structure = { fg = palette.red, bg = "NONE" },
    Directory = { fg = palette.green, bg = "NONE" },
    Conceal = { fg = palette.grey, bg = "NONE" },
    Ignore = { fg = "NONE", bg = "NONE" },
    Title = { fg = palette.yellow, bg = "NONE" },
    DiffAdd = { fg = palette.white, bg = palette.diff_green },
    DiffChange = { fg = palette.white, bg = palette.diff_change },
    DiffText = { fg = palette.black, bg = palette.diff_text },
    DiffDelete = { fg = palette.white, bg = palette.diff_delete },
    Keyword = { fg = palette.purple },
    Number = { fg = palette.red },
    Substitute = { fg = palette.black, bg = palette.orange },

    -- lsp
    ["@lsp.type.macro"] = { link = "Macro" },
    ["@lsp.type.method"] = { fg = palette.red },       -- Function
    ["@lsp.type.namespace"] = { link = "@module" },             -- Structure
    ["@lsp.type.parameter"] = { link = "@variable.parameter" }, -- Identifier
    ["@lsp.type.property"] = { link = "Identifier" },
    ["@lsp.type.struct"] = { link = "Structure" },
    ["@lsp.type.type"] = { link = "Type" },
    -- ["@lsp.type.typeParameter"] = { link = "TypeDef" },
    ["@lsp.type.variable"] = { fg = 'none' }, -- Identifier
    ["@lsp.type.comment"] = { fg = 'none' },  -- Comment


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

    ["@lsp.typemod.function.readonly"] = { fg = palette.purple, bold = true },

    LspInlayHint = { bg = palette.darkgrey, fg = palette.grey, italic = true },

}

-- local highlights = {
--     -- ColorColumn	Used for the columns set with 'colorcolumn'.
--     ColorColumn = { bg = palette.base0 },
--     -- Conceal		Placeholder characters substituted for concealed text (see 'conceallevel').
--     Conceal = { fg = palette.blue, bold = true },
--     -- CurSearch	Used for highlighting a search pattern under the cursor (see 'hlsearch').
--     CurSearch = { fg = palette.base0, bg = palette.orange, bold = true },
--     -- Cursor		Character under the cursor.
--     Cursor = { fg = palette.yellow },
--     -- lCursor		Character under the cursor when |language-mapping| is used (see 'guicursor').
--     lCursor = { link = "Cursor" },
--     -- CursorIM	Like Cursor, but used when in IME mode.
--     CursorIM = { link = "Cursor" },
--     -- CursorColumn	Screen-column at the cursor, when 'cursorcolumn' is set.
--     CursorColumn = { link = "CursorLine" },
--     -- CursorLine	Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
--     CursorLine = { bg = palette.base1 },
--     -- Directory	Directory names (and other special names in listings).
--     Directory = { fg = palette.purple },
--     -- DiffAdd		Diff mode: Added line. |diff.txt|
--     DiffAdd = { bg = palette.green },
--     -- DiffChange	Diff mode: Changed line. |diff.txt|
--     DiffChange = { bg = palette.red },
--     -- DiffDelete	Diff mode: Deleted line. |diff.txt|
--     DiffDelete = { fg = palette.red },
--     -- DiffText	Diff mode: Changed text within a changed line. |diff.txt|
--     DiffText = { bg = palette.white },
--     -- EndOfBuffer	Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
--     EndOfBuffer = { fg = palette.background },
--     -- TermCursor	Cursor in a focused terminal.
--     -- TermCursorNC	Cursor in an unfocused terminal.
--     -- ErrorMsg	Error messages on the command line.
--     ErrorMsg = { fg = palette.red },
--     -- WinSeparator	Separators between window splits.
--     WinSeparator = { fg = palette.grey, bg = palette.slate },
--     VertSplit = { link = "WinSeparator" },
--     -- Folded		Line used for closed folds.
--     Folded = { fg = palette.base2, bg = palette.base1 },
--     -- FoldColumn	'foldcolumn'
--     -- FoldColumn = { fg = theme.ui.nontext, bg = theme.ui.bg_gutter },
--     -- SignColumn	Column where |signs| are displayed.
--     -- SignColumn = { fg = theme.ui.special, bg = theme.ui.bg_gutter },
--     -- IncSearch	'incsearch' highlighting; also used for the text replaced with ":s///c".
--
--     -- Substitute	|:substitute| replacement text highlighting.
--     Substitute = { fg = palette.base0, bg = palette.orange },
--     -- LineNr		Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
--     LineNr = { fg = palette.white, bg = palette.base0 },
--     -- LineNrAbove	Line number for when the 'relativenumber' option is set, above the cursor line.
--     -- LineNrBelow	Line number for when the 'relativenumber' option is set, below the cursor line.
--     -- CursorLineNr	Like LineNr when 'cursorline' is set and 'cursorlineopt' contains "number" or is "both", for the cursor line.
--     CursorLineNr = { fg = palette.orange, bg = palette.base0, bold = true },
--     -- CursorLineFold	Like FoldColumn when 'cursorline' is set for the cursor line.
--     -- CursorLineSign	Like SignColumn when 'cursorline' is set for the cursor line.
--     -- MatchParen	Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
--     MatchParen = { bg = palette.base2, fg = palette.blue, bold = true },
--     -- ModeMsg		'showmode' message (e.g., "-- INSERT --").
--     ModeMsg = { fg = palette.orange, bold = true },
--     -- MsgArea		Area for messages and cmdline.
--     -- MsgArea = vim.o.cmdheight == 0 and {link = 'StatusLine'} or { fg =  },
--     -- MsgSeparator	Separator for scrolled messages |msgsep|.
--     -- MsgSeparator = { bg = vim.o.cmdheight == 0 and theme.ui.bg or theme.ui.bg_m3 },
--     -- MoreMsg		|more-prompt|
--     -- MoreMsg = { fg = theme.diag.info },
--     -- NonText		'@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
--     NonText = { fg = palette.dimmed, bg = palette.base0 },
--     -- Normal		Normal text.
--     Normal = { fg = palette.white, bg = palette.background },
--     -- NormalFloat	Normal text in floating windows.
--     NormalFloat = { fg = palette.dimmed, bg = palette.base1 },
--     -- FloatBorder	Border of floating windows.
--     FloatBorder = { fg = palette.yellow, bg = palette.yellow },
--     -- FloatTitle	Title of floating windows.
--     FloatTitle = { fg = palette.dimmed, bg = palette.yellow, bold = true },
--     -- FloatFooter	Footer of floating windows.
--     FloatFooter = { fg = palette.dimmed, bg = palette.yellow },
--     -- NormalNC	Normal text in non-current windows.
--     NormalNC = { link = "Normal" },
--     -- Pmenu		Popup menu: Normal item.
--     -- Pmenu = { fg = "none", bg =  },
--     -- PmenuSel	Popup menu: Selected item.
--     PmenuSel = { fg = palette.background, bg = palette.yellow },
--     -- PmenuKind	Popup menu: Normal item "kind".
--     PmenuKind = { fg = palette.dimmed, bg = palette.base1 },
--     -- PmenuKindSel	Popup menu: Selected item "kind".
--     PmenuKindSel = { fg = palette.purple, bg = palette.base2 },
--     -- PmenuExtra	Popup menu: Normal item "extra text".
--     PmenuExtra = { fg = palette.dimmed, bg = palette.base1 },
--     -- PmenuExtraSel	Popup menu: Selected item "extra text".
--     PmenuExtraSel = { fg = palette.purple, bg = palette.base2 },
--     -- PmenuSbar	Popup menu: Scrollbar.
--     PmenuSbar = { bg = palette.yellow },
--     -- PmenuThumb	Popup menu: Thumb of the scrollbar.
--     PmenuThumb = { bg = palette.yellow },
--     -- Question	|hit-enter| prompt and yes/no questions.
--     Question = { link = "MoreMsg" },
--     -- QuickFixLine	Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
--     QuickFixLine = { bg = palette.base1 },
--     -- Search		Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
--     Search = { fg = palette.white, bg = palette.base1 },
--     -- SpecialKey	Unprintable characters: Text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
--     SpecialKey = { fg = palette.purple },
--     -- SpellBad	Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
--     SpellBad = { undercurl = true, sp = palette.red },
--     -- SpellCap	Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
--     SpellCap = { undercurl = true, sp = palette.orange },
--     -- SpellLocal	Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
--     SpellLocal = { undercurl = true, sp = palette.orange },
--     -- SpellRare	Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
--     SpellRare = { undercurl = true, sp = palette.orange },
--     -- StatusLine	Status line of current window.
--     StatusLine = { fg = palette.black, bg = palette.slate },
--     -- StatusLineNC	Status lines of not-current windows. Note: If this is equal to "StatusLine", Vim will use "^^^" in the status line of the current window.
--     StatusLineNC = { fg = palette.grey, bg = palette.slate },
--
--     StatusLineTerm = { link = "StatusLine" },
--
--     StatusLineTermNC = { link = "StatusLineNC" },
--     -- TabLine		Tab pages line, not active tab page label.
--     TabLine = { bg = palette.base2, fg = palette.dimmed },
--     -- TabLineFill	Tab pages line, where there are no labels.
--     TabLineFill = { bg = palette.base0 },
--     -- TabLineSel	Tab pages line, active tab page label.
--     TabLineSel = { fg = palette.dimmed, bg = palette.base1 },
--     -- Title		Titles for output from ":set all", ":autocmd" etc.
--     -- Title = { fg = , bold = true },
--     -- Visual		Visual mode selection.
--     Visual = { bg = palette.orange, fg = palette.base0 },
--     -- VisualNOS	Visual mode selection when vim is "Not Owning the Selection".
--     VisualNOS = { link = "Visual" },
--     -- WarningMsg	Warning messages.
--     WarningMsg = { fg = palette.orange },
--     -- Whitespace	"nbsp", "space", "tab", "multispace", "lead" and "trail" in 'listchars'.
--     -- Whitespace = { fg = theme.ui.whitespace },
--     -- WildMenu	Current match in 'wildmenu' completion.
--     -- WildMenu = { link = "Pmenu" },
--     -- WinBar		Window bar of current window.
--     -- Winbar = { fg = theme.ui.fg_dim, bg = "NONE" },
--     -- WinBarNC	Window bar of not-current windows.
--     -- WinbarNC = { fg = theme.ui.fg_dim, bg = config.dimInactive and theme.ui.bg_dim or "NONE" },
--
--     -- SignColumnSB = { link = "SignColumn" },
--     -- NormalSB = { link = "Normal" },
--
--     -- debugPC = { bg = theme.diff.delete },
--     -- debugBreakpoint = { fg = theme.syn.special1, bg = theme.ui.bg_gutter },
--
--     LspReferenceText = { bg = palette.purple },
--     LspReferenceRead = { link = "LspReferenceText" },
--     LspReferenceWrite = { bg = palette.purple, underline = true },
--     LspInlayHint = { bg = palette.base2, fg = palette.pink },
--
--     DiagnosticError = { fg = palette.red },
--     DiagnosticWarn = { fg = palette.orange },
--     DiagnosticInfo = { fg = palette.blue },
--     DiagnosticHint = { fg = palette.yellow },
--     DiagnosticOk = { fg = palette.green },
--
--     DiagnosticFloatingError = { link = "DiagnosticError" },
--     DiagnosticFloatingWarn = { link = "DiagnosticWarn" },
--     DiagnosticFloatingInfo = { link = "DiagnosticInfo" },
--     DiagnosticFloatingHint = { link = "DiagnosticHint" },
--     DiagnosticFloatingOk = { link = "DiagnosticOk" },
--
--     DiagnosticSignError = { fg = palette.red, bg = palette.base0 },
--     DiagnosticSignWarn = { fg = palette.orange, bg = palette.base0 },
--     DiagnosticSignInfo = { fg = palette.blue, bg = palette.base0 },
--     DiagnosticSignHint = { fg = palette.blue, bg = palette.base0 },
--
--     DiagnosticVirtualTextError = { link = "DiagnosticError" },
--     DiagnosticVirtualTextWarn = { link = "DiagnosticWarn" },
--     DiagnosticVirtualTextInfo = { link = "DiagnosticInfo" },
--     DiagnosticVirtualTextHint = { link = "DiagnosticHint" },
--
--     DiagnosticUnderlineError = { undercurl = true, sp = palette.red },
--     DiagnosticUnderlineWarn = { undercurl = true, sp = palette.orange },
--     DiagnosticUnderlineInfo = { undercurl = true, sp = palette.blue },
--     DiagnosticUnderlineHint = { undercurl = true, sp = palette.blue },
--
--     LspSignatureActiveParameter = { fg = palette.orange },
--     LspCodeLens = { fg = palette.base2 },
--
--     -- vcs
--     diffAdded = { fg = palette.green },
--     diffRemoved = { fg = palette.red },
--     diffDeleted = { fg = palette.red },
--     diffChanged = { fg = palette.red },
--     diffOldFile = { fg = palette.red },
--     diffNewFile = { fg = palette.green },
--     -- diffFile = { fg = c.steelGray },
--     -- diffLine = { fg = c.steelGray },
--     -- diffIndexLine = { link = 'Identifier' },
--
--     -- ["@lsp.type.class"] = { link = "Structure" },
--     -- ["@lsp.type.decorator"] = { link = "Function" },
--     -- ["@lsp.type.enum"] = { link = "Structure" },
--     -- ["@lsp.type.enumMember"] = { link = "Constant" },
--     -- ["@lsp.type.function"] = { link = "Function" },
--     -- ["@lsp.type.interface"] = { link = "Structure" },
--     ["@lsp.type.macro"] = { link = "Macro" },
--     ["@lsp.type.method"] = { link = "@function.method" },       -- Function
--     ["@lsp.type.namespace"] = { link = "@module" },             -- Structure
--     ["@lsp.type.parameter"] = { link = "@variable.parameter" }, -- Identifier
--     ["@lsp.type.property"] = { link = "Identifier" },
--     ["@lsp.type.struct"] = { link = "Structure" },
--     ["@lsp.type.type"] = { link = "Type" },
--     -- ["@lsp.type.typeParameter"] = { link = "TypeDef" },
--     ["@lsp.type.variable"] = { fg = 'none' }, -- Identifier
--     ["@lsp.type.comment"] = { fg = 'none' },  -- Comment
--
--
--     ["@lsp.type.selfParameter"] = { link = "@variable.builtin" },
--     -- ["@lsp.type.builtinConstant"] = { link = "@constant.builtin" },
--     ["@lsp.type.builtinConstant"] = { link = "@constant.builtin" },
--     ["@lsp.type.magicFunction"] = { link = "@function.builtin" },
--
--
--     ["@lsp.mod.readonly"] = { link = "Constant" },
--     ["@lsp.mod.typeHint"] = { link = "Type" },
--     -- ["@lsp.mod.defaultLibrary"] = { link = "Special" },
--     -- ["@lsp.mod.builtin"] = { link = "Special" },
--
--
--     ["@lsp.typemod.operator.controlFlow"] = { link = "@keyword.exception" },
--     ["@lsp.typemod.keyword.documentation"] = { link = "Special" },
--
--     ["@lsp.typemod.variable.global"] = { link = "Constant" },
--     ["@lsp.typemod.variable.static"] = { link = "Constant" },
--     ["@lsp.typemod.variable.defaultLibrary"] = { link = "Special" },
--
--     ["@lsp.typemod.function.builtin"] = { link = "@function.builtin" },
--     ["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
--     ["@lsp.typemod.method.defaultLibrary"] = { link = "@function.builtin" },
--
--     ["@lsp.typemod.operator.injected"] = { link = "Operator" },
--     ["@lsp.typemod.string.injected"] = { link = "String" },
--     ["@lsp.typemod.variable.injected"] = { link = "@variable" },
--
--     ["@lsp.typemod.function.readonly"] = { fg = palette.purple, bold = true },
--
--     -- *Comment	any comment
--     Comment = { fg = palette.base3, italic = true },
--
--     -- *Constant	any constant
--     Constant = { fg = palette.blue1 },
--     --  String		a string constant: "this is a string"
--     String = { fg = palette.green },
--     --  Character	a character constant: 'c', '\n'
--     Character = { link = "String" },
--     --  Number		a number constant: 234, 0xff
--     Number = { fg = palette.blue1 },
--     --  Boolean	a boolean constant: TRUE, false
--     Boolean = { fg = palette.blue1, bold = true },
--     --  Float		a floating point constant: 2.3e10
--     Float = { link = "Number" },
--
--     -- *Identifier	any variable name
--     Identifier = { fg = palette.red },
--     --  Function	function name (also: methods for classes)
--     Function = { fg = palette.orange },
--
--     -- *Statement	any statement
--     Statement = { fg = palette.dimmed },
--     --  Conditional	if, then, else, endif, switch, etc.
--     --  Repeat		for, do, while, etc.
--     --  Label		case, default, etc.
--     --  Operator	"sizeof", "+", "*", etc.
--     Operator = { fg = palette.dimmed },
--     --  Keyword	any other keyword
--     Keyword = { fg = palette.pink },
--     --  Exception	try, catch, throw
--     Exception = { fg = palette.red },
--
--     -- *PreProc	generic Preprocessor
--     PreProc = { fg = palette.orange },
--     --  Include	preprocessor #include
--     --  Define		preprocessor #define
--     --  Macro		same as Define
--     --  PreCondit	preprocessor #if, #else, #endif, etc.
--
--     -- *Type		int, long, char, etc.
--     Type = { fg = palette.purple },
--     --  StorageClass	static, register, volatile, etc.
--     --  Structure	struct, union, enum, etc.
--     --  Typedef	A typedef
--
--     -- *Special	any special symbol
--     Special = { fg = palette.purple },
--     --  SpecialChar	special character in a constant
--     --  Tag		you can use CTRL-] on this
--     --  Delimiter	character that needs attention
--     -- Delimiter = { fg = theme.syn.punct },
--     --  SpecialComment	special things inside a comment
--     --  Debug		debugging statements
--
--     -- *Underlined	text that stands out, HTML links
--     -- Underlined = { fg = theme.syn.special1, underline = true },
--     Bold = { bold = true },
--     Italic = { italic = true },
--
--     -- *Ignore		left blank, hidden  |hl-Ignore|
--     Ignore = { link = "NonText" },
--
--     -- *Error		any erroneous construct
--     Error = { fg = palette.red },
--
--     -- *Todo		anything that needs extra attention; mostly the keywords TODO FIXME WARNING and XXX
--     Todo = { fg = palette.base0, bg = palette.blue1, bold = true },
--
--     qfLineNr = { link = "lineNr" },
--     qfFileName = { link = "Directory" },
--
--     -- htmlH1 = {},
--     -- htmlH2 = {},
--
--     -- mkdHeading = {},
--     -- mkdCode = {},
--     -- mkdCodeDelimiter = {},
--     -- mkdCodeStart = {},
--     -- mkdCodeEnd = {},
--     -- mkdLink = {},
--
--     -- markdownHeadingDelimiter = {},
--     -- markdownCode = { fg = theme.syn.string },
--     -- markdownCodeBlock = { fg = theme.syn.string },
--     -- markdownEscape = { fg = "NONE" },
--     -- markdownH1 = {},
--     -- markdownH2 = {},
--     -- markdownLinkText = {},
--
--     -- @variable                       various variable names
--     ["@variable"] = { fg = palette.white },
--     -- @variable.builtin (Special)     built-in variable names (e.g. `this`, `self`)
--     ["@variable.builtin"] = { fg = palette.purple, italic = true },
--     -- @variable.parameter             parameters of a function
--     ["@variable.parameter"] = { fg = palette.yellow },
--     -- @variable.parameter.builtin     special parameters (e.g. `_`, `it`)
--     -- @variable.member                object and struct fields
--     ["@variable.member"] = { fg = palette.blue },
--     --
--     -- @constant (Constant)              constant identifiers
--     -- @constant.builtin       built-in constant values
--     -- @constant.macro         constants defined by the preprocessor
--     --
--     -- @module (Structure)      modules or namespaces
--     -- @module.builtin         built-in modules or namespaces
--     -- @label                  `GOTO` and other labels (e.g. `label:` in C), including heredoc labels
--     --
--     -- @string                 string literals
--     -- @string.documentation   string documenting code (e.g. Python docstrings)
--     -- @string.regexp          regular expressions
--     ["@string.regexp"] = { fg = palette.green },
--     -- @string.escape          escape sequences
--     ["@string.escape"] = { fg = palette.green, bold = true },
--     -- @string.special         other special strings (e.g. dates)
--     -- @string.special.symbol  symbols or atoms
--     ["@string.special.symbol"] = { fg = palette.blue1 },
--     -- @string.special.path    filenames
--     -- @string.special.url (Underlined)     URIs (e.g. hyperlinks)
--     -- ["@string.special.url"] = { fg = theme.syn.special1, undercurl = true },
--     -- @character              character literals
--     -- @character.special      special characters (e.g. wildcards)
--     --
--     -- @boolean                boolean literals
--     -- @number                 numeric literals
--     -- @number.float           floating-point number literals
--     --
--     -- @type                   type or class definitions and annotations
--     -- @type.builtin           built-in types
--     -- @type.definition        identifiers in type definitions (e.g. `typedef <type> <identifier>` in C)
--     --
--     -- @attribute              attribute annotations (e.g. Python decorators, Rust lifetimes)
--     ["@attribute"] = { link = "Constant" },
--     -- @attribute.builtin      builtin annotations (e.g. `@property` in Python)
--     -- @property               the key in key/value pairs
--     --
--     -- @function               function definitions
--     -- @function.builtin       built-in functions
--     -- @function.call          function calls
--     -- @function.macro         preprocessor macros
--     --
--     -- @function.method        method definitions
--     -- @function.method.call   method calls
--     --
--     -- @constructor            constructor calls and definitions
--     ["@constructor"] = { fg = palette.purple },
--     -- ["@constructor.lua"] = { fg = theme.syn.keyword },
--     -- @operator               symbolic operators (e.g. `+`, `*`)
--     ["@operator"] = { link = "Operator" },
--     --
--     -- @keyword                keywords not fitting into specific categories
--     -- @keyword.coroutine      keywords related to coroutines (e.g. `go` in Go, `async/await` in Python)
--     -- @keyword.function       keywords that define a function (e.g. `func` in Go, `def` in Python)
--     -- @keyword.operator       operators that are English words (e.g. `and`, `or`)
--     ["@keyword.operator"] = { fg = palette.dimmed, bold = true },
--     -- @keyword.import         keywords for including modules (e.g. `import`, `from` in Python)
--     ["@keyword.import"] = { link = "PreProc" },
--     -- @keyword.type           keywords defining composite types (e.g. `struct`, `enum`)
--     -- @keyword.modifier       keywords defining type modifiers (e.g. `const`, `static`, `public`)
--     -- @keyword.repeat         keywords related to loops (e.g. `for`, `while`)
--     -- @keyword.return         keywords like `return` and `yield`
--     ["@keyword.return"] = { fg = palette.purple },
--     -- @keyword.debug          keywords related to debugging
--     -- @keyword.exception      keywords related to exceptions (e.g. `throw`, `catch`)
--     -- ["@keyword.exception"] = vim.tbl_extend("force", { fg = theme.syn.special3 }, config.statementStyle),
--
--     ["@keyword.luap"] = { link = "@string.regex" },
--     --
--     -- @keyword.conditional         keywords related to conditionals (e.g. `if`, `else`)
--     -- @keyword.conditional.ternary ternary operator (e.g. `?`, `:`)
--     --
--     -- @keyword.directive           various preprocessor directives and shebangs
--     -- @keyword.directive.define    preprocessor definition directives
--     --
--     -- @punctuation.delimiter  delimiters (e.g. `;`, `.`, `,`)
--     -- ["@punctuation.delimiter"] = { fg = theme.syn.punct },
--     -- @punctuation.bracket    brackets (e.g. `()`, `{}`, `[]`)
--     ["@punctuation.bracket"] = { fg = palette.blue },
--     -- @punctuation.special    special symbols (e.g. `{}` in string interpolation)
--     -- ["@punctuation.special"] = { fg = theme.syn.special1 },
--     --
--     -- @comment                line and block comments
--     -- @comment.documentation  comments documenting code
--     --
--     -- @comment.error          error-type comments (e.g. `ERROR`, `FIXME`, `DEPRECATED`)
--     -- ["@comment.error"] = { fg = theme.ui.fg, bg = theme.diag.error, bold = true },
--     -- @comment.warning        warning-type comments (e.g. `WARNING`, `FIX`, `HACK`)
--     -- ["@comment.warning"] = { fg = theme.ui.fg_reverse, bg = theme.diag.warning, bold = true },
--     -- @comment.todo           todo-type comments (e.g. `TODO`, `WIP`)
--     -- @comment.note           note-type comments (e.g. `NOTE`, `INFO`, `XXX`)
--     -- ["@comment.note"] = { fg = theme.ui.fg_reverse, bg = theme.diag.hint, bold = true },
--     --
--     -- @markup.strong          bold text
--     ["@markup.strong"] = { bold = true },
--     -- @markup.italic          italic text
--     ["@markup.italic"] = { italic = true },
--     -- @markup.strikethrough   struck-through text
--     ["@markup.strikethrough"] = { strikethrough = true },
--     -- @markup.underline       underlined text (only for literal underline markup!)
--     ["@markup.underline"] = { underline = true },
--     --
--     -- @markup.heading         headings, titles (including markers)
--     ["@markup.heading"] = { link = "Function" },
--     -- @markup.heading.1       top-level heading
--     -- @markup.heading.2       section heading
--     -- @markup.heading.3       subsection heading
--     -- @markup.heading.4       and so on
--     -- @markup.heading.5       and so forth
--     -- @markup.heading.6       six levels ought to be enough for anybody
--     --
--     -- @markup.quote           block quotes
--     ["@markup.quote"] = { link = "@variable.parameter" },
--     -- @markup.math            math environments (e.g. `$ ... $` in LaTeX)
--     ["@markup.math"] = { link = "Constant" },
--     -- @markup.environment     environments (e.g. in LaTeX)
--     ["@markup.environment"] = { link = "Keyword" },
--     --
--     -- @markup.link            text references, footnotes, citations, etc.
--     -- @markup.link.label      link, reference descriptions
--     -- @markup.link.url        URL-style links
--     ["@markup.link.url"] = { link = "@string.special.url" },
--     -- @markup.raw             literal or verbatim text (e.g. inline code)
--     ["@markup.raw"] = { link = "String" },
--     -- @markup.raw.block       literal or verbatim text as a stand-alone block
--     --
--     -- @markup.list            list markers
--     -- @markup.list.checked    checked todo-style list markers
--     -- @markup.list.unchecked  unchecked todo-style list markers
--     --
--     -- @diff.plus              added text (for diff files)
--     -- ["@diff.plus"] = { fg = theme.vcs.added },
--     -- @diff.minus             deleted text (for diff files)
--     -- ["@diff.minus"] = { fg = theme.vcs.removed },
--     -- @diff.delta             changed text (for diff files)
--     -- ["@diff.delta"] = { fg = theme.vcs.changed },
--     --
--     -- @tag                    XML-style tag names (e.g. in XML, HTML, etc.)
--     -- @tag.builtin            XML-style tag names (e.g. HTML5 tags)
--     -- @tag.attribute          XML-style tag attributes
--     -- ["@tag.attribute"] = { fg = theme.syn.identifier },
--     -- @tag.delimiter          XML-style tag delimiters
--     -- ["@tag.delimiter"] = { fg = theme.syn.punct },
-- }

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
