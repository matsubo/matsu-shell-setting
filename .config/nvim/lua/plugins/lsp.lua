return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "ts_ls", "lua_ls", "ruby_lsp", "astro" },
    })

    vim.lsp.config('*', {
      cmd_env = { PATH = vim.env.PATH },
    })

    vim.lsp.enable('ts_ls')
    vim.lsp.enable('lua_ls')
    vim.lsp.enable('astro')
    vim.lsp.enable('ruby_lsp')
  end,
}
