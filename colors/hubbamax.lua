-- hubbamax colorscheme entry point
-- This file is loaded when running :colorscheme hubbamax

-- Clear the module cache to allow reloading
package.loaded["hubbamax"] = nil
package.loaded["hubbamax.palette"] = nil

local ok, err = pcall(require, "hubbamax")
if not ok then
	vim.notify("Error loading hubbamax colorscheme: " .. tostring(err), vim.log.levels.ERROR)
end
