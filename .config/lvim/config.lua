--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "base16-tomorrow-night"
lvim.transparent_window = true
vim.opt.relativenumber = true
lvim.line_wrap_cursor_movement = false
vim.opt.undofile = false
lvim.lsp.document_highlight = false
vim.opt.shell = "bash" -- let vim use bash for max compatibility, fish breaks noninteractive flows
vim.opt.inccommand = "split" -- show live previews of substitutions

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- lvim.builtin.telescope.on_config_done = function()
--   local actions = require "telescope.actions"
--   -- for input mode
--   lvim.builtin.telescope.defaults.mappings.i["<C-j>"] = actions.move_selection_next
--   lvim.builtin.telescope.defaults.mappings.i["<C-k>"] = actions.move_selection_previous
--   lvim.builtin.telescope.defaults.mappings.i["<C-n>"] = actions.cycle_history_next
--   lvim.builtin.telescope.defaults.mappings.i["<C-p>"] = actions.cycle_history_prev
--   -- for normal mode
--   lvim.builtin.telescope.defaults.mappings.n["<C-j>"] = actions.move_selection_next
--   lvim.builtin.telescope.defaults.mappings.n["<C-k>"] = actions.move_selection_previous
-- end

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnosticss" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnosticss" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

lvim.builtin.bufferline.on_config_done = function ()
  vim.api.nvim_exec([[
  let bufferline = get(g:, 'bufferline', {})
  let bufferline.icons = v:true
  "let bufferline.closable = v:false
  "let bufferline.clickable = v:false
  let bufferline.no_name_title = '[no name]'
  "let bufferline.icon_separator_active = '▎'
  "let bufferline.icon_separator_inactive = '▎'
  let bufferline.icon_separator_active = ''
  let bufferline.icon_separator_inactive = ''
  "let bufferline.icon_close_tab = ' '
  let bufferline.icon_close_tab_modified = '●'

  hi BufferCurrent        guifg=#ffffff guibg=#373b41
  hi BufferCurrentIcon                  guibg=#373b41
  hi BufferCurrentIndex   guifg=#81a2be guibg=#373b41
  hi BufferCurrentMod     guifg=#f0c674 guibg=#373b41
  hi BufferCurrentSign    guifg=#81a2be guibg=#373b41
  hi BufferCurrentTarget  guifg=#ff0000 guibg=#373b41
    ]], false)
end

local components = require "core.lualine.components"
lvim.builtin.lualine.style = "none"
lvim.builtin.lualine.options = {
  icons_enabled = true,
  component_separators = { "", "" },
  section_separators = { "", "" },
  disabled_filetypes = { "dashboard", "NvimTree", "Outline" },
}
lvim.builtin.lualine.sections.lualine_a = {
  "mode",
}
lvim.builtin.lualine.sections.lualine_b = {
  components.branch,
  {
    'filename',
    file_status = false, -- displays file status (readonly status, modified status)
    path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
  },
}
lvim.builtin.lualine.sections.lualine_c = {
  components.diff,
  components.python_env,
}
lvim.builtin.lualine.sections.lualine_x = {
  components.diagnostics,
  components.treesitter,
  components.lsp,
  components.filetype,
}
lvim.builtin.lualine.sections.lualine_y = {
  "progress"
}
lvim.builtin.lualine.sections.lualine_z = {
  "location"
}
lvim.builtin.lualine.inactive_sections = {
  lualine_a = {
    "filename",
  },
  lualine_b = {},
  lualine_c = {},
  lualine_x = {},
  lualine_y = {},
  lualine_z = {},
}
lvim.builtin.lualine.tabline = {}
lvim.builtin.lualine.extensions = { "nvim-tree" }
lvim.builtin.lualine.options.theme = "powerline"

-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
-- you can overwrite the null_ls setup table (useful for setting the root_dir function)
-- lvim.lsp.null_ls.setup = {
--   root_dir = require("lspconfig").util.root_pattern("Makefile", ".git", "node_modules"),
-- }
-- or if you need something more advanced
-- lvim.lsp.null_ls.setup.root_dir = function(fname)
--   if vim.bo.filetype == "javascript" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "node_modules")(fname)
--       or require("lspconfig/util").path.dirname(fname)
--   elseif vim.bo.filetype == "php" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "composer.json")(fname) or vim.fn.getcwd()
--   else
--     return require("lspconfig/util").root_pattern("Makefile", ".git")(fname) or require("lspconfig/util").path.dirname(fname)
--   end
-- end

-- set a formatter if you want to override the default lsp one (if it exists)
-- lvim.lang.python.formatters = {
--   {
--     exe = "black",
--   }
-- }
-- set an additional linter
-- lvim.lang.python.linters = {
--   {
--     exe = "flake8",
--   }
-- }

-- Additional Plugins
-- lvim.plugins = {
--     {"folke/tokyonight.nvim"},
--     {
--       "folke/trouble.nvim",
--       cmd = "TroubleToggle",
--     },
-- }
lvim.plugins = {
  {"RRethy/nvim-base16"},
  {"kevinhwang91/nvim-bqf"},
  {
    "unblevable/quick-scope",
    config = function()
      -- The default behavior is to always decorate the line with highlights.
      -- Trigger a highlight in the appropriate direction only when pressing these keys:
      vim.g.qs_highlight_on_keys = {'f', 'F', 't', 'T'}
      vim.api.nvim_exec(
        [[
        highlight link QuickScopePrimary   Search
        highlight link QuickScopeSecondary Error
        ]], false)
    end
  },
  {"psliwka/vim-smoothie"},
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }
