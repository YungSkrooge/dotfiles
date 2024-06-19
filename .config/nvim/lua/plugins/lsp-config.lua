return {
  {"williamboman/mason.nvim",
  config = function()
    require("mason").setup()
  end},
  {"williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
      ensure_installed = {"lua_ls", "bashls", "clangd", "cmake", "dockerls",
        "ltex", "autotools_ls", "marksman", "pylyzer", "rust_analyzer",
        "taplo"}
      })
    end},
  {"neovim/nvim-lspconfig",
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({capabilities = capabilities})
      lspconfig.autotools_ls.setup{capabilities = capabilities}
      lspconfig.bashls.setup{capabilities = capabilities}
      lspconfig.clangd.setup{capabilities = capabilities}
      lspconfig.cmake.setup{capabilities = capabilities}
      lspconfig.dockerls.setup{capabilities = capabilities}
      lspconfig.ltex.setup{capabilities = capabilities}
      lspconfig.marksman.setup{capabilities = capabilities}
      lspconfig.pylyzer.setup{capabilities = capabilities}
      lspconfig.taplo.setup{capabilities = capabilities}

      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set({'n', 'v'}, '<Leader>ca', vim.lsp.buf.code_action, {})
    end}
}

