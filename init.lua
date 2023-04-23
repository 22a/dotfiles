
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Example using a list of specs with the default options
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

plugins = {
  -- Config overrides of AstroNvim's default plugins
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
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function ()
      require("neo-tree").setup({
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
      })
    end
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = function()
      local actions = require("telescope.actions")
      local action_state = require("telescope.actions.state")
      -- local get_icon = require("astronvim.utils").get_icon

      local mm = {
        -- emable telescope multiselect
        ["<CR>"] = function(pb)
          local picker = action_state.get_current_picker(pb)
          local multi = picker:get_multi_selection()
          actions.select_default(pb) -- the normal enter behaviour
          for _, j in pairs(multi) do
            if j.path ~= nil then    -- is it a file -> open it as well:
              vim.cmd(string.format("%s %s", "edit", j.path))
            end
          end
        end,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      }

      return {
        defaults = {
          -- selection_caret = string.format("%s ", get_icon "Selected"),
          path_display = { "truncate" },
          sorting_strategy = "ascending",
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.55,
            },
            vertical = {
              mirror = false,
            },
            width = 0.95,
            height = 0.95,
            preview_cutoff = 120,
          },
          mappings = {
            i = mm,
            n = mm
          },
        },
      }
    end,
  },

  -- AstroNvim "community" plugin monorepo, see https://github.com/AstroNvim/astrocommunity
  -- "AstroNvim/astrocommunity",
  -- { import = "astrocommunity.colorscheme.catppuccin" },
  -- {
  --   "catppuccin",
  --   opts = {
  --     flavour = "mocha", -- latte, frappe, macchiato, mocha
  --     no_italic = true,
  --   },
  -- },
  -- { import = "astrocommunity.completion.copilot-lua-cmp" },

  -- Personal config for plugins not included in AstroNvim
  -- {
  --   "vim-airline/vim-airline",
  --   lazy = false,
  -- },
  -- {
  --   "vim-airline/vim-airline-themes",
  --   lazy = false,
  -- },
  {
    "tpope/vim-fugitive",
    lazy = false,
    -- event = "VeryLazy", -- breaks airline's branch extension, so we load eagerly
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
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function() require("nvim-surround").setup() end,
  },
}

require("lazy").setup(plugins, {
  -- defaults = {
  --   lazy = true,
  -- }
})

vim.opt.swapfile = false

-- vim-airline config
vim.g.airline_theme = "transparent"
vim.g["airline#extensions#tabline#enabled"] = 1
vim.g["airline#extensions#tabline#left_sep"] = " "
vim.g["airline#extensions#tabline#left_alt_sep"] = ""
vim.g["airline#extensions#tabline#buffers_label"] = ""
vim.g["airline_extensions"] = { "branch", "tabline" }
vim.g["airline_section_y"] = ""
vim.g["airline_symbols"] = {
  branch = '',
  colnr = ' ',
  linenr = ' ',
  maxlinenr = '',
}

vim.keymap.set("n", "<leader><Tab>", function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end, { desc = "Next buffer" })
vim.keymap.set("n", "<leader>w", "<Cmd>w<CR>", { desc = "Write buffer" })
mappings = {
  n = {
    ["<leader>`"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },
    ["<leader>G"] = {
      function()
        require("telescope.builtin").live_grep {
          additional_args = function(args) return vim.list_extend(args, { "--hidden" }) end,
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
}
