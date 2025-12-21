-- hubbamax theme for bufferline
-- A dark theme based on habamax for akinsho/bufferline.nvim

local palette = require('hubbamax.palette')
local config = require('hubbamax.config')

-- Helper to get background color (transparent if enabled)
local function get_bg(color) return config.options.transparent_background and 'NONE' or color end

local hubbamax = {
  -- Fill (background)
  fill = {
    fg = palette.base.gray5.gui,
    bg = get_bg(palette.base.gray1.gui),
  },

  -- Inactive buffers
  background = {
    fg = palette.base.gray5.gui,
    bg = get_bg(palette.base.gray2.gui),
  },

  -- Visible but not active buffer
  buffer_visible = {
    fg = palette.base.gray6.gui,
    bg = get_bg(palette.base.gray2.gui),
  },

  -- Active/selected buffer
  buffer_selected = {
    fg = palette.base.fg.gui,
    bg = get_bg(palette.base.gray3.gui),
    bold = true,
    italic = false,
  },

  -- Separators
  separator = {
    fg = palette.base.gray1.gui,
    bg = get_bg(palette.base.gray2.gui),
  },
  separator_visible = {
    fg = palette.base.gray1.gui,
    bg = get_bg(palette.base.gray2.gui),
  },
  separator_selected = {
    fg = palette.base.gray1.gui,
    bg = get_bg(palette.base.gray3.gui),
  },

  -- Indicators
  indicator_selected = {
    fg = palette.accent.blue_bright.gui,
    bg = get_bg(palette.base.gray3.gui),
  },
  indicator_visible = {
    fg = palette.base.gray4.gui,
    bg = get_bg(palette.base.gray2.gui),
  },

  -- Modified buffers
  modified = {
    fg = palette.accent.orange.gui,
    bg = get_bg(palette.base.gray2.gui),
  },
  modified_visible = {
    fg = palette.accent.orange.gui,
    bg = get_bg(palette.base.gray2.gui),
  },
  modified_selected = {
    fg = palette.accent.orange.gui,
    bg = get_bg(palette.base.gray3.gui),
  },

  -- Duplicate buffers (same name)
  duplicate = {
    fg = palette.base.gray4.gui,
    bg = get_bg(palette.base.gray2.gui),
    italic = true,
  },
  duplicate_visible = {
    fg = palette.base.gray5.gui,
    bg = get_bg(palette.base.gray2.gui),
    italic = true,
  },
  duplicate_selected = {
    fg = palette.base.gray6.gui,
    bg = get_bg(palette.base.gray3.gui),
    italic = true,
  },

  -- Close button
  close_button = {
    fg = palette.base.gray5.gui,
    bg = get_bg(palette.base.gray2.gui),
  },
  close_button_visible = {
    fg = palette.base.gray6.gui,
    bg = get_bg(palette.base.gray2.gui),
  },
  close_button_selected = {
    fg = palette.accent.red.gui,
    bg = get_bg(palette.base.gray3.gui),
  },

  -- Tab
  tab = {
    fg = palette.base.gray5.gui,
    bg = get_bg(palette.base.gray2.gui),
  },
  tab_selected = {
    fg = palette.base.fg.gui,
    bg = get_bg(palette.base.gray3.gui),
    bold = true,
  },
  tab_separator = {
    fg = palette.base.gray1.gui,
    bg = get_bg(palette.base.gray2.gui),
  },
  tab_separator_selected = {
    fg = palette.base.gray1.gui,
    bg = get_bg(palette.base.gray3.gui),
  },
  tab_close = {
    fg = palette.accent.red.gui,
    bg = get_bg(palette.base.gray2.gui),
  },

  -- Diagnostics
  error = {
    fg = palette.accent.red.gui,
    bg = get_bg(palette.base.gray2.gui),
  },
  error_visible = {
    fg = palette.accent.red.gui,
    bg = get_bg(palette.base.gray2.gui),
  },
  error_selected = {
    fg = palette.accent.red.gui,
    bg = get_bg(palette.base.gray3.gui),
    bold = true,
  },
  error_diagnostic = {
    fg = palette.accent.red.gui,
    bg = get_bg(palette.base.gray2.gui),
  },
  error_diagnostic_visible = {
    fg = palette.accent.red.gui,
    bg = get_bg(palette.base.gray2.gui),
  },
  error_diagnostic_selected = {
    fg = palette.accent.red.gui,
    bg = get_bg(palette.base.gray3.gui),
    bold = true,
  },

  warning = {
    fg = palette.accent.orange.gui,
    bg = get_bg(palette.base.gray2.gui),
  },
  warning_visible = {
    fg = palette.accent.orange.gui,
    bg = get_bg(palette.base.gray2.gui),
  },
  warning_selected = {
    fg = palette.accent.orange.gui,
    bg = get_bg(palette.base.gray3.gui),
    bold = true,
  },
  warning_diagnostic = {
    fg = palette.accent.orange.gui,
    bg = get_bg(palette.base.gray2.gui),
  },
  warning_diagnostic_visible = {
    fg = palette.accent.orange.gui,
    bg = get_bg(palette.base.gray2.gui),
  },
  warning_diagnostic_selected = {
    fg = palette.accent.orange.gui,
    bg = get_bg(palette.base.gray3.gui),
    bold = true,
  },

  info = {
    fg = palette.accent.blue_bright.gui,
    bg = get_bg(palette.base.gray2.gui),
  },
  info_visible = {
    fg = palette.accent.blue_bright.gui,
    bg = get_bg(palette.base.gray2.gui),
  },
  info_selected = {
    fg = palette.accent.blue_bright.gui,
    bg = get_bg(palette.base.gray3.gui),
    bold = true,
  },
  info_diagnostic = {
    fg = palette.accent.blue_bright.gui,
    bg = get_bg(palette.base.gray2.gui),
  },
  info_diagnostic_visible = {
    fg = palette.accent.blue_bright.gui,
    bg = get_bg(palette.base.gray2.gui),
  },
  info_diagnostic_selected = {
    fg = palette.accent.blue_bright.gui,
    bg = get_bg(palette.base.gray3.gui),
    bold = true,
  },

  hint = {
    fg = palette.accent.cyan.gui,
    bg = get_bg(palette.base.gray2.gui),
  },
  hint_visible = {
    fg = palette.accent.cyan.gui,
    bg = get_bg(palette.base.gray2.gui),
  },
  hint_selected = {
    fg = palette.accent.cyan.gui,
    bg = get_bg(palette.base.gray3.gui),
    bold = true,
  },
  hint_diagnostic = {
    fg = palette.accent.cyan.gui,
    bg = get_bg(palette.base.gray2.gui),
  },
  hint_diagnostic_visible = {
    fg = palette.accent.cyan.gui,
    bg = get_bg(palette.base.gray2.gui),
  },
  hint_diagnostic_selected = {
    fg = palette.accent.cyan.gui,
    bg = get_bg(palette.base.gray3.gui),
    bold = true,
  },

  -- Pick (buffer picker)
  pick = {
    fg = palette.accent.pink.gui,
    bg = get_bg(palette.base.gray2.gui),
    bold = true,
  },
  pick_visible = {
    fg = palette.accent.pink.gui,
    bg = get_bg(palette.base.gray2.gui),
    bold = true,
  },
  pick_selected = {
    fg = palette.accent.pink.gui,
    bg = get_bg(palette.base.gray3.gui),
    bold = true,
  },

  -- Offset separators (for file trees like neo-tree)
  offset_separator = {
    fg = palette.base.gray5.gui,
    bg = get_bg(palette.base.gray1.gui),
  },

  -- Truncation marker
  trunc_marker = {
    fg = palette.base.gray5.gui,
    bg = get_bg(palette.base.gray1.gui),
  },
}

return hubbamax
