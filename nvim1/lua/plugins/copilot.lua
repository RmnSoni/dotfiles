return {
    "github/copilot.vim",
    -- event = "InsertEnter",
    lazy = false,
    config = function()
        vim.cmd("imap <silent><script><expr> <C-J> copilot#Accept('\\<CR>')")
        vim.g.copilot_no_tab_map = true
    end,
}
