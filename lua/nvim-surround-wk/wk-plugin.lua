---A WK plugin for showing available surrounds with keys.
local expand = function()
	---@type wk.Plugin.item[]
	local items = {}

	for key, label in pairs(require("nvim-surround-wk.wk-plugin-state").expand_hints) do
		table.insert(items, {
			key = key,
			desc = label,
			value = "",
			action = function()
				require("nvim-surround-wk.wk-plugin-state").selected_key = key
			end,
		})
	end

	table.sort(items, function(a, b)
		return a.key < b.key
	end)

	return items
end

---@type wk.Plugin
local M = {
	name = "nvim-surround",
	expand = expand,
	setup = function() end,
}

return M
