return {
  {
    'folke/tokyonight.nvim',
    opts = {
      transparent = true,
      styles = {
        sidebars = 'transparent',
        floats = 'transparent',
      },
    },
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 9999,
    opts = {
      transparent_background = true, -- disables setting the background color.
    },
  },
  {
    'EdenEast/nightfox.nvim',
    opts = {
      options = {
        -- transparent = true, -- Disable setting background
      },
    },
  },
}
