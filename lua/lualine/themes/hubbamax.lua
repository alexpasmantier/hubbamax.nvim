-- hubbamax theme for lualine
-- A dark theme based on habamax, easier on the eyes

local palette = require("hubbamax.palette")

-- Helper to create lualine color specs
local function mode_colors(fg, bg, gui)
	return {
		a = { fg = fg, bg = bg, gui = gui or "bold" },
		b = { fg = palette.base.fg.gui, bg = palette.base.gray2.gui },
		c = { fg = palette.base.gray6.gui, bg = palette.base.gray0.gui },
	}
end

local hubbamax = {}

-- Normal mode - blue
hubbamax.normal = mode_colors(palette.base.bg.gui, palette.accent.blue.gui)

-- Insert mode - green
hubbamax.insert = mode_colors(palette.base.bg.gui, palette.accent.green.gui)

-- Visual mode - purple
hubbamax.visual = mode_colors(palette.base.bg.gui, palette.accent.purple.gui)

-- Replace mode - red
hubbamax.replace = mode_colors(palette.base.bg.gui, palette.accent.red.gui)

-- Command mode - yellow
hubbamax.command = mode_colors(palette.base.bg.gui, palette.accent.yellow_bright.gui)

-- Terminal mode - cyan
hubbamax.terminal = mode_colors(palette.base.bg.gui, palette.accent.cyan.gui)

-- Inactive windows
hubbamax.inactive = {
	a = { fg = palette.base.gray5.gui, bg = palette.base.gray2.gui },
	b = { fg = palette.base.gray5.gui, bg = palette.base.gray1.gui },
	c = { fg = palette.base.gray4.gui, bg = palette.base.gray0.gui },
}

return hubbamax
