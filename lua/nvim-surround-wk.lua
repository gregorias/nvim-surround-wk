local M = {}

---Gets a character from the user with the provided hints.
---
---@param hints table<string, string> A table from chars to their labels.
---@param mode "n"|"x"
---@return string? selected_key
local pick = function(hints, mode)
	require("nvim-surround-wk.wk-plugin-state").selected_key = nil
	require("nvim-surround-wk.wk-plugin-state").expand_hints = hints
	require("which-key").show({
		keys = require("nvim-surround-wk.wk-plugin-state").plugin_keys,
		mode = mode,
	})
	return require("nvim-surround-wk.wk-plugin-state").selected_key
end

local original_ns_get_char = function() end

---Creates a table of available hints given surrounds and aliases.
---
---@param surrounds table<string, table>
---@param aliases table<string, string|string[]>
---@return table<string, string> hints
---@nodiscard
M.get_hints = function(surrounds, aliases)
	local hints = {}
	for char, surround in pairs(surrounds) do
		-- Throw away "invalid_key_behavior" if present.
		if string.len(char) == 1 then
			hints[char] = surround.label or char
		end
	end
	for char, alias in pairs(aliases) do
		hints[char] = type(alias) == "table" and table.concat(alias, ",") or alias
	end
	return hints
end

---Gets a surround character input from the user.
---
---This is meant to be monkey-patched for nvim-surround.input.get_char.
---
---@return string|nil @The input character, or nil if an escape character is pressed.
---@nodiscard
local get_char = function()
	local config = require("nvim-surround.config")
	return pick(M.get_hints(config.get_opts().surrounds, config.get_opts().aliases), "n")
end

--- Sets up the plugin.
M.setup = function()
	local wk = require("which-key")
	local ns_wk_plugin = require("nvim-surround-wk.wk-plugin")
	wk.add({
		{
			[1] = require("nvim-surround-wk.wk-plugin-state").plugin_keys,
			plugin = ns_wk_plugin.name,
			icon = { icon = "⌨", color = "blue" },
			desc = "Nvim-surround",
			mode = { "n", "x" },
		},
	})
	require("which-key.plugins").plugins[ns_wk_plugin.name] = ns_wk_plugin
	require("which-key.plugins")._setup(ns_wk_plugin, {})
	original_ns_get_char = require("nvim-surround.input").get_char
	require("nvim-surround.input").get_char = get_char
end

---Tears down the plugin.
M.teardown = function()
	local wk = require("which-key")
	local ns_wk_plugin = require("nvim-surround-wk.wk-plugin")
	require("nvim-surround.input").get_char = original_ns_get_char
	require("which-key.plugins").plugins[ns_wk_plugin.name] = nil
	wk.add({
		{
			[1] = require("nvim-surround-wk.wk-plugin-state").plugin_keys,
			[2] = "which-key-ignore",
			mode = { "n", "x" },
		},
	})
end

return M
