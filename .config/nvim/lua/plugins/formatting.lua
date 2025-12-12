return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" }, -- ファイルを開いたときに読み込む
  config = function()
    require("conform").setup({
      -- 言語ごとのフォーマッター定義
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        astro = { "prettier" }, -- Astroも対応
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        lua = { "stylua" }, -- Luaの整形
        ruby = { "rubocop" }, -- Rubyの整形 (必要に応じて)
      },
      -- 保存時の自動実行設定（無効化）
      format_on_save = false,
    })
  end,
}
