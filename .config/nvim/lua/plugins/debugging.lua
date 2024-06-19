return {
  {"mfussenegger/nvim-dap",
    dependencies = { "rcarriga/nvim-dap-ui", "nvim-neotest/nvim-nio", "mfussenegger/nvim-dap-python" },
    config = function()
      local dap, dapui = require("dap"), require("dapui")

      require("dapui").setup()
      require("dap-python").setup("python")

      dap.adapters.lldb = {
        type = 'executable',
        command = '/usr/bin/lldb-dap', -- adjust as needed, must be absolute path
        name = 'lldb'
      }

      dap.configurations.cpp = {
      {
        name = 'Launch',
        type = 'lldb',
        request = 'launch',
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = true,
        args = {},
        },
      }

      dap.configurations.c = dap.configurations.cpp
      dap.configurations.rust = dap.configurations.cpp

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
      vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, {})
      vim.keymap.set("n", "<Leader>dc", dap.continue, {})
    end,
  },
}
