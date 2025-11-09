vim.lsp.enable({
    "cssls", -- npm i -g vscode-langservers-extracted
    "html",
    "jsonls",
    "lua_ls",  -- os package mgr: lua-language-server
    "pyright", -- npm i -g pyright
    "rust-analyzer",
    "bashls",
})
vim.lsp.config("rust-analyzer", {})
vim.lsp.enable('rust-analyzer')

vim.lsp.config("ruff", {})
vim.lsp.enable('ruff')

-- Disable pyright linting etc. in favour of Ruff
vim.lsp.config("pyright", {
    settings = {
        pyright = {
            disableOrganizeImports = true,
        },
        python = {
            analysis = {
                -- Ignore all files for analysis to exclusively use Ruff for linting
                ignore = { '*' },
            },
        },
    },
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
        local methods = vim.lsp.protocol.Methods
        -- https://github.com/neovim/neovim/blob/b2828af5b5aba044cd40594a519d2d9f5dbb69cb/runtime/lua/vim/lsp/protocol.lua?plain=1#L858
        if client:supports_method(methods.textDocument_completion) then
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end

        -- Save on format
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = ev.buf,
            callback = function()
                vim.lsp.buf.format { async = false, id = ev.data.client_id }
            end,
        })
    end,
})

local ts_parsers = {
    "bash",
    "c",
    "dockerfile",
    "fish",
    "git_config",
    "git_rebase",
    "gitattributes",
    "gitcommit",
    "gitignore",
    "html",
    "javascript",
    "json",
    "lua",
    "make",
    "markdown",
    "python",
    "rust",
    "sql",
    "toml",
    "vim",
    "yaml",
}
local nts = require("nvim-treesitter")
nts.setup({
    highlight = { enable = true }
})
nts.install(ts_parsers)

-- blink.cmp config in keymap.lua
require("treesitter-context").setup({
    max_lines = 3,
    multiline_threshold = 1,
    separator = "-",
    min_window_height = 20,
    line_numbers = true,
})
