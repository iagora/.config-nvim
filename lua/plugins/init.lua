-- ~/.config/nvim/lua/plugins/init.lua
return {
  ---------------------------------------------------------------------------
  -- Telescope
  ---------------------------------------------------------------------------
  {
    "nvim-telescope/telescope.nvim",
    version = "0.1.1",                 -- packer tag = '0.1.1'
    cmd = "Telescope",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  ---------------------------------------------------------------------------
  -- Colorscheme (rose-pine)
  ---------------------------------------------------------------------------
  {
    "rose-pine/neovim",
    name = "rose-pine",                -- packer `as = 'rose-pine'`
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("rose-pine")
    end,
  },

  ---------------------------------------------------------------------------
  -- Treesitter
  ---------------------------------------------------------------------------
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",               -- packer run = ':TSUpdate'
    event = { "BufReadPost", "BufNewFile" },
    opts = { highlight = { enable = true } },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  ---------------------------------------------------------------------------
  -- Undo tree
  ---------------------------------------------------------------------------
  {
    "mbbill/undotree",
    cmd = { "UndotreeToggle", "UndotreeFocus" },
  },

  ---------------------------------------------------------------------------
  -- Git
  ---------------------------------------------------------------------------
  { "tpope/vim-fugitive", cmd = { "Git", "Gdiffsplit", "Gread", "Gwrite" } },

  ---------------------------------------------------------------------------
  -- which-key
  ---------------------------------------------------------------------------
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup({})
    end,
  },

  ---------------------------------------------------------------------------
  -- LSP Zero v2 + deps
  ---------------------------------------------------------------------------
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    lazy = true,
    dependencies = {
      -- LSP
      { "neovim/nvim-lspconfig" },     -- required
      {
        "mason-org/mason.nvim",     -- optional in packer list
        build = ":MasonUpdate",        -- packer run = MasonUpdate
        config = true,
      },
      { "mason-org/mason-lspconfig.nvim" }, -- optional

      -- Completion
      { "hrsh7th/nvim-cmp" },          -- required
      { "hrsh7th/cmp-nvim-lsp" },      -- required
      { "L3MON4D3/LuaSnip" },          -- required
    },
    -- Optional: minimal example setup (uncomment if you want plug-and-play)
    -- config = function()
    --   local lsp = require("lsp-zero").preset({})
    --   lsp.on_attach(function(_, bufnr)
    --     lsp.default_keymaps({ buffer = bufnr })
    --   end)
    --   lsp.setup()
    -- end,
  },

  ---------------------------------------------------------------------------
  -- Fun: Cellular Automaton
  ---------------------------------------------------------------------------
  {
    "eandrju/cellular-automaton.nvim",
    cmd = { "CellularAutomaton" },
  },

  ---------------------------------------------------------------------------
  -- Statusline
  ---------------------------------------------------------------------------
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = true,
  },
}

