local lsp_to_have = { "lua_ls", "clangd", "cssls", "html", "jsonls", "tsserver", "pylsp", "tailwindcss" }
return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = lsp_to_have,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			for _, lsp in ipairs(lsp_to_have) do
        lspconfig[lsp].setup({capabilities = capabilities})
      end			vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap(
				"n",
				"gd",
				"<cmd>lua vim.lsp.buf.definition()<CR>",
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>ca",
				"<cmd>lua vim.lsp.buf.code_action()<CR>",
				{ noremap = true, silent = true }
			)
		end,
	},
}
