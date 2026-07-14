return {
  "roerohan/mark.nvim",
  ft = "markdown",
  build = "cd typescript && bun install && bun run build",
  config = function()
    require("mark").setup({
      split_position = "right",
      split_size = 50,
      auto_start = false,
      theme = "GitHub Dark",
      mappings = {
        toggle_preview = "<leader>mp",
      },
    })
  end,
  keys = {
    { "<leader>mp", "<cmd>MarkPreviewToggle<cr>", desc = "Markdown Preview (in-editor)" },
    { "<leader>mP", "<cmd>MarkPreview<cr>", desc = "Markdown Preview Start" },
    { "<leader>ms", "<cmd>MarkPreviewStop<cr>", desc = "Markdown Preview Stop" },
  },
}