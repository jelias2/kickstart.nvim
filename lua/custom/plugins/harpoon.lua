return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'

      -- REQUIRED
      harpoon:setup()
      -- REQUIRED

      -- Pin
      vim.keymap.set('n', '<C-p>', function()
        harpoon:list():add()
      end)
      -- Menu
      vim.keymap.set('n', '<C-a>', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)

      vim.keymap.set('n', '<C-s>', function()
        harpoon:list():select(1)
      end)
      vim.keymap.set('n', '<C-d>', function()
        harpoon:list():select(2)
      end)
      vim.keymap.set('n', '<C-f>', function()
        harpoon:list():select(3)
      end)

      -- vim.keymap.set('n', '<C-4>', function()
      -- harpoon:list():select(4)
      -- end)

      -- Control + Shift + C = Control C Clear
      vim.keymap.set('n', '<C-S-C>', function()
        harpoon:list():clear()
      end)
      -- require('nvim-autopairs').setup {}
      -- local harpoon = require 'harpoon'
      harpoon:setup {}

      -- basic telescope configuration
      local conf = require('telescope.config').values
      local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end

        require('telescope.pickers')
          .new({}, {
            prompt_title = 'Harpoon',
            finder = require('telescope.finders').new_table {
              results = file_paths,
            },
            previewer = conf.file_previewer {},
            sorter = conf.generic_sorter {},
          })
          :find()
      end

      vim.keymap.set('n', '<C-A>', function()
        toggle_telescope(harpoon:list())
      end, { desc = 'Open harpoon window' })
      -- -- If you want to automatically add `(` after selecting a function or method
      -- local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
      -- local cmp = require 'cmp'
      -- cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },
}
