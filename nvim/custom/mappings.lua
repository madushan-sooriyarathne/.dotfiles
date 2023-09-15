---@type MappingsTable
local M = {}

M.disabled = {
  n = {
    ["<leader>xx"] = "",
    ["<leader>x"] = "",
    ["<C-h>"] = "",
    ["<C-l>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",
  },
}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>qq"] = { ":qa <CR>", "Exit Neovim", opts = { nowait = true } },
    ["x"] = { '"_x', "Delete without coping", opts = { nowait = true } },

    -- move lines
    ["<A-j>"] = { "<cmd>m .+1<cr>==", "Move line down", opts = { nowait = true } },
    ["<A-k>"] = { "<cmd>m .-2<cr>==", "Move line up", opts = { nowait = true } },

    -- resize windows with Ctrl+arrow keys
    ["<C-Up>"] = { "<cmd>resize +2<cr>", "Increase window height", opts = { nowait = true } },
    ["<C-Down>"] = { "<cmd>resize -2<cr>", "Decrease window height", opts = { nowait = true } },
    ["<C-Left>"] = { "<cmd>vertical resize -2<cr>", "Decrease window width", opts = { nowait = true } },
    ["<C-Right>"] = { "<cmd>vertical resize +2<cr>", "Increse window width", opts = { nowait = true } },

    -- switch between panes with TMUX

    ["<C-h>"] = { "<cmd>NvimTmuxNavigateLeft <CR>", "Move to down pane" },
    ["<C-l>"] = { "<cmd>NvimTmuxNavigateRight <CR>", "Move to right pane" },
    ["<C-j>"] = { "<cmd>NvimTmuxNavigateDown <CR>", "Move to down pane" },
    ["<C-k>"] = { "<cmd>NvimTmuxNavigateUp <CR>", "Move to top pane" },
    ["C-\\"] = { "<cmd>NvimTmuxNavigateLastActive <CR>", "Move to last active pane" },
    --
    ["<leader>ts"] = {
      function()
        print "im being pressed"
      end,
      "Move to down pane",
    },

    -- close all buffers except unsaved and current one
    ["<leader>bP"] = {
      "<cmd>bufdo if (bufnr('%') != bufnr('#')) | bd | endif <CR>",
      "Close all buffers except unsaved onces",
    },

    ["<leader>fm"] = {
      "<cmd> :Format <CR>",
      "LSP formatting",
    },
    -- inc rename:
    ["<leader>rn"] = {
      function()
        return ":IncRename " .. vim.fn.expand "<cword>"
      end,
      opts = { nowait = true, expr = true },
    },
    ["F2"] = {
      function()
        return ":IncRename " .. vim.fn.expand "<cword>"
      end,
      opts = { nowait = true, expr = true },
    },

    -- search and replace entire codebase
    ["<leader>sr"] = {
      function()
        require("spectre").open()
      end,
      "Replace in files (Spectre)",
      opts = { nowait = true },
    },

    -- highlight under cursor
    ["<leader>ui"] = {
      vim.show_pos,
      "Highlight word under cursor",
      opts = { nowait = true },
    },

    -- clear search diff update and redaraw
    ["<leader>ur"] = {
      "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
      "Redraw / clear hlsearch / diff update",
      opts = { nowait = true },
    },

    ["gw"] = {
      "*N",
      "Search word under cursor",
    },

    -- keywordprg
    ["<leader>K"] = { "<cmd>norm! K<cr>", "keywordprg", opts = { nowait = true } },

    -- naviage buffers
    ["<S-h>"] = { "<cmd>bprevious<CR>", "Go to previous buffer", opts = { nowait = true } },
    ["<S-l>"] = { "<cmd>bnext<CR>", "Go to next buffer", opts = { nowait = true } },

    -- new file
    ["<leader>fn"] = { "<cmd>enew<CR>", "New file", opts = { nowait = true } },

    -- buffer delete
    -- stylua: ignore
    [ "<leader>bd" ] = { function() require("mini.bufremove").delete(0, false) end,  "Delete Buffer" },

    -- stylua: ignore
    [ "<leader>bD" ] = { function() require("mini.bufremove").delete(0, true) end,  "Delete Buffer (Force)" },
  },

  i = {
    ["jk"] = { "<ESC>", "Exit insert mode", opts = { nowait = true } },
    ["kj"] = { "<ESC>", "Exit insert mode", opts = { nowait = true } },
    -- move lines
    ["<A-j>"] = { "<esc><cmd>m .+1<cr>==gi", "Move line down", opts = { nowait = true } },
    ["<A-k>"] = { "<esc><cmd>m .-2<cr>==gi", "Move line up", opts = { nowait = true } },
  },

  v = {
    -- move lines
    ["<A-j>"] = { ":m '>+1<cr>gv=gv", "Move line down", opts = { nowait = true } },
    ["<A-k>"] = { ":m '<-2<cr>gv=gv", "Move line up", opts = { nowait = true } },

    -- better indeting
    [">"] = { ">gv", "Indent right", opts = { nowait = true } },
    ["<"] = { "<gv", "Indent left", opts = { nowait = true } },
  },

  x = {

    ["gw"] = {
      "*N",
      "Search word under cursor",
      opts = { nowait = true },
    },
  },
}

-- more keybinds!
-- M.lspconfig = {
--   n = {
--     -- ["<leader>co"] = { "<cmd>TypescriptOrganizeImports<CR>", "Organize Imports" },
--     -- ["<leader>cR"] = { "<cmd>TypescriptRenameFile<CR>", "Rename File" },
--   },
-- }

M.trouble = {
  n = {
    ["<leader>xx"] = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics (Trouble)" },
    ["<leader>xX"] = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics (Trouble)" },
    ["<leader>xL"] = { "<cmd>TroubleToggle loclist<cr>", "Location List (Trouble)" },
    ["<leader>xQ"] = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix List (Trouble)" },
    ["[q"] = {

      function()
        if require("trouble").is_open() then
          require("trouble").previous { skip_groups = true, jump = true }
        else
          local ok, err = pcall(vim.cmd.cprev)
          if not ok then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      end,
      "Previous trouble/quickfix item",
    },
    ["]q"] = {

      function()
        if require("trouble").is_open() then
          require("trouble").next { skip_groups = true, jump = true }
        else
          local ok, err = pcall(vim.cmd.cnext)
          if not ok then
            ---@diagnostic disable-next-line: param-type-mismatch
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      end,
      "Next trouble/quickfix item",
    },
  },
}

M.todo_comments = {
  n = {

    ["]t"] = {
      function()
        require("todo-comments").jump_next()
      end,
      "Next todo comment",
    },
    ["[t"] = {
      function()
        require("todo-comments").jump_prev()
      end,
      "Previous todo comment",
    },
    ["<leader>xt"] = { "<cmd>TodoTrouble<cr>", "Todo (Trouble)" },
    ["<leader>xT"] = { "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", "Todo/Fix/Fixme (Trouble)" },
    ["<leader>st"] = { "<cmd>TodoTelescope<cr>", "Todo" },
    ["<leader>sT"] = { "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", "Todo/Fix/Fixme" },
  },
}

M.telescope = {
  n = {

    ["<leader>fp"] = { "<Cmd>Telescope projects<CR>", "Telesceope Projects" },
  },
}

return M
