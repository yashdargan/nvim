local lsp_to_have = { "lua_ls", "clangd","cssls","eslint","html","jsonls","tsserver","pylsp","tailwindcss"}

return {
  {"williamboman/mason.nvim",
    config = function()
  require("mason").setup()
  end
},
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
      ensure_installed = lsp_to_have
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      for _,lsp in ipairs(lsp_to_have) do
        lspconfig[lsp].setup({})
      end
      vim.keymap.set('n','K',vim.lsp.buf.hover,{})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition,{})
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
    end
  }
}
