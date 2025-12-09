return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			suggestion = {
				enabled = true,
				auto_trigger = true, -- 入力中に自動で候補を出す
				keymap = {
					accept = "<Tab>", -- Tabキーで補完を採用 (VS Codeライク)
					next = "<M-]>", -- 次の候補 (Option + ])
					prev = "<M-[>", -- 前の候補 (Option + [)
				},
			},
			panel = { enabled = false }, -- パネル表示は無効化（重いため）
		})
	end,
}
