-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.
-- stylua: ignore
return {
  {
    'nvim-lualine/lualine.nvim',
   dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        theme = 'auto',
        component_separators = '',
        globalstatus = true,
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
        lualine_b = { {'branch', separator = { right = ''}}},
        lualine_c = {
          { 'filename', path = 1}, --[[ add your center compoentnts here in place of this comment ]]
        },
        lualine_x = {'diff', 'diagnostics'},
        lualine_y = { 'filetype'},
        lualine_z = {
          { 'location', left_padding = 2 },
          { 'progress', separator = { right = '' } },
        },
      },
      inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location', 'percentage' },
      },
      tabline = {},
      extensions = {},
    },
  },
}
