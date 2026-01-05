local opts = {
    noremap = true, -- non-recursive
    silent = true,  -- do not show message
}

vim.g.mapleader = " "

require("blink.cmp").setup({
    keymap = {
        ['<C-Space>'] = { 'accept' },
    }
})
-- Functions
local is_virtual_active = false
local toggle_virtual = function()
    is_virtual_active = not is_virtual_active
    if is_virtual_active then
        vim.diagnostic.config({ virtual_lines = true })
    else
        vim.diagnostic.config({ virtual_lines = false })
    end
end
-- Normal --

--- Window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

--- Resize with arrows
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

--- Leader
vim.keymap.set('n', '<Leader>f', ':Pick files<CR>', opts)
vim.keymap.set('n', '<Leader>g', ':Pick grep<CR>', opts)
-- Toggle all virtual diagnostics
vim.keymap.set('n', '<Leader>e', toggle_virtual, opts)

vim.keymap.set('n', '<Leader>a', vim.lsp.buf.code_action, opts)
vim.keymap.set('n', '<Leader>r', vim.lsp.buf.rename, opts)
-- Run hover twice to always enter into hover box
vim.keymap.set('n', '<Leader>i', function()
    vim.lsp.buf.hover()
    vim.lsp.buf.hover()
end, opts)
-- Toggle Twilight
vim.keymap.set('n', '<Leader>t', ':Twilight<CR>', opts)
-- Open url at cursor
vim.keymap.set('n', '<Leader>u', ':silent !xdg-open "<cWORD>" &<CR>', opts)
-- Visual --

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)
