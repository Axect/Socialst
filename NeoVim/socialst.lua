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
  { "LudoPinelli/comment-box.nvim" },

  -- Typst
  {
    {
      "kaarmu/typst.vim",
      ft = "typst",
      lazy = false,
    },
  },
}
