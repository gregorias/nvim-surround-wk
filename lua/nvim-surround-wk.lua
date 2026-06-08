local M = {}

---@class NvimSurroundWkConfigUser
---@field some_option? boolean

---@class NvimSurroundWkConfig
---@field some_option boolean

---@return NvimSurroundWkConfig
M.get_default_config = function()
	return {
		some_option = true,
	}
end

---@param user_config NvimSurroundWkConfigUser
---@return NvimSurroundWkConfig
M.get_effective_config = function(user_config)
	local effective_config = M.get_default_config()

	if user_config.some_option ~= nil then
		effective_config.some_option = user_config.some_option
	end
	return effective_config
end

local effective_config = nil

---Returns the current effective configuration.
---@return NvimSurroundWkConfig?
M.get_config = function()
	return effective_config
end

--- Sets up the plugin.
---
---@param config? NvimSurroundWkConfigUser
M.setup = function(config)
	effective_config = M.get_effective_config(config or {})
	-- Barebones template setup logic
end

---Tears down the plugin.
M.teardown = function()
	effective_config = nil
end

return M
