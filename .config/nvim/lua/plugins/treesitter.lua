return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "lua", "vim", "vimdoc", "javascript", "typescript", "tsx", "ruby", "go", "json", "astro" },
      highlight = { enable = true },
    })
  end,
}
