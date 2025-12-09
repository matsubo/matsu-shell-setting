return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			-- サイズ設定（directionがhorizontal/verticalの時のみ有効）
			size = 20,

			-- ターミナルを開閉するキーバインド
			-- ここでは標準的な Ctrl + \ を設定していますが、変更可能です
			open_mapping = [[<C-\>]],

			-- 見た目の設定
			hide_numbers = true, -- 行番号を隠す
			shade_filetypes = {},
			shade_terminals = true,
			shading_factor = 2,
			start_in_insert = true, -- 開いた時にインサートモードにする
			insert_mappings = true, -- ターミナル内でEscなどで抜けられるようにする
			persist_size = true,

			-- フローティング（浮動）表示の設定
			direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float'
			close_on_exit = true, -- プロセス終了時にウィンドウを閉じる

			-- フローティングウィンドウのデザイン
			float_opts = {
				border = "curved", -- 枠線を角丸にする ('single', 'double', 'shadow' 等も可)
				winblend = 0, -- 透明度 (0-100)
			},
		})

		-- 【CTO向け特別設定】Lazygitを一発で呼び出す設定
		-- ターミナルから毎回 lazygit と打つのは非効率なので、専用コマンドを作ります
		local Terminal = require("toggleterm.terminal").Terminal
		local lazygit = Terminal:new({
			cmd = "lazygit",
			hidden = true,
			direction = "float",
			float_opts = {
				border = "double",
			},
		})

		function _lazygit_toggle()
			lazygit:toggle()
		end

		-- <leader>gg でLazygitを起動
		vim.keymap.set(
			"n",
			"<leader>gg",
			"<cmd>lua _lazygit_toggle()<CR>",
			{ noremap = true, silent = true, desc = "Lazygit" }
		)
	end,
}
