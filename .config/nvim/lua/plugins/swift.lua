local function find_lldb_dap()
  if vim.fn.executable("xcrun") == 1 then
    local result = vim.system({ "xcrun", "--find", "lldb-dap" }, { text = true }):wait()
    if result.code == 0 then
      local path = vim.trim(result.stdout or "")
      if path ~= "" and vim.fn.executable(path) == 1 then
        return path
      end
    end
  end

  return "lldb-dap"
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "swift" } },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- SourceKit-LSP ships with the Swift toolchain, not Mason.
        sourcekit = {
          mason = false,
          filetypes = { "swift" },
        },
      },
    },
  },

  {
    "mfussenegger/nvim-dap",
    opts = function()
      local dap = require("dap")

      dap.adapters["lldb-dap"] = {
        type = "executable",
        command = find_lldb_dap(),
        name = "lldb-dap",
      }

      dap.configurations.swift = {
        {
          name = "Launch program",
          type = "lldb-dap",
          request = "launch",
          program = function()
            return require("dap.utils").pick_file({ executables = true })
          end,
          cwd = "${workspaceFolder}",
        },
        {
          name = "Launch program with arguments",
          type = "lldb-dap",
          request = "launch",
          program = function()
            return require("dap.utils").pick_file({ executables = true })
          end,
          cwd = "${workspaceFolder}",
          args = function()
            return require("dap.utils").splitstr(vim.fn.input("Arguments: "))
          end,
        },
        {
          name = "Attach to program",
          type = "lldb-dap",
          request = "attach",
          pid = require("dap.utils").pick_process,
          cwd = "${workspaceFolder}",
        },
      }
    end,
  },
}
