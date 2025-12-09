return {
  -- 1. ファイルエクスプローラー (Neo-tree)
  -- <Leader>e でサイドバーが開閉します
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- アイコン表示に必要
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Explorer Toggle" },
    },
    opts = {
      filesystem = {
        filtered_items = {
          visible = true, -- ドットファイル(.configなど)を表示
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
    },
  },

  -- 2. ステータスライン (Lualine)
  -- 画面下部をカッコよくします
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "tokyonight", -- カラーテーマに合わせる
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  -- 3. キーバインドヘルパー (Which-key)
  -- スペースキーなどを押した時に「次に何が押せるか」をポップアップ表示
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {},
  },
  
  -- 4. Git連携 (Gitsigns)
  -- 行番号の左に追加・変更の予兆を表示
  {
    "lewis6991/gitsigns.nvim",
    opts = {},
  }
}
