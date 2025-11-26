-- return {
-- 	"stevearc/conform.nvim",
-- 	event = { "BufReadPre", "BufNewFile" },
-- 	config = function()
-- 		local conform = require("conform")
-- 		conform.setup({
-- 			formatters_by_ft = {
-- 				javascript = { "prettier" },
-- 				typescript = { "prettier" },
-- 				javascriptreact = { "prettier" },
-- 				typescriptreact = { "prettier" },
-- 				css = { "prettier" },
-- 				html = { "prettier" },
-- 				json = { "prettier" },
-- 				yaml = { "prettier" },
-- 				markdown = { "prettier" },
-- 				graphql = { "prettier" },
-- 				lua = { "stylua" },
-- 				python = { "black" },
-- 			},
-- 			format_on_save = {
-- 				lsp_format = "fallback",
-- 				timeout_ms = 500,
-- 			},
-- 		})
-- 	end,
-- }
--
return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				lua = { "stylua" },
				python = { "black" },
			},
			format_on_save = function(bufnr)
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return nil -- Skip formatting when disabled
				end
				return { timeout_ms = 500, lsp_format = "fallback" }
			end,

			vim.api.nvim_create_user_command("FormatDisable", function(args)
				if args.bang then
					-- FormatDisable! will disable formatting just for this buffer
					vim.b.disable_autoformat = true
				else
					vim.g.disable_autoformat = true
				end
			end, { bang = true }),

			vim.api.nvim_create_user_command("FormatEnable", function()
				vim.b.disable_autoformat = false
				vim.g.disable_autoformat = false
			end, {}),
		})
	end,
}
