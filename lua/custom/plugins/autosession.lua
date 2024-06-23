-- Autosession will save the tabs and buffers from the last session, vim last place saves the cursor location
-- Together these two allow the session to be persistened between opening and closing vi
--
local function shutdown_dap()
  local dap = require 'dap'
  local dapui = require 'dapui'
  dapui.close()
  dap.terminate()
end

return {
  {
    'rmagatti/auto-session',

    config = function()
      require('auto-session').setup {
        log_level = 'error',
        auto_session_suppress_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
        pre_save_cmds = { 'Neotree close', 'OutlineClose', shutdown_dap },
      }
    end,
  },
  {
    'farmergreg/vim-lastplace',
  },
}
