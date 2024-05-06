return {
  { "nvim-treesitter/nvim-treesitter", enabled = false },
  { "windwp/nvim-ts-autotag", enabled = false },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "elflord",
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        border = "rounded",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Ensure mason installs the server
        clangd = {
          root_dir = function(fname)
            require("lspconfig.util").find_git_ancestor(fname)
          end,
          capabilities = {
            offsetEncoding = { "utf-16" },
          },
          cmd = {
            "clangd",
            "--background-index",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm",
          },
          init_options = {
            usePlaceholders = true,
            completeUnimported = true,
            clangdFileStatus = true,
          },
          filetypes = { "c", "h", "cpp", "hpp", "cc", "hh" },
        },
      },
    },
  },
}
