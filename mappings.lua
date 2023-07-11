local M = {}

M.general = {
  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "Window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "Window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>",  "Window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUP<CR>", "Window up" },
  }
}

M.dap = {
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>"
    },
    ["<F5>"] = {
      "<cmd> DapContinue <CR>"
    },
    ["<F6>"] = {
      "<cmd> DapStepOver <CR>"
    },
    ["<F7"] = {
      "<cmd> DapStepInto <CR>"
    },
    ["<F8>"] = {
      "<cmd> DapStepOut <CR>"
    },
    ["<F12>"] = {
      "<cmd> DapTerminate <CR>"
    },
    ["<leader>dui"] = {
      function ()
        require("dapui").toggle();
      end
    }
  }
}

return M
