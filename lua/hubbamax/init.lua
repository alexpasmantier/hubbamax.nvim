-- Name:         hubbamax
-- Description:  Easier on the eyes habamax
-- Author:       Alexandre Pasmantier <alex.pasmant@gmail.com>
-- Maintainer:   Alexandre Pasmantier <alex.pasmant@gmail.com>
-- Website:      https://github.com/alexpasmantier/hubbamax.nvim
-- License:      MIT

-- Reset to default Neovim colors (vim.lua)
vim.cmd("source $VIMRUNTIME/colors/vim.lua")

-- Set colorscheme name and background
vim.g.colors_name = "hubbamax"
vim.o.background = "dark"

-- Terminal colors
local has_termguicolors = vim.fn.has("termguicolors") == 1
local has_gui = vim.fn.has("gui_running") == 1
local termguicolors_enabled = false

if has_termguicolors then
	-- Don't force it if user really doesn't want it, but if it's there, use it
	-- (comment this out if you *never* want to toggle user settings)
	vim.o.termguicolors = true
	termguicolors_enabled = vim.o.termguicolors
end

if termguicolors_enabled or has_gui then
	local terminal_colors = {
		"#1c1c1c",
		"#af5f5f",
		"#5faf5f",
		"#af875f",
		"#5f87af",
		"#af87af",
		"#5f8787",
		"#9e9e9e",
		"#767676",
		"#d75f87",
		"#87d787",
		"#d7af87",
		"#5fafd7",
		"#d787d7",
		"#87afaf",
		"#bcbcbc",
	}

	vim.g.terminal_ansi_colors = terminal_colors

	-- Neovim uses g:terminal_color_{0-15}
	for i = 0, 15 do
		vim.g["terminal_color_" .. i] = terminal_colors[i + 1]
	end
end

-- Helper function to set highlight
local function hi(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

-- Highlight links
local links = {
	Terminal = "Normal",
	StatusLineTerm = "StatusLine",
	StatusLineTermNC = "StatusLineNC",
	MessageWindow = "Pmenu",
	PopupSelected = "PmenuSel",
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
hi("Normal", { fg = "#bcbcbc", bg = "#1c1c1c", ctermfg = 250, ctermbg = 234 })
hi("StatusLine", { fg = "#1c1c1c", bg = "#9e9e9e", ctermfg = 234, ctermbg = 247 })
hi("StatusLineNC", { fg = "#1c1c1c", bg = "#767676", ctermfg = 234, ctermbg = 243 })
hi("VertSplit", { fg = "#767676", bg = "#1c1c1c", ctermfg = 243, ctermbg = 234 })
hi("TabLine", { fg = "#1c1c1c", bg = "#767676", ctermfg = 234, ctermbg = 243 })
hi("TabLineFill", { fg = "#1c1c1c", bg = "#767676", ctermfg = 234, ctermbg = 243 })
hi("TabLineSel", { fg = "#1c1c1c", bg = "#9e9e9e", bold = true, ctermfg = 234, ctermbg = 247, cterm = { bold = true } })
hi("ToolbarLine", {})
hi("ToolbarButton", {
	fg = "#767676",
	bg = "#1c1c1c",
	bold = true,
	reverse = true,
	ctermfg = 243,
	ctermbg = 234,
	cterm = { bold = true, reverse = true },
})
hi("QuickFixLine", { bg = "#5f87af", ctermfg = 234, ctermbg = 67 })
hi("CursorLineNr", { fg = "#dadada", bold = true, ctermfg = 253, cterm = { bold = true } })
hi("LineNr", { fg = "#585858", ctermfg = 240 })
hi("LineNrAbove", { fg = "#585858", ctermfg = 240 })
hi("LineNrBelow", { fg = "#585858", ctermfg = 240 })
hi("NonText", { fg = "#585858", ctermfg = 240 })
hi("EndOfBuffer", { fg = "#585858", ctermfg = 240 })
hi("SpecialKey", { fg = "#585858", ctermfg = 240 })
hi("FoldColumn", { fg = "#585858", ctermfg = 240 })
hi("Visual", {
	fg = "#87afaf",
	bg = "#1c1c1c",
	reverse = true,
	ctermfg = 109,
	ctermbg = 234,
	cterm = { reverse = true },
})
hi("VisualNOS", { fg = "#1c1c1c", bg = "#5f8787", ctermfg = 234, ctermbg = 66 })
hi("Pmenu", { bg = "#1c1c1c", ctermbg = 234 })
hi("PmenuThumb", { bg = "#767676", ctermbg = 243 })
hi("PmenuSbar", {})
hi("PmenuSel", { bg = "#585858", ctermbg = 240 })
hi("PmenuKind", { fg = "#5f8787", bg = "#3a3a3a", ctermfg = 66, ctermbg = 237 })
hi("PmenuKindSel", { fg = "#5f8787", bg = "#585858", ctermfg = 66, ctermbg = 240 })
hi("PmenuExtra", { fg = "#767676", bg = "#3a3a3a", ctermfg = 243, ctermbg = 237 })
hi("PmenuExtraSel", { fg = "#9e9e9e", bg = "#585858", ctermfg = 247, ctermbg = 240 })
hi("PmenuMatch", { fg = "#ffaf5f", bg = "#3a3a3a", ctermfg = 215, ctermbg = 237 })
hi("PmenuMatchSel", { fg = "#ffaf5f", bg = "#585858", ctermfg = 215, ctermbg = 240 })
hi("SignColumn", {})
hi("Error", {
	fg = "#af5f5f",
	bg = "#1c1c1c",
	reverse = true,
	ctermfg = 131,
	ctermbg = 234,
	cterm = { reverse = true },
})
hi("ErrorMsg", {
	fg = "#af5f5f",
	bg = "#1c1c1c",
	reverse = true,
	ctermfg = 131,
	ctermbg = 234,
	cterm = { reverse = true },
})
hi("ModeMsg", { bold = true, cterm = { bold = true } })
hi("MoreMsg", { fg = "#5faf5f", ctermfg = 71 })
hi("Question", { fg = "#d7af87", ctermfg = 180 })
hi("WarningMsg", { fg = "#d75f87", ctermfg = 168 })
hi("Todo", { fg = "#dadada", bold = true, ctermfg = 253, cterm = { bold = true } })
hi("MatchParen", { fg = "#ff00af", bold = true, ctermfg = 199, cterm = { bold = true } })
hi("Search", {
	fg = "#5fafd7",
	bg = "#1c1c1c",
	reverse = true,
	ctermfg = 74,
	ctermbg = 234,
	cterm = { reverse = true },
})
hi("IncSearch", {
	fg = "#ffaf5f",
	bg = "#1c1c1c",
	reverse = true,
	ctermfg = 215,
	ctermbg = 234,
	cterm = { reverse = true },
})
hi("CurSearch", {
	fg = "#ffaf5f",
	bg = "#1c1c1c",
	reverse = true,
	ctermfg = 215,
	ctermbg = 234,
	cterm = { reverse = true },
})
hi("WildMenu", {
	fg = "#1c1c1c",
	bg = "#d7af87",
	bold = true,
	ctermfg = 234,
	ctermbg = 180,
	cterm = { bold = true },
})
hi("debugPC", { fg = "#1c1c1c", bg = "#5f87af", ctermfg = 234, ctermbg = 67 })
hi("debugBreakpoint", { fg = "#1c1c1c", bg = "#d75f87", ctermfg = 234, ctermbg = 168 })
hi("Cursor", { fg = "#000000", bg = "#dadada" })
hi("lCursor", { fg = "#1c1c1c", bg = "#5fff00" })
hi("CursorLine", { bg = "#303030", ctermbg = 236 })
hi("CursorColumn", { bg = "#303030", ctermbg = 236 })
hi("Folded", { fg = "#9e9e9e", bg = "#262626", ctermfg = 247, ctermbg = 235 })
hi("ColorColumn", { bg = "#3a3a3a", ctermbg = 237 })
hi("SpellBad", { sp = "#d75f5f", undercurl = true, ctermfg = 167, cterm = { underline = true } })
hi("SpellCap", { sp = "#ffaf5f", undercurl = true, ctermfg = 215, cterm = { underline = true } })
hi("SpellLocal", { sp = "#5fd75f", undercurl = true, ctermfg = 77, cterm = { underline = true } })
hi("SpellRare", { sp = "#d787d7", undercurl = true, ctermfg = 176, cterm = { underline = true } })
hi("Comment", { fg = "#767676", ctermfg = 243 })
hi("Constant", { fg = "#d75f87", ctermfg = 168 })
hi("String", { fg = "#5faf5f", ctermfg = 71 })
hi("Character", { fg = "#87d787", ctermfg = 114 })
hi("Identifier", { fg = "#87afaf", ctermfg = 109 })
hi("Statement", { fg = "#af87af", ctermfg = 139 })
hi("PreProc", { fg = "#af875f", ctermfg = 137 })
hi("Type", { fg = "#5f87af", ctermfg = 67 })
hi("Special", { fg = "#5f8787", ctermfg = 66 })
hi("Underlined", { underline = true, cterm = { underline = true } })
hi("Title", { bold = true, cterm = { bold = true } })
hi("Directory", { fg = "#87afaf", bold = true, ctermfg = 109, cterm = { bold = true } })
hi("Conceal", { fg = "#585858", ctermfg = 240 })
hi("Ignore", {})
hi("Debug", { fg = "#5f8787", ctermfg = 66 })
hi("DiffAdd", { fg = "#5faf5f", reverse = true, ctermfg = 71, cterm = { reverse = true } })
hi("DiffChange", { fg = "#5f87af", reverse = true, ctermfg = 67, cterm = { reverse = true } })
hi("DiffText", { fg = "#af87af", reverse = true, ctermfg = 139, cterm = { reverse = true } })
hi("DiffDelete", { fg = "#af5f5f", reverse = true, ctermfg = 131, cterm = { reverse = true } })
hi("Added", { fg = "#5fd75f", ctermfg = 77 })
hi("Changed", { fg = "#ffaf5f", ctermfg = 215 })
hi("Removed", { fg = "#d75f5f", ctermfg = 167 })

-- Markdown highlights
-- Headers - descending hierarchy with bold for top levels
hi("markdownH1", { fg = "#5fafd7", bold = true, ctermfg = 74, cterm = { bold = true } })
hi("markdownH2", { fg = "#5f87af", bold = true, ctermfg = 67, cterm = { bold = true } })
hi("markdownH3", { fg = "#af87af", bold = true, ctermfg = 139, cterm = { bold = true } })
hi("markdownH4", { fg = "#87afaf", ctermfg = 109 })
hi("markdownH5", { fg = "#5f8787", ctermfg = 66 })
hi("markdownH6", { fg = "#767676", ctermfg = 243 })
hi("markdownHeadingDelimiter", { fg = "#5f87af", ctermfg = 67 })

-- Emphasis
hi("markdownBold", { bold = true, cterm = { bold = true } })
hi("markdownItalic", { italic = true, cterm = { italic = true } })
hi("markdownBoldItalic", { bold = true, italic = true, cterm = { bold = true, italic = true } })

-- Code
hi("markdownCode", { fg = "#af875f", ctermfg = 137 })
hi("markdownCodeBlock", { fg = "#af875f", ctermfg = 137 })
hi("markdownCodeDelimiter", { fg = "#5f8787", ctermfg = 66 })

-- Links - using the existing markdownUrl link and expanding
hi("markdownLink", { fg = "#87afaf", underline = true, ctermfg = 109, cterm = { underline = true } })
hi("markdownLinkText", { fg = "#5fafd7", ctermfg = 74 })
hi("markdownLinkDelimiter", { fg = "#767676", ctermfg = 243 })
hi("markdownUrlDelimiter", { fg = "#767676", ctermfg = 243 })
hi("markdownUrlTitle", { fg = "#5faf5f", ctermfg = 71 })
hi("markdownIdDeclaration", { fg = "#5fafd7", ctermfg = 74 })
hi("markdownId", { fg = "#87afaf", ctermfg = 109 })
hi("markdownLinkTextDelimiter", { fg = "#767676", ctermfg = 243 })

-- Lists
hi("markdownListMarker", { fg = "#d75f87", ctermfg = 168 })
hi("markdownOrderedListMarker", { fg = "#d75f87", ctermfg = 168 })

-- Blockquotes
hi("markdownBlockquote", { fg = "#767676", ctermfg = 243 })
hi("markdownBlockquoteDelimiter", { fg = "#585858", ctermfg = 240 })

-- Rules and breaks
hi("markdownRule", { fg = "#585858", ctermfg = 240 })
hi("markdownLineBreak", { fg = "#585858", ctermfg = 240 })

-- Other elements
hi("markdownFootnote", { fg = "#87afaf", ctermfg = 109 })
hi("markdownFootnoteDefinition", { fg = "#87afaf", ctermfg = 109 })
hi("markdownEscape", { fg = "#5f8787", ctermfg = 66 })

-- Treesitter Markdown highlights (for nvim-treesitter users)
-- Headers
hi("@markup.heading.1.markdown", { fg = "#5fafd7", bold = true, ctermfg = 74, cterm = { bold = true } })
hi("@markup.heading.2.markdown", { fg = "#5f87af", bold = true, ctermfg = 67, cterm = { bold = true } })
hi("@markup.heading.3.markdown", { fg = "#af87af", bold = true, ctermfg = 139, cterm = { bold = true } })
hi("@markup.heading.4.markdown", { fg = "#87afaf", ctermfg = 109 })
hi("@markup.heading.5.markdown", { fg = "#5f8787", ctermfg = 66 })
hi("@markup.heading.6.markdown", { fg = "#767676", ctermfg = 243 })

-- Emphasis
hi("@markup.strong.markdown_inline", { bold = true, cterm = { bold = true } })
hi("@markup.italic.markdown_inline", { italic = true, cterm = { italic = true } })

-- Code
hi("@markup.raw.markdown_inline", { fg = "#af875f", ctermfg = 137 })
hi("@markup.raw.block.markdown", { fg = "#af875f", ctermfg = 137 })

-- Links
hi("@markup.link.label.markdown_inline", { fg = "#5fafd7", ctermfg = 74 })
hi("@markup.link.url.markdown_inline", { fg = "#87afaf", underline = true, ctermfg = 109, cterm = { underline = true } })
hi("@markup.link.markdown_inline", { fg = "#5faf5f", ctermfg = 71 })

-- Lists
hi("@markup.list.markdown", { fg = "#d75f87", ctermfg = 168 })
hi("@markup.list.checked.markdown", { fg = "#5faf5f", ctermfg = 71 })
hi("@markup.list.unchecked.markdown", { fg = "#d75f87", ctermfg = 168 })

-- Quotes
hi("@markup.quote.markdown", { fg = "#767676", ctermfg = 243 })

-- Other
hi("@punctuation.delimiter.markdown_inline", { fg = "#767676", ctermfg = 243 })
hi("@punctuation.special.markdown", { fg = "#585858", ctermfg = 240 })
