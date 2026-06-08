local nvim_surround_wk = require("nvim-surround-wk")

describe("nvim-surround-wk", function()
	it("can be required", function()
		assert.is_not_nil(nvim_surround_wk)
	end)

	it("has default configuration", function()
		local default_config = nvim_surround_wk.get_default_config()
		assert.are.same({ some_option = true }, default_config)
	end)

	it("can be set up and torn down", function()
		nvim_surround_wk.setup({ some_option = false })
		nvim_surround_wk.teardown()
	end)
end)
