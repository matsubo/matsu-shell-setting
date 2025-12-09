-- ~/.config/nvim/lua/config/options.lua
local opt = vim.opt

opt.number = true          -- 行番号表示
opt.relativenumber = true  -- 相対行番号（移動に便利）
opt.tabstop = 2            -- インデント幅（Web開発向け）
opt.shiftwidth = 2
opt.expandtab = true       -- タブをスペースに変換
opt.smartindent = true
opt.wrap = false           -- 折り返し無効
opt.ignorecase = true      -- 検索時に大文字小文字を無視
opt.smartcase = true       -- 大文字が含まれる場合は区別
opt.termguicolors = true   -- True Color対応
opt.clipboard = "unnamedplus" -- OSのクリップボードと共有
opt.cursorline = true      -- 現在行をハイライト

