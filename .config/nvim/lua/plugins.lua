vim.pack.add({
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = 'main' },
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/nvim-treesitter/nvim-treesitter-context",
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/karb94/neoscroll.nvim",
    "https://github.com/ruifm/gitlinker.nvim",
    "https://github.com/tpope/vim-fugitive",
    "https://github.com/tpope/vim-rhubarb",
    "https://github.com/navarasu/onedark.nvim",
    { src = "https://github.com/Saghen/blink.cmp",                version = vim.version.range(">1.0") },
    "https://github.com/nvim-mini/mini.pick",
    "https://github.com/rafamadriz/friendly-snippets",
    "https://github.com/mrcjkb/rustaceanvim",
})

require("mini.pick").setup()
require("neoscroll").setup({ duration_multiplier = 0.5 })
require("gitlinker").setup()
