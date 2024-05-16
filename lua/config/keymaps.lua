-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set

--[[
<C-\><C-n> is the standard way to get to Normal mode in Vim, regardless of the
current mode. However, pressing control-backslash-control-n to get out of
Terminal mode can be awkward. To make the <Esc> key have the same effect in
Terminal mode, a snippet of Vim script can be put into the vimrc file.
This snippet is:
vim.keymap.set("t", "<C-x>", "<C-\\><C-n>")
-- Update: by default, <ESC><ESC> is mapped to "<C-\\><C-n>" and now <C-x> is mapped
-- to close a buffer. Therefore, this is not needed any more.
-- Pressing 'i' again will go back to the insert mode.
--]]

vim.keymap.set("n", "<C-x>", "<leader>bd", { desc = "Close the Current Buffer", remap = true })

local util = require("lazyvim.util")
vim.keymap.set("n", "<C-_>", function()
  util.terminal(nil, { border = "rounded", style = "" })
end, { desc = "Term with border" })

local actions = require("telescope.actions")
require("telescope").setup({
  defaults = {
    --[[
    prompt_position = "top",
    sorting_strategy = "ascending",
    -]]
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-d>"] = actions.close,
      },
    },
  },
})

vim.keymap.set("n", "<leader>/", require("telescope.builtin").grep_string, {})

local cmp = require("cmp")
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    -- My config
    ["<CR>"] = cmp.mapping.confirm({ select = false }), -- 'select = false' to only confirm explicitly selected item
    ["<S-CR>"] = cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Replace }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

    -- LazyVim defaults
    ["<C-j>"] = cmp.mapping.select_next_item({ select = false, behavior = cmp.SelectBehavior.Select }),
    ["<C-k>"] = cmp.mapping.select_prev_item({ select = false, behavior = cmp.SelectBehavior.Select }),
  }),
})

