-- AstroNvim Configuration Table, based on:
-- https://github.com/AstroNvim/user_example/blob/0c461d009ce2d881d1938041d3edfbe44e2b1054/init.lua

local config = {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "v3.*", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
  },

  -- Set colorscheme to use
  colorscheme = "catppuccin",

  -- set vim options here (vim.<first_key>.<second_key> = value)
  options = {
    opt = {
      relativenumber = true, -- sets vim.opt.relativenumber
      number = true, -- sets vim.opt.number
      spell = false, -- sets vim.opt.spell
      signcolumn = "auto", -- sets vim.opt.signcolumn to auto
      wrap = false, -- sets vim.opt.wrap
      swapfile = false, -- sets vim.opt.swapfile
    },
    g = {
      mapleader = " ", -- sets vim.g.mapleader
      autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
      -- cmp_enabled = true, -- enable completion at start
      -- autopairs_enabled = true, -- enable autopairs at start
      -- diagnostics_mode = 3, -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
      icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
      ui_notifications_enabled = true, -- disable notifications when toggling UI elements

      -- vim-airline config
      airline_theme = "transparent",
      ["airline#extensions#tabline#enabled"] = 1,
      ["airline#extensions#tabline#left_sep"] = " ",
      ["airline#extensions#tabline#left_alt_sep"] = "",
      ["airline#extensions#tabline#buffers_label"]= "",
    },
  },

  mappings = {
    n = {
      ["<leader><Tab>"] = {
        function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
        desc = "Next buffer"
      },
      ["<leader>`"] = {
        function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
        desc = "Previous buffer",
      },
      ["<leader>G"] = {
        function()
          require("telescope.builtin").live_grep {
            additional_args = function(args) return vim.list_extend(args, { "--hidden"}) end,
          }
        end,
        desc = "Find words in all files",
      },
      ["<leader>Q"] = {
        ":q!<cr>",
      },
      ["<leader>B"] = {
        ":Git blame<cr>",
        desc = "Git Blame"
      },
      ["<leader>bo"] = {
        ":GBrowse<cr>",
        desc = "Git Browse (open in GitHub)"
      },
      ["<leader>W"] = {
        ":set wrap!<cr>",
        desc = "Toggle wrap"
      },

      ["<C-p>"] = {
        function() require("telescope.builtin").find_files() end,
        desc = "Find files"
      },
      ["<C-s>"] = {
        ":w!<cr>",
        desc = "Save File"
      },
    },
  },

  plugins = {
    -- Config overrides of default AstroNvim plugin setup
    {
      "rebelot/heirline.nvim",
      enabled = false,
    },
    {
      "goolord/alpha-nvim",
      -- enabled = false,
      opts = function(_, opts)
        emacs = [[
▓█████  ███▄ ▄███▓ ▄▄▄       ▄████▄    ██████
▓█   ▀ ▓██▒▀█▀ ██▒▒████▄    ▒██▀ ▀█  ▒██    ▒
▒███   ▓██    ▓██░▒██  ▀█▄  ▒▓█    ▄ ░ ▓██▄
▒▓█  ▄ ▒██    ▒██ ░██▄▄▄▄██ ▒▓▓▄ ▄██▒  ▒   ██▒
░▒████▒▒██▒   ░██▒ ▓█   ▓██▒▒ ▓███▀ ░▒██████▒▒
░░ ▒░ ░░ ▒░   ░  ░ ▒▒   ▓▒█░░ ░▒ ▒  ░▒ ▒▓▒ ▒ ░
 ░ ░  ░░  ░      ░  ▒   ▒▒ ░  ░  ▒   ░ ░▒  ░ ░
   ░   ░      ░     ░   ▒   ░        ░  ░  ░
   ░  ░       ░         ░  ░░ ░            ░
]]
        opts.section.buttons.val = {}
        opts.section.header.val = {}
        opts.config.layout[3].val = 0
        for line in emacs:gmatch("([^\n]*)\n?") do
          table.insert(opts.section.header.val, line)
        end
        return opts
      end,
    },
    {
      "jose-elias-alvarez/null-ls.nvim",
      opts = function(_, config)
        local null_ls = require "null-ls"
        -- List of supported formatters and linters:
        -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
        -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
        config.sources = {
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.rubocop,
          null_ls.builtins.diagnostics.eslint,
          null_ls.builtins.diagnostics.shellcheck,
          null_ls.builtins.diagnostics.stylelint,
        }
        return config
      end,
    },
    {
      "nvim-neo-tree/neo-tree.nvim",
      opts = {
        filesystem = {
          filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = true,
            never_show = { -- uses glob style patterns
              ".git",
            },
          },
        },
        window = {
          width = 40,
        },
        sources = {
          "filesystem",
        },
        source_selector = {
          winbar = false,
          statusline = false
        }
      },
    },

    -- AstroNvim "community" plugin monorepo, see https://github.com/AstroNvim/astrocommunity
    "AstroNvim/astrocommunity",
    { import = "astrocommunity.colorscheme.catppuccin" },
    {
      "catppuccin",
      opts = {
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        no_italic = true,
      },
    },
    -- { import = "astrocommunity.completion.copilot-lua-cmp" },

    -- Personal config of plugins not included in AstroNvim
    {
      "tpope/vim-fugitive",
      event = "VeryLazy",
    },
    {
      "tpope/vim-rhubarb",
      event = "VeryLazy",
    },
    {
      "lukoshkin/trailing-whitespace",
      event = "VeryLazy",
    },
    {
      "vim-airline/vim-airline",
      lazy = false,
    },
    {
      "vim-airline/vim-airline-themes",
      lazy = false,
    },
    {
      "kylechui/nvim-surround",
      event = "VeryLazy",
      config = function() require("nvim-surround").setup() end
    },
  },

  polish = function()
  end,
}

return config
