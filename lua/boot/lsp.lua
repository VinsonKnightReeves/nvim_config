vim.lsp.enable("luals");

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local keys = vim.keymap
        local opts = { noremap = true, silent = true }

        opts.desc = "[G]oto [D]eclaration"
        keys.set("n", "gd", vim.lsp.buf.declaration, opts)

        opts.desc = "[G]oto [F]ind [R]eferences"
        keys.set("n", "gfr", "<cmd>Telescope lsp_references<CR>", opts)

        opts.desc = "[G]oto [F]ind [D]efinitions"
        keys.set("n", "gfd", "<cmd>Telescope lsp_definitions<CR>", opts)

        opts.desc = "[G]oto [F]ind [I]mplementations"
        keys.set("n", "gfi", "<cmd>Telescope lsp_implementations<CR>", opts)

        opts.desc = "[G]oto [F]ind [T]ype Definitions"
        keys.set("n", "gft", "<cmd>Telescope lsp_type_definitions<CR>", opts)

        opts.desc = "LSP Previous Diagnostic"
        keys.set("n", ",[", function() vim.diagnostic.jump({count=1, float=true}) end, opts)

        opts.desc = "LSP Previous Diagnostic"
        keys.set("n", ",[", function() vim.diagnostic.jump({count=-1, float=true}) end, opts)

        opts.desc = "LSP Diagnostics"
        keys.set("n", ",d", vim.diagnostic.open_float, opts)

        opts.desc = "[,]LSP [C]ode [A]ctions"
        keys.set({"n", "v" }, ",ca", vim.lsp.buf.code_action, opts)

        opts.desc = "[,]LSP [C]ode [R]e[n]ame"
        keys.set("n", ",rn", vim.lsp.buf.rename, opts)

        opts.desc = "[,]LSP [R]e[s]tart"
        keys.set("n", ",rs", "<cmd>LspRestart<CR>", opts)
    end,
})
