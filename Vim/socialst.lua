return {
  -- Codeium
  {
    "Exafunction/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      --require("codeium").setup {}
      vim.keymap.set("i", "<C-j>", function() return vim.fn["codeium#Accept"]() end, { expr = true, silent = true })
    end,
    lazy = false,
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
}
