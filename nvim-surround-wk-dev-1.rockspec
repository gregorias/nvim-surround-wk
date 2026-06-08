rockspec_format = "3.0"
package = "nvim-surround-wk"
version = "dev-1"

source = {
	url = "git+https://github.com/gregorias/nvim-surround-wk",
}

description = {
	summary = "Which Key support for nvim-surround.",
	homepage = "https://github.com/gregorias/nvim-surround-wk",
	license = "GPL-3.0",
}

dependencies = {
	"lua >= 5.1",
}

test_dependencies = {
	"busted",
	"luacov",
}

build = {
	type = "builtin",
	modules = {
		["nvim-surround-wk"] = "lua/nvim-surround-wk.lua",
	},
}
