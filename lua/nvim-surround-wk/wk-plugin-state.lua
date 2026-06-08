---Global state used by the WK plugin.

local M = {
	-- WK requires keymaps.
	-- We use "⌨" here to make sure we never collide with actual keymaps.
	plugin_keys = "⌨S",
	selected_key = nil,
	expand_hints = {},
}

return M
