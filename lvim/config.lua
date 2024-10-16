-- Install plugins
lvim.builtin.bufferline.active = false

lvim.plugins = {
  { "rafamadriz/friendly-snippets" },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
    },
  },
  "ChristianChiarulli/swenv.nvim",
  "stevearc/dressing.nvim",
  "mfussenegger/nvim-dap-python",
  "ThePrimeagen/harpoon",
}

-- Automatically install syntax highlighting for various languages
lvim.builtin.treesitter.ensure_installed = {
  "python",
  "vue",        -- Vue support
  "javascript", -- JavaScript support
  "html",       -- HTML syntax support
  "css",        -- CSS syntax support
}

-- Setup formatting using Prettier for JS and Vue files
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { name = "black" }, -- Python formatter
  { command = "prettier", filetypes = { "vue", "javascript", "html", "css" } }
}
lvim.format_on_save.enabled = true
lvim.format_on_save.pattern = { "*.py", "*.js", "*.vue" }

-- Setup linting using ESLint for JS and Vue files
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "flake8", filetypes = { "python" } },
  { command = "eslint", filetypes = { "javascript", "vue" } }
}

-- Setup debug adapter for Python
lvim.builtin.dap.active = true
local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
pcall(function()
  require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
end)

-- Key binding for switching Python environments
lvim.builtin.which_key.mappings["C"] = {
  name = "Python",
  c = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Choose Env" },
}

-- Use vls (Vue Language Server) for Vue (JavaScript-only setup, no TypeScript)
lvim.lsp.automatic_configuration.skipped_servers = { "volar" } -- Skip volar (TypeScript-centric server)

local lspconfig = require("lspconfig")
lspconfig.vls.setup {
  filetypes = { "javascript", "vue", "javascriptreact", "json" },  -- JavaScript-related filetypes
}

-- Ensure the Vue language server (vls) is installed
lvim.builtin.mason.ensure_installed = { "vuels" }

-- Remaps (Key mappings)

-- Map leader to space
lvim.leader = "space"

-- Move lines up/down in visual mode
lvim.keys.visual_mode["J"] = ":m '>+1<CR>gv=gv"
lvim.keys.visual_mode["K"] = ":m '<-2<CR>gv=gv"

-- Center cursor on navigation
lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"
lvim.keys.normal_mode["<C-u>"] = "<C-u>zz"

-- Copy to system clipboard
lvim.keys.normal_mode["<leader>y"] = '"+y'
lvim.keys.visual_mode["<leader>y"] = '"+y'
lvim.keys.normal_mode["<leader>Y"] = '"+Y'

-- Rename variables in the current buffer
lvim.keys.normal_mode["<leader>s"] = [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]

-- Code actions
lvim.keys.normal_mode["<leader>ca"] = vim.lsp.buf.code_action

-- Telescope bindings
local builtin = require('telescope.builtin')
lvim.keys.normal_mode["<leader>pf"] = builtin.find_files
lvim.keys.normal_mode["<leader>pg"] = builtin.live_grep

-- Harpoon (file navigation)
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
lvim.keys.normal_mode["<leader>a"] = mark.add_file
lvim.keys.normal_mode["<C-e>"] = ui.toggle_quick_menu
lvim.keys.normal_mode["<C-h>"] = function() ui.nav_file(1) end
lvim.keys.normal_mode["<C-j>"] = function() ui.nav_file(2) end
lvim.keys.normal_mode["<C-k>"] = function() ui.nav_file(3) end
lvim.keys.normal_mode["<C-l>"] = function() ui.nav_file(4) end

-- General editor settings

-- Cursor settings
vim.opt.guicursor = {
  "n-v-c:block",     -- Normal, Visual, and Command-line mode: block cursor
  "i:ver25",         -- Insert mode: vertical bar cursor
  "r-cr:hor20",      -- Replace and Command-line Replace mode: horizontal bar cursor
  "o:hor50",         -- Operator-pending mode: horizontal bar cursor
}

-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Tab and indentation
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Misc settings
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.cursorline = true

-- Colorscheme configuration
lvim.colorscheme = "tokyonight"
vim.g.tokyonight_transparent = true

