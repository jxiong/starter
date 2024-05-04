-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.relativenumber = false
vim.opt.mouse = ""

--[[
<C-\><C-n> is the standard way to get to Normal mode in Vim, regardless of the
current mode. However, pressing control-backslash-control-n to get out of
Terminal mode can be awkward. To make the <Esc> key have the same effect in
Terminal mode, a snippet of Vim script can be put into the vimrc file.
This snippet is:
--]]
vim.keymap.set("t", "<C-b>", [[<C-\><C-n>]])
-- Pressing 'i' again will go back to the insert mode.
