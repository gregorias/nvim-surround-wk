local nvim_surround_wk = require("nvim-surround-wk")

describe("nvim-surround-wk", function()
	it("can be set up and torn down", function()
		require("nvim-surround").setup({})
		nvim_surround_wk.setup()
		nvim_surround_wk.teardown()
	end)

	describe("get_hints", function()
		it("returns correct hints including formatted aliases", function()
			require("nvim-surround").setup({})
			local hints = nvim_surround_wk.get_hints(
				require("nvim-surround.config").get_opts().surrounds,
				require("nvim-surround.config").get_opts().aliases
			)
			assert.are.same({
				['"'] = '"…"',
				["'"] = "'…'",
				["("] = "( … )",
				[")"] = "(…)",
				["<"] = "< … >",
				[">"] = "<…>",
				["["] = "[ … ]",
				["]"] = "[…]",
				["`"] = "`…`",
				["{"] = "{ … }",
				["}"] = "{…}",
				B = "}",
				T = "<tag>…</tag>",
				a = ">",
				b = ")",
				f = "foo(…)",
				i = "?…?",
				q = "\",',`",
				r = "]",
				s = "},],),>,\",',`",
				t = "<tag>…</tag>",
			}, hints)
		end)
	end)
end)
