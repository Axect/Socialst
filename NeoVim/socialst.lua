return {
  -- Codeium
  {
    'Exafunction/codeium.vim',
    event = 'BufEnter',
    lazy = false,
    config = function()
      vim.keymap.set('i', '<C-j>', function() return vim.fn['codeium#Accept']() end, { expr = true })
    end
  },

  -- Rustacean
  {
    "mrcjkb/rustaceanvim",
    version = "^4", -- Recommended
    lazy = false, -- This plugin is already lazy
  },

  -- Wakatime
  { "wakatime/vim-wakatime", lazy = false },

  -- Comment box
  { 
    "LudoPinelli/comment-box.nvim",
    config = function()
      local keymap = vim.keymap.set
      local opts = { noremap = true, silent = true }
      local cb = require("comment-box")

      keymap({ "n", "v" }, "<leader>cb", "<Cmd>CBllbox 20<CR>", opts)
      keymap({ "n", "v" }, "<leader>cl", "<Cmd>CBlline<CR>", opts)
      keymap({ "n", "v" }, "<leader>cd", "<Cmd>CBd<CR>", opts)
    end
  },

  -- Typst
  {
    {
      "kaarmu/typst.vim",
      ft = "typst",
      lazy = false,
    },
  },
}