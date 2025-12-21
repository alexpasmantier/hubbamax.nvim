-- hubbamax configuration module
local M = {}

-- Default configuration
M.defaults = {
  transparent_background = false,
}

-- Current configuration (starts with defaults)
M.options = vim.deepcopy(M.defaults)

-- Setup function to merge user config
function M.setup(opts) M.options = vim.tbl_deep_extend('force', M.defaults, opts or {}) end

return M
