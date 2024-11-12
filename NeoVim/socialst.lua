return {
  ---- Codeium
  --{
  --  'Exafunction/codeium.vim',
  --  event = 'BufEnter',
  --  lazy = false,
  --  config = function()
  --    vim.g.codeium_disable_bindings = 1
  --    vim.keymap.set('i', '<C-j>', function() return vim.fn['codeium#Accept']() end, { expr = true })
  --  end
  --},

  -- Copilot
  {
    "github/copilot.vim",
    event = "BufEnter",
    autoStart = true,
    config = function()
      vim.keymap.set("i", "<C-j>", function()
        return vim.fn["copilot#Accept"]("<CR>")
      end, { expr = true, silent = true, noremap = true, replace_keycodes = false })
    end,
  },

  -- Rustacean
  {
    "mrcjkb/rustaceanvim",
    version = "^4", -- Recommended
    lazy = false, -- This plugin is already lazy
  },

  ---- Crates.nvim
  --{
  --    'saecki/crates.nvim',
  --    tag = 'stable',
  --    config = function()
  --        require('crates').setup()
  --    end,
  --},

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
    end,
  },

  -- Typst
  {
    "kaarmu/typst.vim",
    ft = "typst",
    lazy = false,
  },

  -- Local config
  {
    "klen/nvim-config-local",
    config = function()
      require("config-local").setup({
        -- Default options (optional)

        -- Config file patterns to load (lua supported)
        config_files = { ".nvim.lua", ".nvimrc", ".exrc" },

        -- Where the plugin keeps files data
        hashfile = vim.fn.stdpath("data") .. "/config-local",

        autocommands_create = true, -- Create autocommands (VimEnter, DirectoryChanged)
        commands_create = true, -- Create commands (ConfigLocalSource, ConfigLocalEdit, ConfigLocalTrust, ConfigLocalIgnore)
        silent = false, -- Disable plugin messages (Config loaded/ignored)
        lookup_parents = false, -- Lookup config files in parent directories
      })
    end,
  },
}
