---@type NvPluginSpec[]
local plugins = {
  -- lsp config
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
      { "folke/neodev.nvim", opts = {} },
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      {
        "hrsh7th/cmp-nvim-lsp",
        cond = function()
          return require("custom.configs.utils").has "nvim-cmp"
        end,
      },
      -- typescript
      "jose-elias-alvarez/typescript.nvim",
      -- json and yaml
      {
        "b0o/SchemaStore.nvim",
        version = false, -- last release is way too old
      },
    },

    ---@class PluginLspOpts
    opts = {
      -- options for vim.diagnostic.config()
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
        },
        severity_sort = true,
      },
      inlay_hints = {
        enabled = false,
      },
      -- global capabilities
      capabilities = {},
      -- Automatically format on save
      autoformat = true,
      format_notify = false,
      format = {
        formatting_options = nil,
        timeout_ms = nil,
      },
      servers = {
        eslint = {
          settings = {
            workingDirectory = { mode = "auto" },
          },
        },

        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        },

        ---@type lspconfig.options.tsserver
        tsserver = {
          keys = {
            { "<leader>co", "<cmd>TypescriptOrganizeImports<CR>", desc = "Organize Imports" },
            { "<leader>cR", "<cmd>TypescriptRenameFile<CR>", desc = "Rename File" },
          },
          settings = {
            typescript = {
              format = {
                indentSize = vim.o.shiftwidth,
                convertTabsToSpaces = vim.o.expandtab,
                tabSize = vim.o.tabstop,
              },
            },
            javascript = {
              format = {
                indentSize = vim.o.shiftwidth,
                convertTabsToSpaces = vim.o.expandtab,
                tabSize = vim.o.tabstop,
              },
            },
            completions = {
              completeFunctionCalls = true,
            },
          },
        },

        tailwindcss = {
          filetypes_exclude = { "markdown" },
        },

        -- docker files
        dockerls = {},
        docker_compose_language_service = {},

        -- json
        jsonls = {
          -- lazy-load schemastore when needed
          on_new_config = function(new_config)
            new_config.settings.json.schemas = new_config.settings.json.schemas or {}
            vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
          end,
          settings = {
            json = {
              format = {
                enable = true,
              },
              validate = { enable = true },
            },
          },
        },
        -- yaml
        yamlls = {
          -- Have to add this for yamlls to understand that we support line folding
          capabilities = {
            textDocument = {
              foldingRange = {
                dynamicRegistration = false,
                lineFoldingOnly = true,
              },
            },
          },
          -- lazy-load schemastore when needed
          on_new_config = function(new_config)
            new_config.settings.yaml.schemas = new_config.settings.yaml.schemas or {}
            vim.list_extend(new_config.settings.yaml.schemas, require("schemastore").yaml.schemas())
          end,
          settings = {
            redhat = { telemetry = { enabled = false } },
            yaml = {
              keyOrdering = false,
              format = {
                enable = true,
              },
              validate = true,
              schemaStore = {
                -- Must disable built-in schemaStore support to use
                -- schemas from SchemaStore.nvim plugin
                enable = false,
                -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
                url = "",
              },
            },
          },
        },
      },
      setup = {
        -- eslint
        eslint = function()
          vim.api.nvim_create_autocmd("BufWritePre", {
            callback = function(event)
              local client = vim.lsp.get_active_clients({ bufnr = event.buf, name = "eslint" })[1]
              if client then
                local diag = vim.diagnostic.get(event.buf, { namespace = vim.lsp.diagnostic.get_namespace(client.id) })
                if #diag > 0 then
                  vim.cmd "EslintFixAll"
                end
              end
            end,
          })
        end,

        -- typescript
        tsserver = function(_, opts)
          require("typescript").setup { server = opts }
          return true
        end,

        tailwindcss = function(_, opts)
          local tw = require "lspconfig.server_configurations.tailwindcss"
          --- @param ft string
          opts.filetypes = vim.tbl_filter(function(ft)
            return not vim.tbl_contains(opts.filetypes_exclude or {}, ft)
          end, tw.default_config.filetypes)
        end,
      },
    },
    ---@param opts PluginLspOpts
    config = function(_, opts)
      require("custom.configs.lspconfig").setup(opts)
      require "plugins.configs.lspconfig"
    end,
  },

  -- null-ls
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim" },
    opts = function()
      local nls = require "null-ls"
      return {
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
        sources = {
          -- nls.builtins.formatting.prettier,
          nls.builtins.formatting.fish_indent,
          nls.builtins.diagnostics.fish,
          -- nls.builtins.formatting.stylua,
          -- nls.builtins.formatting.shfmt,
          -- require "typescript.extensions.null-ls.code-actions",
          -- for docker files
          nls.builtins.diagnostics.hadolint,
          -- nls.builtins.diagnostics.flake8,
        },
      }
    end,
  },

  -- formatter
  {
    "mhartington/formatter.nvim",
    cmd = { "Format", "FormatWrite" },
    config = function()
      require("formatter").setup {
        logging = true,
        log_level = vim.log.levels.WARN,
        filetype = {
          lua = {
            require("formatter.filetypes.lua").stylua,
          },

          html = {
            require("formatter.filetypes.html").prettierd,
          },
          css = {
            require("formatter.filetypes.css").prettierd,
          },
          javascript = {
            require("formatter.filetypes.javascript").prettierd,
          },
          javascriptreact = {
            require("formatter.filetypes.javascriptreact").prettierd,
          },
          json = {
            require("formatter.filetypes.javascriptreact").prettierd,
          },
          graphql = {
            require("formatter.filetypes.graphql").prettierd,
          },
          svelte = {
            require("formatter.filetypes.svelte").prettier,
          },

          typescript = {
            require("formatter.filetypes.typescript").prettierd,
          },

          typescriptreact = {
            require("formatter.filetypes.typescriptreact").prettierd,
          },
          sql = {
            require("formatter.filetypes.sql").pgformat,
          },

          sh = {
            require("formatter.filetypes.sh").shfmt,
          },
          markdown = {
            require("formatter.filetypes.markdown").prettierd,
          },

          ["*"] = {
            require("formatter.filetypes.any").remove_trailing_whitespace,
          },
        },
      }
    end,
  },

  -- mason
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "stylua",

        -- web dev stuff
        "css-lsp",
        -- "eslint-lsp",
        "html-lsp",
        "js-debug-adapter",
        "prettierd",
        "svlete-language-server",
        "tailwindcss-language-server",
        "typescript-language-server",
        "css-lsp",
        "html-lsp",
        "prettier",
        -- docker files
        "hadolint",
      },
    },
  },

  -- treesiter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "json",
        "json5",
        "jsonc",
        "jsdoc",
        "svelte",
        "markdown",
        "markdown_inline",
        "dockerfile",
      },
      indent = {
        enable = true,
      },
    },
  },

  -- CODING =======================================================================================
  -- auto pairs
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    opts = {},
  },

  -- Fast and feature-rich surround actions. For text that includes
  {
    "echasnovski/mini.surround",
    keys = function(_, keys)
      -- Populate the keys based on the user's options
      local plugin = require("lazy.core.config").spec.plugins["mini.surround"]
      local opts = require("lazy.core.plugin").values(plugin, "opts", false)
      local mappings = {
        { opts.mappings.add, desc = "Add surrounding", mode = { "n", "v" } },
        { opts.mappings.delete, desc = "Delete surrounding" },
        { opts.mappings.find, desc = "Find right surrounding" },
        { opts.mappings.find_left, desc = "Find left surrounding" },
        { opts.mappings.highlight, desc = "Highlight surrounding" },
        { opts.mappings.replace, desc = "Replace surrounding" },
        { opts.mappings.update_n_lines, desc = "Update `MiniSurround.config.n_lines`" },
      }
      mappings = vim.tbl_filter(function(m)
        return m[1] and #m[1] > 0
      end, mappings)
      return vim.list_extend(mappings, keys)
    end,
    opts = {
      mappings = {
        add = "gza", -- Add surrounding in Normal and Visual modes
        delete = "gzd", -- Delete surrounding
        find = "gzf", -- Find surrounding (to the right)
        find_left = "gzF", -- Find surrounding (to the left)
        highlight = "gzh", -- Highlight surrounding
        replace = "gzr", -- Replace surrounding
        update_n_lines = "gzn", -- Update `n_lines`
      },
    },
  },

  -- comments
  { "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    opts = {
      options = {
        custom_commentstring = function()
          ---@diagnostic disable-next-line: missing-parameter
          return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
        end,
      },
    },
  },

  -- auto add closing tags
  { "windwp/nvim-ts-autotag", lazy = false, config = true },

  -- EDITOR RELATED PLUGINS =======================================================================
  {
    "stevearc/dressing.nvim",
    lazy = true,
    init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(...)
        require("lazy").load { plugins = { "dressing.nvim" } }
        return vim.ui.select(...)
      end
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.input = function(...)
        require("lazy").load { plugins = { "dressing.nvim" } }
        return vim.ui.input(...)
      end
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      filters = {
        dotfiles = false,
      },
      git = {
        enable = true,
      },

      renderer = {
        highlight_git = true,
        icons = {
          show = {
            git = true,
          },
        },
      },
    },
  },

  {
    "malbertzard/inline-fold.nvim",
    opts = {
      defaultPlaceholder = "…",
      queries = {

        html = {
          { pattern = 'class="([^"]*)"', placeholder = "✨" }, -- classes in html
          { pattern = 'href="(.-)"' }, -- hrefs in html
          { pattern = 'src="(.-)"' }, -- HTML img src attribute
        },
        typescript = {
          { pattern = 'className="([^"]*)"', placeholder = "✨" }, -- classes in tsx
          -- { pattern = 'className=("([^"]*)"|{cn\\("([^"]*)"\\)})', placeholder = "✨" }, -- classes in tsx with cn()
          { pattern = 'href="(.-)"' }, -- hrefs in html
          { pattern = 'src="(.-)"' }, -- HTML img src attribute
        },
        typescriptreact = {
          { pattern = 'className="([^"]*)"', placeholder = "✨" }, -- classes in tsx
          -- { pattern = 'className=("([^"]*)"|{cn\\("([^"]*)"\\)})', placeholder = "✨" }, -- classes in tsx with cn()
          { pattern = 'href="(.-)"' }, -- hrefs in html
          { pattern = 'src="(.-)"' }, -- HTML img src attribute
        },
      },
    },
    config = true,
  },
  {
    "yaocccc/nvim-foldsign",
    lazy = false,
    opts = {
      offset = -2,
      foldsigns = {
        open = "-", -- mark the beginning of a fold
        close = "+", -- show a closed fold
        seps = { "│", "┃" }, -- open fold middle marker
      },
    },
    config = true,
  },
  -- diagnostic window
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    opts = { use_diagnostic_signs = true },
    keys = {
      "<leader>xx",
      "<leader>xX",
      "<leader>xL",
      "<leader>xQ",
      "[q",
      "]q",
    },
  },
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  -- search/replace in multiple files
  {
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    opts = { open_cmd = "noswapfile vnew" },
    -- stylua: ignore
    keys = {
      "<leader>sr"
    },
  },

  -- fast search in the buffer with S key
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    vscode = true,
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash" },
      { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o",               function() require("flash").remote() end,     desc = "Remote Flash" },
      {
        "R",
        mode = { "o", "x" },
        function() require("flash").treesitter_search() end,
        desc =
        "Treesitter Search"
      },
      {
        "<c-s>",
        mode = { "c" },
        function() require("flash").toggle() end,
        desc =
        "Toggle Flash Search"
      },
    },
  },

  -- Flash Telescope config
  {
    "nvim-telescope/telescope.nvim",
    optional = true,
    opts = function(_, opts)
      local flashNvim, flash_status = pcall(require, "falsh.nvim")
      if not flash_status then
        return
      end

      local function flash(prompt_bufnr)
        ---@diagnostic disable-next-line: undefined-field
        flashNvim.jump {
          pattern = "^",
          label = { after = { 0, 0 } },
          search = {
            mode = "search",
            exclude = {
              function(win)
                return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "TelescopeResults"
              end,
            },
          },
          action = function(match)
            local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
            picker:set_selection(match.pos[1] - 1)
          end,
        }
      end
      opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
        mappings = { n = { s = flash }, i = { ["<c-s>"] = flash } },
      })
    end,
  },

  -- telescope projects
  {
    "nvim-telescope/telescope.nvim",
    optional = true,
    dependencies = {
      "ahmedkhalf/project.nvim",
      opts = {},
      event = "VeryLazy",
      config = function(_, opts)
        require("project_nvim").setup(opts)
        require("telescope").load_extension "projects"
      end,
      keys = {
        { "<leader>fp", "<Cmd>Telescope projects<CR>", desc = "Projects" },
      },
    },
  },

  -- Finds and lists all of the TODO, HACK, BUG, etc comment
  -- in you project and loads them into a browsable list.
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = { "BufReadPost", "BufNewFile" },
    config = true,
    keys = {
      "]t",
      "[t",
      "<leader>xt",
      "<leader>xT",
      "<leader>st",
      "<leader>sT",
    },
  },

  -- better yank/paste
  {
    "gbprod/yanky.nvim",
    dependencies = { { "kkharji/sqlite.lua", enabled = not jit.os:find "Windows" } },
    opts = function()
      local mapping = require "yanky.telescope.mapping"
      local mappings = mapping.get_defaults()
      mappings.i["<c-p>"] = nil
      return {
        highlight = { timer = 200 },
        ring = { storage = jit.os:find "Windows" and "shada" or "sqlite" },
        picker = {
          telescope = {
            use_default_mappings = false,
            mappings = mappings,
          },
        },
      }
    end,
    keys = {
      -- stylua: ignore
      { "<leader>p", function() require("telescope").extensions.yank_history.yank_history({}) end, desc = "Open Yank History" },
      { "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank text" },
      { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put yanked text after cursor" },
      { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put yanked text before cursor" },
      { "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" }, desc = "Put yanked text after selection" },
      { "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" }, desc = "Put yanked text before selection" },
      { "[y", "<Plug>(YankyCycleForward)", desc = "Cycle forward through yank history" },
      { "]y", "<Plug>(YankyCycleBackward)", desc = "Cycle backward through yank history" },
      { "]p", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put indented after cursor (linewise)" },
      { "[p", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put indented before cursor (linewise)" },
      { "]P", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put indented after cursor (linewise)" },
      { "[P", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put indented before cursor (linewise)" },
      { ">p", "<Plug>(YankyPutIndentAfterShiftRight)", desc = "Put and indent right" },
      { "<p", "<Plug>(YankyPutIndentAfterShiftLeft)", desc = "Put and indent left" },
      { ">P", "<Plug>(YankyPutIndentBeforeShiftRight)", desc = "Put before and indent right" },
      { "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)", desc = "Put before and indent left" },
      { "=p", "<Plug>(YankyPutAfterFilter)", desc = "Put after applying a filter" },
      { "=P", "<Plug>(YankyPutBeforeFilter)", desc = "Put before applying a filter" },
    },
  },

  { "petertriho/nvim-scrollbar", version = "*", lazy = false, config = true },

  {
    "smjonas/inc-rename.nvim",
    opts = {
      input_buffer_type = "dressing",
    },
    config = true,
  },
  {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      delay = 200,
      large_file_cutoff = 2000,
      large_file_overrides = {
        providers = { "lsp" },
      },
    },
    config = function(_, opts)
      require("illuminate").configure(opts)

      local function map(key, dir, buffer)
        vim.keymap.set("n", key, function()
          require("illuminate")["goto_" .. dir .. "_reference"](false)
        end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
      end

      map("]]", "next")
      map("[[", "prev")

      -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          local buffer = vim.api.nvim_get_current_buf()
          map("]]", "next", buffer)
          map("[[", "prev", buffer)
        end,
      })
    end,
    keys = {
      { "]]", desc = "Next Reference" },
      { "[[", desc = "Prev Reference" },
    },
  },

  -- buffer remove
  {
    "echasnovski/mini.bufremove",
    -- stylua: ignore
    keys = {
      { "<leader>bd", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
      { "<leader>bD", function() require("mini.bufremove").delete(0, true) end, desc = "Delete Buffer (Force)" },
    },
  },

  -- LANGUAGUE RELATED PLUGINS ----------------------------------------------------------------------------------------
  -- TAILWIND
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
    },
    opts = function(_, opts)
      local format_kinds = opts.formatting.format
      opts.formatting.format = function(entry, item)
        format_kinds(entry, item) -- add icons
        return require("tailwindcss-colorizer-cmp").formatter(entry, item)
      end
    end,
  },

  -- UTILS
  -- library used by other plugins
  { "nvim-lua/plenary.nvim", lazy = true },

  -- session management
  {
    "rmagatti/auto-session",
    lazy = false,
    opts = {
      log_level = "error",
    },
    config = true,
  },

  -- vim + tmux config
  {
    "alexghergh/nvim-tmux-navigation",
    lazy = false,
    opts = {
      disable_when_zoomed = true, -- defaults to false
    },
    config = true,
  },
}

return plugins
