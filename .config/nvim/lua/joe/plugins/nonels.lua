return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		-- making the pylint respect the venv becuase he was mot******
		local venv_path =
		'import sys; sys.path.append("/home/yossef/life/pylint-venv"); import pylint_venv; pylint_venv.inithook(force_venv_activation=True, quiet=True)'

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.diagnostics.pylint.with({
					extra_args = { "--init-hook", venv_path }
				}),
				-- null_ls.builtins.diagnostics.eslint_d,
				null_ls.builtins.diagnostics.djlint, --htmldjango
			},
		})
	end,
}
