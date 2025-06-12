local builtin = require("telescope.builtin");
vim.keymap.set('n', "<leader>ff", builtin.find_files, {}) -- [F]ind [F]iles
vim.keymap.set('n', "<leader>fg", builtin.git_files, {})  -- [F]ind [G]it Files
vim.keymap.set('n', "<leader>f/", function()		  -- [F]ind [/] Grep
    builtin.grep_string({ search = vim.fn.input("Grep ~ ") });
end)
