-- hubbamax theme for lualine
-- A dark theme based on habamax, matching the original greyish statusline

local palette = require("hubbamax.palette")
local config = require("hubbamax.config")

local hubbamax = {}

-- Original habamax uses grey statusline: dark text on grey background
-- StatusLine: fg=#1c1c1c bg=#9e9e9e (dark on grey)
-- StatusLineNC: fg=#1c1c1c bg=#767676 (dark on darker grey)

-- Helper to get background color (transparent if enabled)
local function get_bg(color)
	return config.options.transparent_background and "NONE" or color
end

-- Helper to get brighter foreground for transparent backgrounds
local function get_fg(normal_fg, bright_fg)
	return config.options.transparent_background and bright_fg or normal_fg
end

-- Normal mode - grey (matching original habamax)
hubbamax.normal = {
	a = { fg = get_fg(palette.base.bg.gui, palette.base.gray6.gui), bg = get_bg(palette.base.gray6.gui), gui = "bold" },
	b = { fg = get_fg(palette.base.gray8.gui, palette.base.fg.gui), bg = get_bg(palette.base.gray3.gui) },
	c = { fg = get_fg(palette.base.gray6.gui, palette.base.gray7.gui), bg = get_bg(palette.base.gray2.gui) },
}

-- Insert mode - subtle green tint
hubbamax.insert = {
	a = { fg = get_fg(palette.base.bg.gui, palette.accent.green.gui), bg = get_bg(palette.accent.green.gui), gui = "bold" },
	b = { fg = get_fg(palette.base.gray8.gui, palette.base.fg.gui), bg = get_bg(palette.base.gray3.gui) },
	c = { fg = get_fg(palette.base.gray6.gui, palette.base.gray7.gui), bg = get_bg(palette.base.gray2.gui) },
}

-- Visual mode - subtle purple tint
hubbamax.visual = {
	a = { fg = get_fg(palette.base.bg.gui, palette.accent.purple.gui), bg = get_bg(palette.accent.purple.gui), gui = "bold" },
	b = { fg = get_fg(palette.base.gray8.gui, palette.base.fg.gui), bg = get_bg(palette.base.gray3.gui) },
	c = { fg = get_fg(palette.base.gray6.gui, palette.base.gray7.gui), bg = get_bg(palette.base.gray2.gui) },
}

-- Replace mode - subtle red tint
hubbamax.replace = {
	a = { fg = get_fg(palette.base.bg.gui, palette.accent.red.gui), bg = get_bg(palette.accent.red.gui), gui = "bold" },
	b = { fg = get_fg(palette.base.gray8.gui, palette.base.fg.gui), bg = get_bg(palette.base.gray3.gui) },
	c = { fg = get_fg(palette.base.gray6.gui, palette.base.gray7.gui), bg = get_bg(palette.base.gray2.gui) },
}

-- Command mode - subtle yellow tint
hubbamax.command = {
	a = { fg = get_fg(palette.base.bg.gui, palette.accent.yellow_bright.gui), bg = get_bg(palette.accent.yellow_bright.gui), gui = "bold" },
	b = { fg = get_fg(palette.base.gray8.gui, palette.base.fg.gui), bg = get_bg(palette.base.gray3.gui) },
	c = { fg = get_fg(palette.base.gray6.gui, palette.base.gray7.gui), bg = get_bg(palette.base.gray2.gui) },
}

-- Terminal mode - subtle cyan tint
hubbamax.terminal = {
	a = { fg = get_fg(palette.base.bg.gui, palette.accent.cyan.gui), bg = get_bg(palette.accent.cyan.gui), gui = "bold" },
	b = { fg = get_fg(palette.base.gray8.gui, palette.base.fg.gui), bg = get_bg(palette.base.gray3.gui) },
	c = { fg = get_fg(palette.base.gray6.gui, palette.base.gray7.gui), bg = get_bg(palette.base.gray2.gui) },
}

-- Inactive windows - matching StatusLineNC colors
hubbamax.inactive = {
	a = { fg = get_fg(palette.base.bg.gui, palette.base.gray5.gui), bg = get_bg(palette.base.gray5.gui) },
	b = { fg = get_fg(palette.base.gray6.gui, palette.base.gray7.gui), bg = get_bg(palette.base.gray2.gui) },
	c = { fg = get_fg(palette.base.gray5.gui, palette.base.gray6.gui), bg = get_bg(palette.base.gray1.gui) },
}

return hubbamax
