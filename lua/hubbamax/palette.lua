-- hubbamax color palette
-- All color definitions for the colorscheme

local M = {}

-- Terminal ANSI colors (0-15)
M.terminal = {
	"#1c1c1c", -- 0:  black
	"#af5f5f", -- 1:  red
	"#5faf5f", -- 2:  green
	"#af875f", -- 3:  yellow
	"#5f87af", -- 4:  blue
	"#af87af", -- 5:  magenta
	"#5f8787", -- 6:  cyan
	"#9e9e9e", -- 7:  white
	"#767676", -- 8:  bright black
	"#d75f87", -- 9:  bright red
	"#87d787", -- 10: bright green
	"#d7af87", -- 11: bright yellow
	"#5fafd7", -- 12: bright blue
	"#d787d7", -- 13: bright magenta
	"#87afaf", -- 14: bright cyan
	"#bcbcbc", -- 15: bright white
}

-- Base colors
M.base = {
	bg = { gui = "#1c1c1c", cterm = 234 },
	fg = { gui = "#bcbcbc", cterm = 250 },

	-- Blacks and grays (darkest to lightest)
	black = { gui = "#000000", cterm = 16 },
	gray0 = { gui = "#1c1c1c", cterm = 234 },
	gray1 = { gui = "#262626", cterm = 235 },
	gray2 = { gui = "#303030", cterm = 236 },
	gray3 = { gui = "#3a3a3a", cterm = 237 },
	gray4 = { gui = "#585858", cterm = 240 },
	gray5 = { gui = "#767676", cterm = 243 },
	gray6 = { gui = "#9e9e9e", cterm = 247 },
	gray7 = { gui = "#bcbcbc", cterm = 250 },
	gray8 = { gui = "#dadada", cterm = 253 },

	-- Special
	bright_green = { gui = "#5fff00", cterm = 82 },
}

-- Accent colors (organized by hue)
M.accent = {
	-- Reds
	red = { gui = "#af5f5f", cterm = 131 },
	red_bright = { gui = "#d75f5f", cterm = 167 },
	pink = { gui = "#d75f87", cterm = 168 },
	magenta_bright = { gui = "#ff00af", cterm = 199 },

	-- Greens
	green = { gui = "#5faf5f", cterm = 71 },
	green_bright = { gui = "#5fd75f", cterm = 77 },
	green_light = { gui = "#87d787", cterm = 114 },

	-- Yellows/Oranges
	yellow = { gui = "#af875f", cterm = 137 },
	yellow_bright = { gui = "#d7af87", cterm = 180 },
	orange = { gui = "#ffaf5f", cterm = 215 },

	-- Blues
	blue = { gui = "#5f87af", cterm = 67 },
	blue_bright = { gui = "#5fafd7", cterm = 74 },

	-- Cyans
	cyan = { gui = "#5f8787", cterm = 66 },
	cyan_light = { gui = "#87afaf", cterm = 109 },

	-- Purples/Magentas
	purple = { gui = "#af87af", cterm = 139 },
	magenta = { gui = "#d787d7", cterm = 176 },
}

return M
