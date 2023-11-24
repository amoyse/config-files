-- define common options
-- local opts = {
--     noremap = true,      -- non-recursive
--     silent = true,       -- do not show message
-- }


-- Leader stuff
vim.g.mapleader = ' '
vim.g.localmapleader = ' '


vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- Escaping insert mode
vim.keymap.set('i', 'jj', '<Esc>')
vim.keymap.set('i', 'jk', '<Esc>:w<CR>')

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")



-- ThePrimeagen Remaps

-- Allows movement of highlighted lines!
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- When replacing text with another piece of text, don't copy replaced thing into buffer
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Bin capital Q (it sucks)
vim.keymap.set("n", "Q", "<nop>")

-------


-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Resize with arrows
-- delta: 2 lines
vim.keymap.set('n', '<CS-Up>', ':resize -2<CR>')
vim.keymap.set('n', '<CS-Down>', ':resize +2<CR>')
vim.keymap.set('n', '<CS-Left>', ':vertical resize -2<CR>')
vim.keymap.set('n', '<CS-Right>', ':vertical resize +2<CR>')


vim.keymap.set("i", "<Esc><BS>", "<C-w>")


-- Writer Mode!
local is_wrap_enabled = false
function WriterMode()
    if is_wrap_enabled then
        vim.opt.linebreak = false
        vim.opt.spell = false
        vim.keymap.del({'n', 'v'}, 'j')
        vim.keymap.del({'n', 'v'}, 'k')
        vim.keymap.del({'n', 'v'}, '0')
        vim.keymap.del({'n', 'v'}, '^')
        vim.keymap.del({'n', 'v'}, '$')
        is_wrap_enabled = false
    else
        vim.opt.linebreak = true
        vim.opt.spell = true
        vim.keymap.set({"n", "v"}, "j", "gj")
        vim.keymap.set({"n", "v"}, "k", "gk")
        vim.keymap.set({"n", "v"}, "0", "g0")
        vim.keymap.set({"n", "v"}, "^", "g^")
        vim.keymap.set({"n", "v"}, "$", "g$")
        is_wrap_enabled = true
    end
end


vim.keymap.set("n", "<leader>w", ":lua WriterMode()<CR>")


