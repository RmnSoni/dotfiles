-- Colorscheme collection (all loaded eagerly, priority = 1000)
-- Switch at runtime with <leader>uC (LazyVim colorscheme picker)

return {
  -- Kanagawa: warm, elegant palette inspired by The Great Wave
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      compile = true,
      theme = "wave", -- "wave", "dragon", "lotus"
    },
  },

  -- Everforest: green-based, comfortable and eye-friendly
  {
    "neanias/everforest-nvim",
    name = "everforest",
    lazy = false,
    priority = 1000,
    opts = {
      background = "medium", -- "soft", "medium", "hard"
    },
  },

  -- Onedark: clean, modern dark theme
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "dark", -- "dark", "darker", "cool", "deep", "warm", "warmer"
    },
  },

  -- Dracula: classic high-contrast dark theme
  {
    "Mofiqul/dracula.nvim",
    name = "dracula",
    lazy = false,
    priority = 1000,
  },

  -- Nord: arctic, bluish, north-bluish color palette
  {
    "shaunsingh/nord.nvim",
    lazy = false,
    priority = 1000,
  },

  -- Gruvbox: warm, retro groove — community-standard Lua port
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      contrast = "hard", -- "", "soft", "hard"
    },
  },

  -- Rose Pine: soft, sophisticated, muted
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    opts = {
      variant = "moon", -- "auto", "dawn", "moon", "main"
    },
  },

  -- Catppuccin: smooth pastels, 4 flavours
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      flavour = "mocha", -- "latte", "frappe", "macchiato", "mocha"
    },
  },

  -- Nightfox: one plugin, 7 built-in themes
  -- (nightfox, dayfox, duskfox, nordfox, dawnfox, terafox, carbonfox)
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
  },

  -- Cyberdream: modern, high-contrast, cyberpunky
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
  },

  -- Tell LazyVim which colorscheme to use by default.
  -- Change this to any of the above to switch.
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },
}