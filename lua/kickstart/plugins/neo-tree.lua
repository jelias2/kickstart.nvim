-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '<C-e>', ':Neotree toggle<CR>', { desc = 'NeoTree reveal' } },
  },
  opts = {
    close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
    -- use_libuv_file_watcher = true,
    filesystem = {
      filtered_items = {
        visible = true, -- when true, they will just be displayed differently than normal items
        hide_dotfiles = false,
        hide_gitignored = false,
      },
      follow_current_file = {
        enabled = true, -- This will find and focus the file in the active buffer every time
        --               -- the current file is changed while the tree is open.
        leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
      },
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
  },

  --- Notes
  --- When in Neotree window use the following shortcuts
  --- 'R' to refresh the filetree
  --- 'r' to refresh the filetree
  --- 'Backspace' to go up a directory
  --- '.' to set a new root of the filetree
  --- 's' to open a file in split
  --- 'i' to inspect a file
}
