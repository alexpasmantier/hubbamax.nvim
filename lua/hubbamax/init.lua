-- Name:         hubbamax
-- Description:  Easier on the eyes habamax
-- Author:       Alexandre Pasmantier <alex.pasmant@gmail.com>
-- Maintainer:   Alexandre Pasmantier <alex.pasmant@gmail.com>
-- Website:      https://github.com/alexpasmantier/hubbamax.nvim
-- License:      MIT

-- Clear existing highlights when reloading
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
	vim.cmd("syntax reset")
end

-- Set colorscheme name and background (must be done after hi clear)
vim.g.colors_name = "hubbamax"
vim.o.background = "dark"

-- Import color palette
local palette = require("hubbamax.palette")

-- Terminal colors
local has_termguicolors = vim.fn.has("termguicolors") == 1
local has_gui = vim.fn.has("gui_running") == 1
local termguicolors_enabled = false

if has_termguicolors then
	-- Don't force it if user really doesn't want it, but if it's there, use it
	vim.o.termguicolors = true
	termguicolors_enabled = vim.o.termguicolors
end

if termguicolors_enabled or has_gui then
	vim.g.terminal_ansi_colors = palette.terminal

	-- Neovim uses g:terminal_color_{0-15}
	for i = 0, 15 do
		vim.g["terminal_color_" .. i] = palette.terminal[i + 1]
	end
end

-- Helper function to set highlight
local function hi(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

-- Highlight links
local links = {
	-- UI elements
	Terminal = "Normal",
	StatusLineTerm = "StatusLine",
	StatusLineTermNC = "StatusLineNC",
	MessageWindow = "Pmenu",
	PopupSelected = "PmenuSel",

	-- Standard syntax group sub-categories
	-- These provide colors for common syntax elements
	Number = "Constant",
	Boolean = "Constant",
	Float = "Number",
	Function = "Identifier",
	Conditional = "Statement",
	Repeat = "Statement",
	Label = "Statement",
	Operator = "Statement",
	Keyword = "Statement",
	Exception = "Statement",
	Include = "PreProc",
	Define = "PreProc",
	Macro = "PreProc",
	PreCondit = "PreProc",
	StorageClass = "Type",
	Structure = "Type",
	Typedef = "Type",
	SpecialChar = "Special",
	Tag = "Special",
	Delimiter = "Special",
	SpecialComment = "Special",

	-- Language-specific mappings (from original habamax)
	javaScriptFunction = "Statement",
	javaScriptIdentifier = "Statement",
	sqlKeyword = "Statement",
	yamlBlockMappingKey = "Statement",
	rubyMacro = "Statement",
	rubyDefine = "Statement",
	vimVar = "Normal",
	vimOper = "Normal",
	vimSep = "Normal",
	vimParenSep = "Normal",
	vimCommentString = "Comment",
	markdownUrl = "String",
}

for from, to in pairs(links) do
	hi(from, { link = to })
end

-- Main highlight groups (GUI/true color)
hi("Normal", {
	fg = palette.base.fg.gui,
	bg = palette.base.bg.gui,
	ctermfg = palette.base.fg.cterm,
	ctermbg = palette.base.bg.cterm,
})
hi("StatusLine", {
	fg = palette.base.bg.gui,
	bg = palette.base.gray6.gui,
	ctermfg = palette.base.bg.cterm,
	ctermbg = palette.base.gray6.cterm,
})
hi("StatusLineNC", {
	fg = palette.base.bg.gui,
	bg = palette.base.gray5.gui,
	ctermfg = palette.base.bg.cterm,
	ctermbg = palette.base.gray5.cterm,
})
hi("VertSplit", {
	fg = palette.base.gray2.gui,
	bg = palette.base.bg.gui,
	ctermfg = palette.base.gray2.cterm,
	ctermbg = palette.base.bg.cterm,
})
hi("WinSeparator", {
	fg = palette.base.gray2.gui,
	bg = palette.base.bg.gui,
	ctermfg = palette.base.gray2.cterm,
	ctermbg = palette.base.bg.cterm,
})
hi("TabLine", {
	fg = palette.base.bg.gui,
	bg = palette.base.gray5.gui,
	ctermfg = palette.base.bg.cterm,
	ctermbg = palette.base.gray5.cterm,
})
hi("TabLineFill", {
	fg = palette.base.bg.gui,
	bg = palette.base.gray5.gui,
	ctermfg = palette.base.bg.cterm,
	ctermbg = palette.base.gray5.cterm,
})
hi("TabLineSel", {
	fg = palette.base.bg.gui,
	bg = palette.base.gray6.gui,
	bold = true,
	ctermfg = palette.base.bg.cterm,
	ctermbg = palette.base.gray6.cterm,
	cterm = { bold = true },
})
hi("ToolbarLine", {})
hi("ToolbarButton", {
	fg = palette.base.gray5.gui,
	bg = palette.base.bg.gui,
	bold = true,
	reverse = true,
	ctermfg = palette.base.gray5.cterm,
	ctermbg = palette.base.bg.cterm,
	cterm = { bold = true, reverse = true },
})
hi(
	"QuickFixLine",
	{ bg = palette.accent.blue.gui, ctermfg = palette.base.bg.cterm, ctermbg = palette.accent.blue.cterm }
)
hi(
	"CursorLineNr",
	{ fg = palette.base.gray8.gui, bold = true, ctermfg = palette.base.gray8.cterm, cterm = { bold = true } }
)
hi("LineNr", { fg = palette.base.gray4.gui, ctermfg = palette.base.gray4.cterm })
hi("LineNrAbove", { fg = palette.base.gray4.gui, ctermfg = palette.base.gray4.cterm })
hi("LineNrBelow", { fg = palette.base.gray4.gui, ctermfg = palette.base.gray4.cterm })
hi("NonText", { fg = palette.base.gray4.gui, ctermfg = palette.base.gray4.cterm })
hi("EndOfBuffer", { fg = palette.base.gray4.gui, ctermfg = palette.base.gray4.cterm })
hi("SpecialKey", { fg = palette.base.gray4.gui, ctermfg = palette.base.gray4.cterm })
hi("FoldColumn", { fg = palette.base.gray4.gui, ctermfg = palette.base.gray4.cterm })
hi("Visual", {
	fg = palette.accent.cyan_light.gui,
	bg = palette.base.bg.gui,
	reverse = true,
	ctermfg = palette.accent.cyan_light.cterm,
	ctermbg = palette.base.bg.cterm,
	cterm = { reverse = true },
})
hi("VisualNOS", {
	fg = palette.base.bg.gui,
	bg = palette.accent.cyan.gui,
	ctermfg = palette.base.bg.cterm,
	ctermbg = palette.accent.cyan.cterm,
})
hi("Pmenu", { bg = palette.base.bg.gui, ctermbg = palette.base.bg.cterm })
hi("PmenuThumb", { bg = palette.base.gray5.gui, ctermbg = palette.base.gray5.cterm })
hi("PmenuSbar", {})
hi("PmenuSel", { bg = palette.base.gray4.gui, ctermbg = palette.base.gray4.cterm })
hi("PmenuKind", {
	fg = palette.accent.cyan.gui,
	bg = palette.base.gray3.gui,
	ctermfg = palette.accent.cyan.cterm,
	ctermbg = palette.base.gray3.cterm,
})
hi("PmenuKindSel", {
	fg = palette.accent.cyan.gui,
	bg = palette.base.gray4.gui,
	ctermfg = palette.accent.cyan.cterm,
	ctermbg = palette.base.gray4.cterm,
})
hi("PmenuExtra", {
	fg = palette.base.gray5.gui,
	bg = palette.base.gray3.gui,
	ctermfg = palette.base.gray5.cterm,
	ctermbg = palette.base.gray3.cterm,
})
hi("PmenuExtraSel", {
	fg = palette.base.gray6.gui,
	bg = palette.base.gray4.gui,
	ctermfg = palette.base.gray6.cterm,
	ctermbg = palette.base.gray4.cterm,
})
hi("PmenuMatch", {
	fg = palette.accent.orange.gui,
	bg = palette.base.gray3.gui,
	ctermfg = palette.accent.orange.cterm,
	ctermbg = palette.base.gray3.cterm,
})
hi("PmenuMatchSel", {
	fg = palette.accent.orange.gui,
	bg = palette.base.gray4.gui,
	ctermfg = palette.accent.orange.cterm,
	ctermbg = palette.base.gray4.cterm,
})
hi("SignColumn", {})
hi("NormalFloat", {
	fg = palette.base.fg.gui,
	bg = palette.base.bg.gui,
	ctermfg = palette.base.fg.cterm,
	ctermbg = palette.base.bg.cterm,
})
hi("FloatBorder", { fg = palette.base.gray5.gui, bg = palette.base.bg.gui, ctermfg = palette.base.gray5.cterm, ctermbg = palette.base.bg.cterm })
hi("FloatTitle", {
	fg = palette.accent.blue_bright.gui,
	bg = palette.base.bg.gui,
	bold = true,
	ctermfg = palette.accent.blue_bright.cterm,
	ctermbg = palette.base.bg.cterm,
	cterm = { bold = true },
})
hi("Error", {
	fg = palette.accent.red.gui,
	bg = palette.base.bg.gui,
	reverse = true,
	ctermfg = palette.accent.red.cterm,
	ctermbg = palette.base.bg.cterm,
	cterm = { reverse = true },
})
hi("ErrorMsg", {
	fg = palette.accent.red.gui,
	bg = palette.base.bg.gui,
	reverse = true,
	ctermfg = palette.accent.red.cterm,
	ctermbg = palette.base.bg.cterm,
	cterm = { reverse = true },
})
hi("ModeMsg", { bold = true, cterm = { bold = true } })
hi("MoreMsg", { fg = palette.accent.green.gui, ctermfg = palette.accent.green.cterm })
hi("Question", { fg = palette.accent.yellow_bright.gui, ctermfg = palette.accent.yellow_bright.cterm })
hi("WarningMsg", { fg = palette.accent.pink.gui, ctermfg = palette.accent.pink.cterm })
hi("Todo", { fg = palette.base.gray8.gui, bold = true, ctermfg = palette.base.gray8.cterm, cterm = { bold = true } })
hi("MatchParen", {
	fg = palette.accent.magenta_bright.gui,
	bold = true,
	ctermfg = palette.accent.magenta_bright.cterm,
	cterm = { bold = true },
})
hi("Search", {
	fg = palette.accent.blue_bright.gui,
	bg = palette.base.bg.gui,
	reverse = true,
	ctermfg = palette.accent.blue_bright.cterm,
	ctermbg = palette.base.bg.cterm,
	cterm = { reverse = true },
})
hi("IncSearch", {
	fg = palette.accent.orange.gui,
	bg = palette.base.bg.gui,
	reverse = true,
	ctermfg = palette.accent.orange.cterm,
	ctermbg = palette.base.bg.cterm,
	cterm = { reverse = true },
})
hi("CurSearch", {
	fg = palette.accent.orange.gui,
	bg = palette.base.bg.gui,
	reverse = true,
	ctermfg = palette.accent.orange.cterm,
	ctermbg = palette.base.bg.cterm,
	cterm = { reverse = true },
})
hi("WildMenu", {
	fg = palette.base.bg.gui,
	bg = palette.accent.yellow_bright.gui,
	bold = true,
	ctermfg = palette.base.bg.cterm,
	ctermbg = palette.accent.yellow_bright.cterm,
	cterm = { bold = true },
})
hi("debugPC", {
	fg = palette.base.bg.gui,
	bg = palette.accent.blue.gui,
	ctermfg = palette.base.bg.cterm,
	ctermbg = palette.accent.blue.cterm,
})
hi("debugBreakpoint", {
	fg = palette.base.bg.gui,
	bg = palette.accent.pink.gui,
	ctermfg = palette.base.bg.cterm,
	ctermbg = palette.accent.pink.cterm,
})
hi("Cursor", { fg = palette.base.black.gui, bg = palette.base.gray8.gui })
hi("lCursor", { fg = palette.base.bg.gui, bg = palette.base.bright_green.gui })
hi("CursorLine", { bg = palette.base.gray2.gui, ctermbg = palette.base.gray2.cterm })
hi("CursorColumn", { bg = palette.base.gray2.gui, ctermbg = palette.base.gray2.cterm })
hi("Folded", {
	fg = palette.base.gray6.gui,
	bg = palette.base.gray1.gui,
	ctermfg = palette.base.gray6.cterm,
	ctermbg = palette.base.gray1.cterm,
})
hi("ColorColumn", { bg = palette.base.gray3.gui, ctermbg = palette.base.gray3.cterm })
hi("SpellBad", {
	sp = palette.accent.red_bright.gui,
	undercurl = true,
	ctermfg = palette.accent.red_bright.cterm,
	cterm = { underline = true },
})
hi("SpellCap", {
	sp = palette.accent.orange.gui,
	undercurl = true,
	ctermfg = palette.accent.orange.cterm,
	cterm = { underline = true },
})
hi("SpellLocal", {
	sp = palette.accent.green_bright.gui,
	undercurl = true,
	ctermfg = palette.accent.green_bright.cterm,
	cterm = { underline = true },
})
hi("SpellRare", {
	sp = palette.accent.magenta.gui,
	undercurl = true,
	ctermfg = palette.accent.magenta.cterm,
	cterm = { underline = true },
})
hi("Comment", { fg = palette.base.gray5.gui, ctermfg = palette.base.gray5.cterm })
hi("Constant", { fg = palette.accent.pink.gui, ctermfg = palette.accent.pink.cterm })
hi("String", { fg = palette.accent.green.gui, ctermfg = palette.accent.green.cterm })
hi("Character", { fg = palette.accent.green_light.gui, ctermfg = palette.accent.green_light.cterm })
hi("Identifier", { fg = palette.accent.cyan_light.gui, ctermfg = palette.accent.cyan_light.cterm })
hi("Statement", { fg = palette.accent.purple.gui, ctermfg = palette.accent.purple.cterm })
hi("PreProc", { fg = palette.accent.yellow.gui, ctermfg = palette.accent.yellow.cterm })
hi("Type", { fg = palette.accent.blue.gui, ctermfg = palette.accent.blue.cterm })
hi("Special", { fg = palette.accent.cyan.gui, ctermfg = palette.accent.cyan.cterm })
hi("Underlined", { underline = true, cterm = { underline = true } })
hi("Title", { bold = true, cterm = { bold = true } })
hi("Directory", {
	fg = palette.accent.cyan_light.gui,
	bold = true,
	ctermfg = palette.accent.cyan_light.cterm,
	cterm = { bold = true },
})
hi("Conceal", { fg = palette.base.gray4.gui, ctermfg = palette.base.gray4.cterm })
hi("Ignore", {})
hi("Debug", { fg = palette.accent.cyan.gui, ctermfg = palette.accent.cyan.cterm })
hi(
	"DiffAdd",
	{ fg = palette.accent.green.gui, reverse = true, ctermfg = palette.accent.green.cterm, cterm = { reverse = true } }
)
hi(
	"DiffChange",
	{ fg = palette.accent.blue.gui, reverse = true, ctermfg = palette.accent.blue.cterm, cterm = { reverse = true } }
)
hi(
	"DiffText",
	{
		fg = palette.accent.purple.gui,
		reverse = true,
		ctermfg = palette.accent.purple.cterm,
		cterm = { reverse = true },
	}
)
hi(
	"DiffDelete",
	{ fg = palette.accent.red.gui, reverse = true, ctermfg = palette.accent.red.cterm, cterm = { reverse = true } }
)
hi("Added", { fg = palette.accent.green_bright.gui, ctermfg = palette.accent.green_bright.cterm })
hi("Changed", { fg = palette.accent.orange.gui, ctermfg = palette.accent.orange.cterm })
hi("Removed", { fg = palette.accent.red_bright.gui, ctermfg = palette.accent.red_bright.cterm })

-- Neovim-specific UI elements
hi("WinBar", {
	fg = palette.base.gray6.gui,
	bg = palette.base.bg.gui,
	bold = true,
	ctermfg = palette.base.gray6.cterm,
	ctermbg = palette.base.bg.cterm,
	cterm = { bold = true },
})
hi("WinBarNC", { fg = palette.base.gray5.gui, bg = palette.base.bg.gui, ctermfg = palette.base.gray5.cterm, ctermbg = palette.base.bg.cterm })
hi("Whitespace", { fg = palette.base.gray4.gui, ctermfg = palette.base.gray4.cterm })

-- LSP Diagnostics
hi("DiagnosticError", { fg = palette.accent.red.gui, ctermfg = palette.accent.red.cterm })
hi("DiagnosticWarn", { fg = palette.accent.orange.gui, ctermfg = palette.accent.orange.cterm })
hi("DiagnosticInfo", { fg = palette.accent.blue_bright.gui, ctermfg = palette.accent.blue_bright.cterm })
hi("DiagnosticHint", { fg = palette.accent.cyan.gui, ctermfg = palette.accent.cyan.cterm })
hi("DiagnosticOk", { fg = palette.accent.green.gui, ctermfg = palette.accent.green.cterm })

-- Diagnostic virtual text
hi("DiagnosticVirtualTextError", { fg = palette.accent.red.gui, ctermfg = palette.accent.red.cterm })
hi("DiagnosticVirtualTextWarn", { fg = palette.accent.orange.gui, ctermfg = palette.accent.orange.cterm })
hi("DiagnosticVirtualTextInfo", { fg = palette.accent.blue_bright.gui, ctermfg = palette.accent.blue_bright.cterm })
hi("DiagnosticVirtualTextHint", { fg = palette.accent.cyan.gui, ctermfg = palette.accent.cyan.cterm })

-- Diagnostic underlines
hi("DiagnosticUnderlineError", { sp = palette.accent.red.gui, undercurl = true, cterm = { underline = true } })
hi("DiagnosticUnderlineWarn", { sp = palette.accent.orange.gui, undercurl = true, cterm = { underline = true } })
hi("DiagnosticUnderlineInfo", { sp = palette.accent.blue_bright.gui, undercurl = true, cterm = { underline = true } })
hi("DiagnosticUnderlineHint", { sp = palette.accent.cyan.gui, undercurl = true, cterm = { underline = true } })

-- Diagnostic signs (gutter)
hi("DiagnosticSignError", { fg = palette.accent.red.gui, ctermfg = palette.accent.red.cterm })
hi("DiagnosticSignWarn", { fg = palette.accent.orange.gui, ctermfg = palette.accent.orange.cterm })
hi("DiagnosticSignInfo", { fg = palette.accent.blue_bright.gui, ctermfg = palette.accent.blue_bright.cterm })
hi("DiagnosticSignHint", { fg = palette.accent.cyan.gui, ctermfg = palette.accent.cyan.cterm })

-- LSP references
hi("LspReferenceText", { bg = palette.base.gray3.gui, ctermbg = palette.base.gray3.cterm })
hi("LspReferenceRead", { bg = palette.base.gray3.gui, ctermbg = palette.base.gray3.cterm })
hi("LspReferenceWrite", { bg = palette.base.gray3.gui, ctermbg = palette.base.gray3.cterm })

-- LSP semantic tokens
hi("LspSignatureActiveParameter", {
	fg = palette.accent.orange.gui,
	bold = true,
	ctermfg = palette.accent.orange.cterm,
	cterm = { bold = true },
})

-- Inlay hints
hi("LspInlayHint", { fg = palette.base.gray4.gui, ctermfg = palette.base.gray4.cterm })

-- Treesitter highlight groups
-- These provide consistent colors when treesitter is enabled
hi("@variable", { link = "Identifier" })
hi("@variable.builtin", { link = "Special" })
hi("@variable.parameter", { link = "Identifier" })
hi("@variable.member", { link = "Identifier" })
hi("@constant", { link = "Constant" })
hi("@constant.builtin", { link = "Special" })
hi("@module", { link = "Include" })
hi("@label", { link = "Label" })
hi("@string", { link = "String" })
hi("@string.regexp", { link = "SpecialChar" })
hi("@string.escape", { link = "SpecialChar" })
hi("@string.special", { link = "SpecialChar" })
hi("@character", { link = "Character" })
hi("@character.special", { link = "SpecialChar" })
hi("@number", { link = "Number" })
hi("@boolean", { link = "Boolean" })
hi("@number.float", { link = "Float" })
hi("@function", { link = "Function" })
hi("@function.builtin", { link = "Special" })
hi("@function.call", { link = "Function" })
hi("@function.macro", { link = "Macro" })
hi("@function.method", { link = "Function" })
hi("@function.method.call", { link = "Function" })
hi("@constructor", { link = "Special" })
hi("@operator", { link = "Operator" })
hi("@keyword", { link = "Keyword" })
hi("@keyword.function", { link = "Keyword" })
hi("@keyword.operator", { link = "Keyword" })
hi("@keyword.return", { link = "Keyword" })
hi("@keyword.conditional", { link = "Conditional" })
hi("@keyword.repeat", { link = "Repeat" })
hi("@keyword.import", { link = "Include" })
hi("@keyword.exception", { link = "Exception" })
hi("@type", { link = "Type" })
hi("@type.builtin", { link = "Type" })
hi("@type.definition", { link = "Typedef" })
hi("@type.qualifier", { link = "Keyword" })
hi("@attribute", { link = "PreProc" })
hi("@property", { link = "Identifier" })
hi("@comment", { link = "Comment" })
hi("@punctuation.delimiter", { link = "Delimiter" })
hi("@punctuation.bracket", { link = "Delimiter" })
hi("@punctuation.special", { link = "Special" })
hi("@tag", { link = "Tag" })
hi("@tag.attribute", { link = "Identifier" })
hi("@tag.delimiter", { link = "Delimiter" })

-- Markdown highlights
-- Headers - descending hierarchy with bold for top levels
hi("markdownH1", {
	fg = palette.accent.blue_bright.gui,
	bold = true,
	ctermfg = palette.accent.blue_bright.cterm,
	cterm = { bold = true },
})
hi(
	"markdownH2",
	{ fg = palette.accent.blue.gui, bold = true, ctermfg = palette.accent.blue.cterm, cterm = { bold = true } }
)
hi(
	"markdownH3",
	{ fg = palette.accent.purple.gui, bold = true, ctermfg = palette.accent.purple.cterm, cterm = { bold = true } }
)
hi("markdownH4", { fg = palette.accent.cyan_light.gui, ctermfg = palette.accent.cyan_light.cterm })
hi("markdownH5", { fg = palette.accent.cyan.gui, ctermfg = palette.accent.cyan.cterm })
hi("markdownH6", { fg = palette.base.gray5.gui, ctermfg = palette.base.gray5.cterm })
hi("markdownHeadingDelimiter", { fg = palette.accent.blue.gui, ctermfg = palette.accent.blue.cterm })

-- Emphasis
hi("markdownBold", { bold = true, cterm = { bold = true } })
hi("markdownItalic", { italic = true, cterm = { italic = true } })
hi("markdownBoldItalic", { bold = true, italic = true, cterm = { bold = true, italic = true } })

-- Code
hi("markdownCode", { fg = palette.accent.yellow.gui, ctermfg = palette.accent.yellow.cterm })
hi("markdownCodeBlock", { fg = palette.accent.yellow.gui, ctermfg = palette.accent.yellow.cterm })
hi("markdownCodeDelimiter", { fg = palette.accent.cyan.gui, ctermfg = palette.accent.cyan.cterm })

-- Links - using the existing markdownUrl link and expanding
hi("markdownLink", {
	fg = palette.accent.cyan_light.gui,
	underline = true,
	ctermfg = palette.accent.cyan_light.cterm,
	cterm = { underline = true },
})
hi("markdownLinkText", { fg = palette.accent.blue_bright.gui, ctermfg = palette.accent.blue_bright.cterm })
hi("markdownLinkDelimiter", { fg = palette.base.gray5.gui, ctermfg = palette.base.gray5.cterm })
hi("markdownUrlDelimiter", { fg = palette.base.gray5.gui, ctermfg = palette.base.gray5.cterm })
hi("markdownUrlTitle", { fg = palette.accent.green.gui, ctermfg = palette.accent.green.cterm })
hi("markdownIdDeclaration", { fg = palette.accent.blue_bright.gui, ctermfg = palette.accent.blue_bright.cterm })
hi("markdownId", { fg = palette.accent.cyan_light.gui, ctermfg = palette.accent.cyan_light.cterm })
hi("markdownLinkTextDelimiter", { fg = palette.base.gray5.gui, ctermfg = palette.base.gray5.cterm })

-- Lists
hi("markdownListMarker", { fg = palette.accent.pink.gui, ctermfg = palette.accent.pink.cterm })
hi("markdownOrderedListMarker", { fg = palette.accent.pink.gui, ctermfg = palette.accent.pink.cterm })

-- Blockquotes
hi("markdownBlockquote", { fg = palette.base.gray5.gui, ctermfg = palette.base.gray5.cterm })
hi("markdownBlockquoteDelimiter", { fg = palette.base.gray4.gui, ctermfg = palette.base.gray4.cterm })

-- Rules and breaks
hi("markdownRule", { fg = palette.base.gray4.gui, ctermfg = palette.base.gray4.cterm })
hi("markdownLineBreak", { fg = palette.base.gray4.gui, ctermfg = palette.base.gray4.cterm })

-- Other elements
hi("markdownFootnote", { fg = palette.accent.cyan_light.gui, ctermfg = palette.accent.cyan_light.cterm })
hi("markdownFootnoteDefinition", { fg = palette.accent.cyan_light.gui, ctermfg = palette.accent.cyan_light.cterm })
hi("markdownEscape", { fg = palette.accent.cyan.gui, ctermfg = palette.accent.cyan.cterm })

-- Treesitter Markdown highlights (for nvim-treesitter users)
-- Headers
hi("@markup.heading.1.markdown", {
	fg = palette.accent.blue_bright.gui,
	bold = true,
	ctermfg = palette.accent.blue_bright.cterm,
	cterm = { bold = true },
})
hi(
	"@markup.heading.2.markdown",
	{ fg = palette.accent.blue.gui, bold = true, ctermfg = palette.accent.blue.cterm, cterm = { bold = true } }
)
hi(
	"@markup.heading.3.markdown",
	{ fg = palette.accent.purple.gui, bold = true, ctermfg = palette.accent.purple.cterm, cterm = { bold = true } }
)
hi("@markup.heading.4.markdown", { fg = palette.accent.cyan_light.gui, ctermfg = palette.accent.cyan_light.cterm })
hi("@markup.heading.5.markdown", { fg = palette.accent.cyan.gui, ctermfg = palette.accent.cyan.cterm })
hi("@markup.heading.6.markdown", { fg = palette.base.gray5.gui, ctermfg = palette.base.gray5.cterm })

-- Emphasis
hi("@markup.strong.markdown_inline", { bold = true, cterm = { bold = true } })
hi("@markup.italic.markdown_inline", { italic = true, cterm = { italic = true } })

-- Code
hi("@markup.raw.markdown_inline", { fg = palette.accent.yellow.gui, ctermfg = palette.accent.yellow.cterm })
hi("@markup.raw.block.markdown", { fg = palette.accent.yellow.gui, ctermfg = palette.accent.yellow.cterm })

-- Links
hi(
	"@markup.link.label.markdown_inline",
	{ fg = palette.accent.blue_bright.gui, ctermfg = palette.accent.blue_bright.cterm }
)
hi("@markup.link.url.markdown_inline", {
	fg = palette.accent.cyan_light.gui,
	underline = true,
	ctermfg = palette.accent.cyan_light.cterm,
	cterm = { underline = true },
})
hi("@markup.link.markdown_inline", { fg = palette.accent.green.gui, ctermfg = palette.accent.green.cterm })

-- Lists
hi("@markup.list.markdown", { fg = palette.accent.pink.gui, ctermfg = palette.accent.pink.cterm })
hi("@markup.list.checked.markdown", { fg = palette.accent.green.gui, ctermfg = palette.accent.green.cterm })
hi("@markup.list.unchecked.markdown", { fg = palette.accent.pink.gui, ctermfg = palette.accent.pink.cterm })

-- Quotes
hi("@markup.quote.markdown", { fg = palette.base.gray5.gui, ctermfg = palette.base.gray5.cterm })

-- Other
hi("@punctuation.delimiter.markdown_inline", { fg = palette.base.gray5.gui, ctermfg = palette.base.gray5.cterm })
hi("@punctuation.special.markdown", { fg = palette.base.gray4.gui, ctermfg = palette.base.gray4.cterm })

-- Neo-tree highlights
-- Root and directory
hi("NeoTreeRootName", {
	fg = palette.accent.blue_bright.gui,
	bold = true,
	ctermfg = palette.accent.blue_bright.cterm,
	cterm = { bold = true },
})
hi("NeoTreeDirectoryName", { fg = palette.accent.cyan_light.gui, ctermfg = palette.accent.cyan_light.cterm })
hi("NeoTreeDirectoryIcon", { fg = palette.accent.cyan_light.gui, ctermfg = palette.accent.cyan_light.cterm })

-- Files
hi("NeoTreeFileName", { fg = palette.base.fg.gui, ctermfg = palette.base.fg.cterm })
hi("NeoTreeFileNameOpened", {
	fg = palette.accent.blue_bright.gui,
	bold = true,
	ctermfg = palette.accent.blue_bright.cterm,
	cterm = { bold = true },
})

-- Symbolic links
hi("NeoTreeSymbolicLinkTarget", { fg = palette.accent.purple.gui, ctermfg = palette.accent.purple.cterm })

-- Git status
hi("NeoTreeGitAdded", { fg = palette.accent.green_bright.gui, ctermfg = palette.accent.green_bright.cterm })
hi("NeoTreeGitModified", { fg = palette.accent.orange.gui, ctermfg = palette.accent.orange.cterm })
hi("NeoTreeGitDeleted", { fg = palette.accent.red_bright.gui, ctermfg = palette.accent.red_bright.cterm })
hi("NeoTreeGitRenamed", { fg = palette.accent.yellow_bright.gui, ctermfg = palette.accent.yellow_bright.cterm })
hi("NeoTreeGitUntracked", { fg = palette.base.gray5.gui, ctermfg = palette.base.gray5.cterm })
hi("NeoTreeGitIgnored", { fg = palette.base.gray4.gui, ctermfg = palette.base.gray4.cterm })
hi("NeoTreeGitConflict", {
	fg = palette.accent.red.gui,
	bold = true,
	ctermfg = palette.accent.red.cterm,
	cterm = { bold = true },
})
hi("NeoTreeGitUnstaged", { fg = palette.accent.orange.gui, ctermfg = palette.accent.orange.cterm })
hi("NeoTreeGitStaged", { fg = palette.accent.green.gui, ctermfg = palette.accent.green.cterm })

-- Indentation
hi("NeoTreeIndentMarker", { fg = palette.base.gray4.gui, ctermfg = palette.base.gray4.cterm })
hi("NeoTreeExpander", { fg = palette.base.gray5.gui, ctermfg = palette.base.gray5.cterm })

-- Window UI
hi(
	"NeoTreeNormal",
	{
		fg = palette.base.fg.gui,
		bg = palette.base.bg.gui,
		ctermfg = palette.base.fg.cterm,
		ctermbg = palette.base.bg.cterm,
	}
)
hi(
	"NeoTreeNormalNC",
	{
		fg = palette.base.fg.gui,
		bg = palette.base.bg.gui,
		ctermfg = palette.base.fg.cterm,
		ctermbg = palette.base.bg.cterm,
	}
)
hi("NeoTreeSignColumn", { bg = palette.base.bg.gui, ctermbg = palette.base.bg.cterm })
hi("NeoTreeCursorLine", { bg = palette.base.gray2.gui, ctermbg = palette.base.gray2.cterm })

-- Title bar
hi("NeoTreeTitleBar", {
	fg = palette.base.bg.gui,
	bg = palette.accent.blue.gui,
	bold = true,
	ctermfg = palette.base.bg.cterm,
	ctermbg = palette.accent.blue.cterm,
	cterm = { bold = true },
})

-- Floating windows
hi("NeoTreeFloatBorder", { fg = palette.base.gray5.gui, ctermfg = palette.base.gray5.cterm })
hi("NeoTreeFloatTitle", {
	fg = palette.accent.blue_bright.gui,
	bold = true,
	ctermfg = palette.accent.blue_bright.cterm,
	cterm = { bold = true },
})

-- Diagnostics
hi("NeoTreeDiagnosticError", { fg = palette.accent.red.gui, ctermfg = palette.accent.red.cterm })
hi("NeoTreeDiagnosticWarn", { fg = palette.accent.orange.gui, ctermfg = palette.accent.orange.cterm })
hi("NeoTreeDiagnosticInfo", { fg = palette.accent.blue_bright.gui, ctermfg = palette.accent.blue_bright.cterm })
hi("NeoTreeDiagnosticHint", { fg = palette.accent.cyan.gui, ctermfg = palette.accent.cyan.cterm })

-- Buffer tabs
hi("NeoTreeTabActive", {
	fg = palette.base.bg.gui,
	bg = palette.accent.blue.gui,
	bold = true,
	ctermfg = palette.base.bg.cterm,
	ctermbg = palette.accent.blue.cterm,
	cterm = { bold = true },
})
hi("NeoTreeTabInactive", {
	fg = palette.base.gray5.gui,
	bg = palette.base.gray2.gui,
	ctermfg = palette.base.gray5.cterm,
	ctermbg = palette.base.gray2.cterm,
})
hi("NeoTreeTabSeparatorActive", { fg = palette.accent.blue.gui, ctermfg = palette.accent.blue.cterm })
hi("NeoTreeTabSeparatorInactive", { fg = palette.base.gray2.gui, ctermfg = palette.base.gray2.cterm })

-- File stats
hi("NeoTreeModified", { fg = palette.accent.orange.gui, ctermfg = palette.accent.orange.cterm })
hi("NeoTreeDimText", { fg = palette.base.gray4.gui, ctermfg = palette.base.gray4.cterm })

-- Preview window
hi("NeoTreePreview", { bg = palette.base.gray1.gui, ctermbg = palette.base.gray1.cterm })

-- Filters
hi("NeoTreeFilterTerm", {
	fg = palette.accent.green.gui,
	bold = true,
	ctermfg = palette.accent.green.cterm,
	cterm = { bold = true },
})
hi("NeoTreeDotfile", { fg = palette.base.gray5.gui, ctermfg = palette.base.gray5.cterm })
hi("NeoTreeHiddenByName", { fg = palette.base.gray4.gui, ctermfg = palette.base.gray4.cterm })

-- File icons (fallback)
hi("NeoTreeFileIcon", { fg = palette.base.fg.gui, ctermfg = palette.base.fg.cterm })

-- Window picker
hi("NeoTreeWindowsHidden", { fg = palette.base.gray4.gui, ctermfg = palette.base.gray4.cterm })
