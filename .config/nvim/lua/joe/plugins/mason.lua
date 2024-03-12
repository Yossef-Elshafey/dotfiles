return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
	config = function()
		local lsp = require("lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
					ensure_installed = {
							"pyright",
							"bashls",
							"tsserver",
							"lua_ls",
							"cssls",
							"tailwindcss",
							"pylsp",
							"html"
					}
				},
			},
		})

		require("mason-lspconfig").setup({
			ensure_installed = {},
			automatic_installation = false,
		})

		lsp.pyright.setup({
			capabilities = capabilities,
			on_attach = function(client)
				client.handlers["textDocument/publishDiagnostics"] = function() end
			end,
		})

		lsp.bashls.setup({
			capabilities = capabilities,
		})

		lsp.tsserver.setup({
			capabilities = capabilities,
		})

		lsp.lua_ls.setup({
			capabilities = capabilities,
		})

		lsp.cssls.setup({
			capabilities = capabilities,
		})

		lsp.tailwindcss.setup({
			capabilities = capabilities,
		})

		lsp.html.setup({
			filetypes = { "html", "django" },
			capabilities = capabilities,
		})

		lsp.pylsp.setup({
			capabilities = capabilities,
			on_attach = function(client)
				client.handlers["textDocument/publishDiagnostics"] = function() end
			end,
		})
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		-- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
		-- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
		-- vim.keymap.set('n', '<space>wl', function()
		--   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		-- end, opts)
		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<space>f", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
}
