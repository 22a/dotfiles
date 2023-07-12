-- Install lazy.nvim if it doesn't exist
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath,
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
vim.keymap.set("n", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>p", '"+p', { desc = "Put from system clipboard" })

vim.keymap.set("n", "<C-p>", function() require("telescope.builtin").find_files() end, { desc = "Find file" })
vim.keymap.set("n", "<leader>F", "<cmd>Telescope<cr>", { desc = "Telescope" })
vim.keymap.set("n", "<leader>fb", function() require("telescope.builtin").buffers() end, { desc = "Find buffer" })
vim.keymap.set("n", "<leader>fc", function() require("telescope.builtin").commands() end, { desc = "Find vim command" })
vim.keymap.set("n", "<leader>ff", function() require("telescope.builtin").find_files { hidden = true, no_ignore = true } end, { desc = "Find file (hidden + ignored)" })
vim.keymap.set("n", "<leader>fr", function() require("telescope.builtin").registers() end, { desc = "Find register" })
vim.keymap.set("n", "<leader>ft", function() require("telescope.builtin").colorscheme { enable_preview = true } end, { desc = "Find theme (colorscheme)" })
vim.keymap.set("n", "<leader>*", function() require("telescope.builtin").grep_string() end, { desc = "Find word under cursor" })

vim.keymap.set("n", "<leader><Tab>", "<cmd>bnext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>`", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
vim.keymap.set("n", "<leader>W", "<cmd>set wrap!<cr>", { desc = "Toggle wrap" })
vim.keymap.set("n", "<leader>B", "<cmd>Git blame<cr>", { desc = "Git blame" })
vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Neotree" })
vim.keymap.set("n", "<leader>d", "<cmd>TroubleToggle<cr>", { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>bo", "<cmd>GBrowse<cr>", { desc = "Git Browse (GitHub)" })
vim.keymap.set("n", "<leader>g", function() require("telescope.builtin").live_grep() end, { desc = "Grep" })
vim.keymap.set("n", "<leader>G",
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
vim.opt.clipboard = 'unnamed,unnamedplus'

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
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    cmd = "Neotree",
    init = function() vim.g.neo_tree_remove_legacy_commands = true end,
    config = function ()
      require("neo-tree").setup({
        enable_git_status = true,
        filesystem = {
          filtered_items = {
            visible = true,
            never_show = { -- uses glob style patterns
              ".git",
            },
          },
          follow_current_file = true,
        },
        buffers = {
          follow_current_file = true,
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
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
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
            if j.path ~= nil then -- is it a file -> open it as well:
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
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
      local null_ls = require "null-ls"
      null_ls.setup({
        sources = {
          null_ls.builtins.diagnostics.eslint,
          null_ls.builtins.diagnostics.shellcheck,
          null_ls.builtins.diagnostics.stylelint,
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.rubocop,
          null_ls.builtins.formatting.stylelint,
        },
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function() vim.lsp.buf.format({async = false}) end,
            })
          end
        end,
      })
    end,
  },

  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim', build = ':MasonUpdate' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'L3MON4D3/LuaSnip' },
      { 'saadparwaiz1/cmp_luasnip'},
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-cmdline' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua', ft = { 'lua' } },
      { 'hrsh7th/cmp-nvim-lsp-signature-help' },
      { 'onsails/lspkind-nvim' },
    },
    config = function ()
      local lsp = require('lsp-zero').preset({})
      lsp.on_attach(function(_, bufnr)
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
        },
        sources = {
          { name = 'path' },
          { name = 'nvim_lsp' },
          { name = 'buffer', keyword_length = 3 },
          { name = 'luasnip', keyword_length = 2 },
          { name = "copilot", group_index = 2 },
        },
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
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "windwp/nvim-ts-autotag",
      "JoosepAlviste/nvim-ts-context-commentstring"
    },
    build = ":TSUpdateSync",
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
    config = function ()
      require('nvim-treesitter.configs').setup {
        ensure_installed = "all",
        highlight = {
          enable = true,
          disable = function(_, bufnr) return vim.api.nvim_buf_line_count(bufnr) > 10000 end,
        },
        indent = { enable = true },
        autotag = { enable = true },
        incremental_selection = { enable = true },
        context_commentstring = { enable = true, enable_autocmd = false },
      }
    end
  },

  {
    'numToStr/Comment.nvim',
    config = function() require('Comment').setup() end
  },

  {
    'lewis6991/gitsigns.nvim',
    config = function() require('gitsigns').setup() end
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    config = function() require('indent_blankline').setup {} end
  },

  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = { -- this is equalent to setup({}) function
      disable_filetype = { "TelescopePrompt" },
      enable_check_bracket_line = false,
    }
  },

  { "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
  },

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

  { -- https://github.com/harrisoncramer/nvim/blob/main/lua/plugins/copilot.lua
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    dependencies = {
      "zbirenbaum/copilot-cmp"
    },
    config = function()
      require("copilot").setup({
        panel = {
          enabled = false
        },
        suggestion = {
          auto_trigger = false,
        }
      })
      require("copilot_cmp").setup({
        formatters = {
          insert_text = require("copilot_cmp.format").remove_existing
        },
      })
    end
  },
}

require("lazy").setup(plugins, {})
require("telescope").load_extension("fzf")

vim.cmd.colorscheme "catppuccin"
