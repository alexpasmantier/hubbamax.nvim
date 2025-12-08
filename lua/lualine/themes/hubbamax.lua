-- hubbamax theme for lualine
-- A dark theme based on habamax, matching the original greyish statusline

local palette = require("hubbamax.palette")

local hubbamax = {}

-- Original habamax uses grey statusline: dark text on grey background
-- StatusLine: fg=#1c1c1c bg=#9e9e9e (dark on grey)
-- StatusLineNC: fg=#1c1c1c bg=#767676 (dark on darker grey)

-- Normal mode - grey (matching original habamax)
hubbamax.normal = {
	a = { fg = palette.base.bg.gui, bg = palette.base.gray6.gui, gui = "bold" },
	b = { fg = palette.base.gray8.gui, bg = palette.base.gray3.gui },
	c = { fg = palette.base.gray6.gui, bg = palette.base.gray2.gui },
}

-- Insert mode - subtle green tint
hubbamax.insert = {
	a = { fg = palette.base.bg.gui, bg = palette.accent.green.gui, gui = "bold" },
	b = { fg = palette.base.gray8.gui, bg = palette.base.gray3.gui },
	c = { fg = palette.base.gray6.gui, bg = palette.base.gray2.gui },
}

-- Visual mode - subtle purple tint
hubbamax.visual = {
	a = { fg = palette.base.bg.gui, bg = palette.accent.purple.gui, gui = "bold" },
	b = { fg = palette.base.gray8.gui, bg = palette.base.gray3.gui },
	c = { fg = palette.base.gray6.gui, bg = palette.base.gray2.gui },
}

-- Replace mode - subtle red tint
hubbamax.replace = {
	a = { fg = palette.base.bg.gui, bg = palette.accent.red.gui, gui = "bold" },
	b = { fg = palette.base.gray8.gui, bg = palette.base.gray3.gui },
	c = { fg = palette.base.gray6.gui, bg = palette.base.gray2.gui },
}

-- Command mode - subtle yellow tint
hubbamax.command = {
	a = { fg = palette.base.bg.gui, bg = palette.accent.yellow_bright.gui, gui = "bold" },
	b = { fg = palette.base.gray8.gui, bg = palette.base.gray3.gui },
	c = { fg = palette.base.gray6.gui, bg = palette.base.gray2.gui },
}

-- Terminal mode - subtle cyan tint
hubbamax.terminal = {
	a = { fg = palette.base.bg.gui, bg = palette.accent.cyan.gui, gui = "bold" },
	b = { fg = palette.base.gray8.gui, bg = palette.base.gray3.gui },
	c = { fg = palette.base.gray6.gui, bg = palette.base.gray2.gui },
}

-- Inactive windows - matching StatusLineNC colors
hubbamax.inactive = {
	a = { fg = palette.base.bg.gui, bg = palette.base.gray5.gui },
	b = { fg = palette.base.gray6.gui, bg = palette.base.gray2.gui },
	c = { fg = palette.base.gray5.gui, bg = palette.base.gray1.gui },
}

return hubbamax
