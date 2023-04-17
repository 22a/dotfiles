-- AstroNvim Configuration Table, based on:
-- https://github.com/AstroNvim/user_example/blob/0c461d009ce2d881d1938041d3edfbe44e2b1054/init.lua

local config = {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin",  -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "v3.*",   -- "latest", tag name, or regex search like "v1.*" (STABLE ONLY)
  },
  -- Set colorscheme to use
  colorscheme = "catppuccin",
  -- set vim options here (vim.<first_key>.<second_key> = value)
  options = {
    opt = {
      swapfile = false,
    },
    g = {
      -- vim-airline config
      airline_theme = "transparent",
      ["airline#extensions#tabline#enabled"] = 1,
      ["airline#extensions#tabline#left_sep"] = " ",
      ["airline#extensions#tabline#left_alt_sep"] = "",
      ["airline#extensions#tabline#buffers_label"] = "",
      ["airline_extensions"] = { "branch", "tabline" },
      ["airline_section_y"] = "",
      ["airline_symbols"] = {
        branch = '',
        colnr = ' ',
        linenr = ' ',
        maxlinenr = '',
      },
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
  },
  lazy = {
    lockfile = vim.fn.stdpath "config" .. "/lazy-lock.json",
  },
  plugins = {
    -- Fully disabling a few of AstroNvim's default plugins
    {
      -- using vim-airline instead, i don't want to need to write 2k loc
      -- of config to reimplement what i'm used to (modified)
      "rebelot/heirline.nvim",
      enabled = false,
    },
    {
      -- not a fan of splash screens
      "goolord/alpha-nvim",
      enabled = false,
    },

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
    {
      "nvim-telescope/telescope.nvim",
      opts = function()
        local actions = require("telescope.actions")
        local action_state = require("telescope.actions.state")
        local get_icon = require("astronvim.utils").get_icon

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
            selection_caret = string.format("%s ", get_icon "Selected"),
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

    -- Personal config for plugins not included in AstroNvim
    {
      "vim-airline/vim-airline",
      lazy = false,
    },
    {
      "vim-airline/vim-airline-themes",
      lazy = false,
    },
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
  },
}

return config
