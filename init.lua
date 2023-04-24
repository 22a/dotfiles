-- Install lazy.nvim if it doesn't exist
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

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

vim.keymap.set("n", "<C-h>", "<C-w>h", {})
vim.keymap.set("n", "<C-j>", "<C-w>j", {})
vim.keymap.set("n", "<C-k>", "<C-w>k", {})
vim.keymap.set("n", "<C-l>", "<C-w>l", {})
vim.keymap.set("n", "|", "<cmd>vsplit<cr>", { desc = "Vertical Split" })
vim.keymap.set("n", "\\", "<cmd>split<cr>", { desc = "Horizontal Split" })
vim.keymap.set("n", "Q", "<nop>", {})
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Write buffer" })
vim.keymap.set("n", "<C-s>", "<cmd>w<cr>", { desc = "Write buffer" })
vim.keymap.set("n", "<leader>c", "<cmd>bdelete<cr>", { desc = "Close buffer" })
vim.keymap.set("n", "<leader>C", "<cmd>bdelete!<cr>", { desc = "Close buffer (forcefully)" })
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
vim.keymap.set("n", "<leader>Q", "<cmd>q!<cr>", { desc = "Quit (forcefully)" })

vim.keymap.set("n", "<leader>F", "<cmd>Telescope<cr>", { desc = "Telescope" })
vim.keymap.set("n", "<C-p>", function() require("telescope.builtin").find_files() end, { desc = "Find file" })
vim.keymap.set("n", "<leader>fb", function() require("telescope.builtin").buffers() end, { desc = "Find buffer" })
vim.keymap.set("n", "<leader>fc", function() require("telescope.builtin").commands() end, { desc = "Find vim command" })
vim.keymap.set("n", "<leader>ff", function() require("telescope.builtin").find_files { hidden = true, no_ignore = true } end, { desc = "Find file (hidden + ignored)" })
vim.keymap.set("n", "<leader>fr", function() require("telescope.builtin").registers() end, { desc = "Find register" })
vim.keymap.set("n", "<leader>ft", function() require("telescope.builtin").colorscheme { enable_preview = true } end, { desc = "Find theme (colorscheme)" })
vim.keymap.set("n", "<leader>*", function() require("telescope.builtin").grep_string() end, { desc = "Find word under cursor" })

vim.keymap.set("n", "<leader>`", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader><Tab>", "<cmd>bnext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
vim.keymap.set("n", "<leader>W", "<cmd>set wrap!<cr>", { desc = "Toggle wrap" })
vim.keymap.set("n", "<leader>B", "<cmd>Git blame<cr>", { desc = "Git blame" })
vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Neotree" })
vim.keymap.set("n", "<leader>bo", "<cmd>GBrowse<cr>", { desc = "Git Browse (GitHub)" })
vim.keymap.set("n", "<leader>g", function() require("telescope.builtin").live_grep() end, { desc = "Grep" })
vim.keymap.set("n", "<leader>g",
  function()
    require("telescope.builtin").live_grep {
      additional_args = function(args) return vim.list_extend(args, { "--hidden", "--no-ignore" }) end,
    }
  end
, { desc = "Grep (hidden + ignored)" })


vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.swapfile = false
vim.opt.swapfile = false
vim.opt.foldenable = true
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.scrolloff = 12
vim.opt.sidescrolloff = 12

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





local plugins = {
  -- Config overrides of AstroNvim's default plugins
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local null_ls = require "null-ls"
      null_ls.setup({
        -- List of supported formatters and linters:
        -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
        -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
        sources = {
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.rubocop,
          null_ls.builtins.diagnostics.eslint,
          null_ls.builtins.diagnostics.shellcheck,
          null_ls.builtins.diagnostics.stylelint,
        }
      })
    end,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    cmd = "Neotree",
    init = function() vim.g.neo_tree_remove_legacy_commands = true end,
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
    cmd = "Telescope",
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", enabled = vim.fn.executable "make" == 1, build = "make" },
    },
    opts = function()
      local actions = require("telescope.actions")
      local action_state = require("telescope.actions.state")

      local mm = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<cr>"] = function(pb)
          local picker = action_state.get_current_picker(pb)
          local multi = picker:get_multi_selection()
          actions.select_default(pb) -- the normal enter behaviour
          for _, j in pairs(multi) do
            if j.path ~= nil then    -- is it a file -> open it as well:
              vim.cmd(string.format("%s %s", "edit", j.path))
            end
          end
        end,
      }

      return {
        defaults = {
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

  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Optional
        'williamboman/mason.nvim',
        build = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
    },
    config = function ()
      local lsp = require('lsp-zero').preset({})
      lsp.on_attach(function(client, bufnr)
        lsp.default_keymaps({buffer = bufnr})
      end)
      lsp.setup()

      local cmp = require('cmp')
      local cmp_action = require('lsp-zero').cmp_action()

      cmp.setup({
        mapping = {
          -- `Enter` key to confirm completion
          ['<CR>'] = cmp.mapping.confirm({select = false}),
          ['<S-CR>'] = cmp.mapping.confirm({select = true}),

          -- space+space to trigger completion menu
          -- ['<space><space>'] = cmp.mapping.complete(),

          -- Navigate between snippet placeholder
          ['<Tab>'] = cmp_action.luasnip_supertab(),
          ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
          ['<C-j>'] = cmp_action.luasnip_supertab(),
          ['<C-k>'] = cmp_action.luasnip_shift_supertab(),

          ['<C-h>'] = cmp_action.luasnip_jump_backward(),
          ['<C-l>'] = cmp_action.luasnip_jump_forward(),
        }
      })

      require("mason-lspconfig").setup {
        ensure_installed = {
          "lua_ls",
          "rust_analyzer",
          "tsserver",
          "ember",
          "tailwindcss",
          "cssls",
          "html",
          "jsonls",
          "bashls",
          "lua_ls",
        },
      }
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "windwp/nvim-ts-autotag", "JoosepAlviste/nvim-ts-context-commentstring" },
    cmd = {
      "TSBufDisable",
      "TSBufEnable",
      "TSBufToggle",
      "TSDisable",
      "TSEnable",
      "TSToggle",
      "TSInstall",
      "TSInstallInfo",
      "TSInstallSync",
      "TSModuleInfo",
      "TSUninstall",
      "TSUpdate",
      "TSUpdateSync",
    },
    build = ":TSUpdate",
    opts = {
      highlight = {
        enable = true,
        disable = function(_, bufnr) return vim.api.nvim_buf_line_count(bufnr) > 10000 end,
      },
      incremental_selection = { enable = true },
      indent = { enable = true },
      autotag = { enable = true },
      context_commentstring = { enable = true, enable_autocmd = false },
      ensure_installed = {
        "ember"
      },
    },
  },

  { "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
  },

  -- Personal config for plugins not included in AstroNvim
  {
    "folke/neodev.nvim",
    lazy = false,
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

vim.cmd.colorscheme "catppuccin"

