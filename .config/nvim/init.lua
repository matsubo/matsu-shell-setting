-- ~/.config/nvim/init.lua

-- Leaderキーをスペースに設定（モダンなVimの基本）
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- lazy.nvim (プラグインマネージャー) のブートストラップ
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 基本設定とプラグインの読み込み
require("config.options")
require("config.keymaps")
require("config.lazy")
