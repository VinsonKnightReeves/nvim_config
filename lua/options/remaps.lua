-- U is redo, C-u is redo line
vim.keymap.set("n", "U", "<C-r>")
-- Shift j,k moves selected visual mode text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

-- Don't move cursor when joining lines, paging up and down, or finding search terms
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- Leader yank, paste, delete uses '+' register (c, s, r, x not modified)
vim.keymap.set("n", "<leader>p", "\"+p");
vim.keymap.set("n", "<leader>P", "\"+P");
vim.keymap.set("n", "<leader>y", "\"+y");
vim.keymap.set("n", "<leader>Y", "\"+Y");
vim.keymap.set("n", "<leader>d", "\"+d");
vim.keymap.set("n", "<leader>D", "\"+D");

vim.keymap.set("v", "<leader>p", "\"+p");
vim.keymap.set("v", "<leader>P", "\"+P");
vim.keymap.set("v", "<leader>y", "\"+y");
vim.keymap.set("v", "<leader>Y", "\"+Y");
vim.keymap.set("v", "<leader>d", "\"+d");
vim.keymap.set("v", "<leader>D", "\"+D");

-- global find and replace
-- vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w> ... ?
-- many keymaps from the primeagen
