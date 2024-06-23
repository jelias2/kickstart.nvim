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
  init = function()
    ---Adds a component to the lualine after lualine was already set up. Useful for
    ---lazyloading. Accessed via `vim.g`, as this file's exports are used by lazy.nvim
    ---@param whichBar "tabline"|"winbar"|"inactive_winbar"|"sections"
    ---@param whichSection "lualine_a"|"lualine_b"|"lualine_c"|"lualine_x"|"lualine_y"|"lualine_z"
    ---@param component function|table the component forming the lualine
    ---@param whereInSection? "before"|"after" defaults to "after"
    vim.g.lualine_add = function(whichBar, whichSection, component, whereInSection)
            local ok, lualine = pcall(require, "lualine")
            if not ok then return end
            local sectionConfig = lualine.get_config()[whichBar][whichSection] or {}

            local componentObj = type(component) == "table" and component or { component }
            if whereInSection == "before" then
                    table.insert(sectionConfig, 1, componentObj)
            else
                    table.insert(sectionConfig, componentObj)
            end
            lualine.setup { [whichBar] = { [whichSection] = sectionConfig } }

            -- Theming needs to be re-applied, since the lualine-styling can change
            require("config.theme-customization").themeModifications()
    end
  end,
  },
}
