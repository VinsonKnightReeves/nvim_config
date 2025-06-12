vim.opt.termguicolors = true

local tree = require("nvim-tree");
local api = require("nvim-tree.api");
local keys = vim.keymap

local function attach_tree(bufnr)
    local function mkopts(description)
        return {
            desc = "nvim-tree: " .. description,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true
        }
    end

    -- DEFAULT MAPPINGS
    --api.config.mappings.default_on_attach(bufnr)

    -- CUSTOM MAPPINGS
    -- keys.set("n", "<C-e>",  api.tree.open,                      {desc = "nvim-tree: Toggle", nowait = true})
    -- Navigate
      local function enter_directory()
          local curr = api.tree.get_node_under_cursor()
          if (curr) then
              if (curr.type == "directory") then
                  vim.cmd("normal! j")
                  api.node.navigate.parent()
                  local parent = api.tree.get_node_under_cursor()
                  if not (curr == parent) then
                      api.node.open.edit(curr)
                      api.node.navigate.sibling.next(curr)
                      api.node.navigate.sibling.prev()
                  end
                  vim.cmd("normal! j")
              else
                  api.node.navigate.sibling.next(curr)
              end
          end
      end

      local function focused(func) return function()
              func(nil, {quit_on_open=true, focus=true})
      end end

      local function unfocused(func)
          return function()
              func(nil, {quit_on_open=false, focus=false})
          end
      end


      keys.set("n", "l",      enter_directory,                    mkopts("Open and Enter Directory"))
      keys.set("n", "h",      api.node.navigate.parent,           mkopts("Leave Directory"))
      keys.set("n", "H",      api.node.navigate.parent_close,     mkopts("Leave and Close Directory"))
      keys.set("n", "j",      api.node.navigate.sibling.next,     mkopts("Next Sibling"))
      keys.set("n", "k",      api.node.navigate.sibling.prev,     mkopts("Previous Sibling"))
      keys.set("n", "<CR>",   api.tree.change_root_to_node,       mkopts("make directory working, cd"))
      keys.set("n", "<BS>",   api.tree.change_root_to_parent,     mkopts("make parent directory working, cd .."))
      -- Open Files
      keys.set("n", "e",      focused(api.node.open.edit),        mkopts("Open in place"))
      keys.set("n", "s",      focused(api.node.open.horizontal),  mkopts("Open horizontal split"))
      keys.set("n", "v",      focused(api.node.open.vertical),    mkopts("Open vertical split"))
      keys.set("n", "e",      focused(api.node.open.tab),        mkopts("Open in new tab"))
      keys.set("n", "S",      unfocused(api.node.open.horizontal),mkopts("Open unfocused horizontal split"))
      keys.set("n", "V",      unfocused(api.node.open.vertical),  mkopts("Open unfocused vertical split"))
      keys.set("n", "V", function() api.node.open.vertical(nil, {quit_on_open=false, focus=false}) end, mkopts("Open unfocused in vertical split"))
      -- File Edit Operations
      keys.set("n", "%",      api.fs.create,                      mkopts("Create file or directory/"))
      keys.set("n", "r",      api.fs.rename,                      mkopts("Rename file"))
      keys.set("n", "d",      api.fs.remove,                      mkopts("Delete file"))
end

tree.setup({
    on_attach = attach_tree,
    view = {
        side = "right",
    }
})

keys.set("n", "<C-e>",  api.tree.toggle, {desc = "nvim-tree: Toggle", nowait = true})
