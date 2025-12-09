-- hubbamax colorscheme entry point
-- This file is loaded when running :colorscheme hubbamax

-- Clear the module cache to allow reloading
-- NOTE: Don't clear hubbamax.config so user settings persist!
package.loaded["hubbamax"] = nil
package.loaded["hubbamax.palette"] = nil
package.loaded["lualine.themes.hubbamax"] = nil
package.loaded["bufferline.themes.hubbamax"] = nil

local ok, err = pcall(require, "hubbamax")
if not ok then
	vim.notify("Error loading hubbamax colorscheme: " .. tostring(err), vim.log.levels.ERROR)
end
