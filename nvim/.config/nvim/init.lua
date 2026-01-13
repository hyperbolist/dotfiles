-- set leader key asap
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- options
vim.o.backup = false
vim.o.breakindent = true
-- vim.o.cmdheight = 0 -- still causes strange notification-related behaviors
vim.o.completeopt = "menuone,noselect,fuzzy"
vim.o.cursorcolumn = false
vim.o.cursorline = true
vim.o.expandtab = true
vim.o.fillchars = "eob: "
vim.o.formatoptions = "qjl1"
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.infercase = true
vim.o.linebreak = true
vim.o.mouse = ""
vim.o.number = true
vim.o.numberwidth = 1
vim.o.relativenumber = false
vim.o.ruler = false
vim.o.scrolloff = 8
vim.o.shiftwidth = 2
vim.o.shortmess = vim.o.shortmess .. 'WcC'
vim.o.showmode = false
vim.o.signcolumn = "yes"
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.softtabstop = 2
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.splitkeep = "screen"
vim.o.statuscolumn = "%=%l%s" -- put sign column to the right of line number column
vim.o.swapfile = false
vim.o.tabstop = 2
vim.o.termguicolors = true
vim.o.undofile = true
vim.o.winborder = "rounded"
vim.o.wrap = true
vim.o.wrapscan = true
vim.o.writebackup = false
vim.o.virtualedit = "block"

-- use the os clipboard for everything
vim.cmd("set clipboard+=unnamedplus")

-- plugin installation
vim.pack.add({
  -- dependencies
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },

  -- lsp tooling
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
  { src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
  { src = "https://github.com/nvimtools/none-ls.nvim" },

  -- code
  { src = "https://github.com/folke/todo-comments.nvim" },

  -- ui
  { src = "https://github.com/RRethy/nvim-base16" },
  { src = "https://github.com/psliwka/vim-smoothie" },
  { src = "https://github.com/smjonas/inc-rename.nvim" },
  { src = "https://github.com/j-hui/fidget.nvim" },

  -- completions
  { src = "https://github.com/saghen/blink.cmp" },

  -- for now, let's try to use mini when possible
  { src = "https://github.com/nvim-mini/mini.nvim" },

  -- telescope is superior to mini.pick
  { src = "https://github.com/nvim-telescope/telescope.nvim" },
  { src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },

  -- can't seem to quit a file tree
  { src = "https://github.com/nvim-neo-tree/neo-tree.nvim" },
  { src = "https://github.com/MunifTanjim/nui.nvim" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },

  -- markdown
  { src = "https://github.com/bullets-vim/bullets.vim" },
  { src = "https://github.com/jakewvincent/mkdnflow.nvim" },
  { src = "https://github.com/iamcco/markdown-preview.nvim" }, -- :call mkdp#util#install()
  { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },

  -- helm
  { src = "https://github.com/towolf/vim-helm" },

})

-- plugin setup
require "blink-cmp".setup({
  keymap = { preset = "super-tab" },
  signature = {
    enabled = true,
    window = {
      show_documentation = true,
    }
  },
  completion = { documentation = { auto_show = true } },
  fuzzy = { implementation = "lua" },
})

require "fidget".setup({
  -- progress = {
  -- 	suppress_on_insert = true,
  -- 	ignore_done_already = true,
  -- 	ignore_empty_message = true,
  -- },
})

require "inc_rename".setup({})
require "mkdnflow".setup({})
require "mason".setup({})
require "mason-lspconfig".setup({})

require('mason-tool-installer').setup({
  ensure_installed = {
    -- bash
    'bash-language-server',
    'shellcheck',
    'shellharden',
    'shfmt',

    -- fish
    'fish-lsp',

    -- golang
    'gofumpt',
    'goimports',
    'gomodifytags',
    'gopls',

    -- helm
    'helm-ls',

    -- lua
    'lua-language-server',

    -- markdown
    'markdownlint-cli2',

    -- yaml
    'yaml-language-server',
    'yamlfmt',
    'yamllint',

  },
  auto_update = false,
  run_on_start = true,
  -- start_delay = 3000,
  -- debounce_hours = 5,
})

require "mini.bracketed".setup()
require "mini.bufremove".setup()

local miniclue = require('mini.clue')
miniclue.setup({
  window = {
    delay = 500,
    config = {
      width = 40,
    },
  },

  triggers = {
    -- Leader triggers
    { mode = 'n', keys = '<Leader>' },
    { mode = 'x', keys = '<Leader>' },

    -- `[` and `]` keys
    { mode = 'n', keys = '[' },
    { mode = 'n', keys = ']' },

    -- Built-in completion
    { mode = 'i', keys = '<C-x>' },

    -- `g` key
    { mode = 'n', keys = 'g' },
    { mode = 'x', keys = 'g' },

    -- Marks
    { mode = 'n', keys = "'" },
    { mode = 'n', keys = '`' },
    { mode = 'x', keys = "'" },
    { mode = 'x', keys = '`' },

    -- Registers
    { mode = 'n', keys = '"' },
    { mode = 'x', keys = '"' },
    { mode = 'i', keys = '<C-r>' },
    { mode = 'c', keys = '<C-r>' },

    -- Window commands
    { mode = 'n', keys = '<C-w>' },

    -- `z` key
    { mode = 'n', keys = 'z' },
    { mode = 'x', keys = 'z' },

    -- `s` mini.surround
    { mode = 'n', keys = 's' },

    -- `\` toggles
    { mode = 'n', keys = '\\' },
  },

  clues = {
    -- Enhance this by adding descriptions for <Leader> mapping groups
    miniclue.gen_clues.square_brackets(),
    miniclue.gen_clues.builtin_completion(),
    miniclue.gen_clues.g(),
    miniclue.gen_clues.marks(),
    miniclue.gen_clues.registers(),
    miniclue.gen_clues.windows(),
    miniclue.gen_clues.z(),

    { mode = 'n', keys = '<Leader>b', desc = '+Buffers' },
    { mode = 'n', keys = '<Leader>c', desc = '+Code' },
  },
})

require "mini.diff".setup({
  view = {
    style = 'sign',
    signs = { add = '┃', change = '┃', delete = '_' },
    priority = 0,
  },
})

require "mini.extra".setup()

require "mini.files".setup({
  windows = {
    max_number = 3,
    preview = true,
    width_focus = 32,
    width_nofocus = 16,
    width_preview = 48,
  },
})

require "mini.git".setup()
require "mini.icons".setup()
require "mini.indentscope".setup({
  symbol = '┆',
})

require('mini.move').setup({
  mappings = {
    left       = '<S-left>',
    right      = '<S-right>',
    down       = '<S-down>',
    up         = '<S-up>',

    line_left  = '<S-left>',
    line_right = '<S-right>',
    line_down  = '<S-down>',
    line_up    = '<S-up>',
  }
})

require "mini.pairs".setup()
require "mini.pick".setup()

require "mini.statusline".setup({
  content = {
    active = function()
      local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 75 })
      local git           = MiniStatusline.section_git({ trunc_width = 40 })
      local diff          = MiniStatusline.section_diff({ trunc_width = 75 })
      local diagnostics   = MiniStatusline.section_diagnostics({ trunc_width = 75 })
      local lsp           = MiniStatusline.section_lsp({ trunc_width = 140 })
      local filename      = MiniStatusline.section_filename({ trunc_width = 75 })
      local fileinfo      = MiniStatusline.section_fileinfo({ trunc_width = 140 })
      local location      = MiniStatusline.section_location({ trunc_width = 140 })
      local search        = MiniStatusline.section_searchcount({ trunc_width = 140 })

      local devinfo_hl    = (mode_hl == 'MiniStatuslineModeInsert' and 'MiniStatuslineDevinfoInsert' or 'MiniStatuslineDevinfo')
      local filename_hl   = (mode_hl == 'MiniStatuslineModeInsert' and 'MiniStatuslineFilenameInsert' or 'MiniStatuslineFilename')
      local fileinfo_hl   = (mode_hl == 'MiniStatuslineModeInsert' and 'MiniStatuslineFileinfoInsert' or 'MiniStatuslineFileinfo')

      return MiniStatusline.combine_groups({
        { hl = mode_hl,    strings = { mode } },
        { hl = devinfo_hl, strings = { git, diff, diagnostics, lsp } },
        '%<', -- Mark general truncate point
        { hl = filename_hl, strings = { filename } },
        '%=', -- End left alignment
        { hl = fileinfo_hl, strings = { fileinfo } },
        { hl = mode_hl,     strings = { search, location } },
      })
    end,
  },
})

require 'mini.surround'.setup()
require "mini.tabline".setup()

require 'nvim-web-devicons'.setup({})

require "neo-tree".setup({
  open_files_in_last_window = false,
  popup_border_style = "rounded",
  source_selector = {
    statusline = true,
    sources = {
      { source = "filesystem" },
      { source = "buffers" },
      { source = "git_status" },
    },
    truncation_character = "…",
  },
  default_component_configs = {
    icon = {
      folder_closed = "󰉋 ",
      folder_open = " ",
      folder_empty = "󰉖 ",
      folder_empty_open = "󰷏 ",
      default = "*",
    },
    git_status = {
      symbols = {
        -- Change type
        added     = "✚",
        deleted   = "✖",
        modified  = "",
        renamed   = "󰁕",
        -- Status type
        untracked = " ",
        ignored   = "󱋭 ",
        unstaged  = "󰄱 ",
        staged    = "󰱒 ",
        conflict  = " ",
      },
      align = "right",
    },
  },
  filesystem = {
    follow_current_file = { enabled = true, },
    use_libuv_file_watcher = true,
    window = {
      mappings = {
        ['l'] = "open",
        ['<Right>'] = "open",
        ['h'] = "close_node",
        ['<Left>'] = "close_node",
      }
    }
  },
  window = {
    mappings = {
      ['/'] = "noop", -- let '/' search in the buffer instead of invoking neo-tree's fuzzy finder
    }
  }
})

local null_ls = require("null-ls")
require "null-ls".setup({
  sources = {
    null_ls.builtins.code_actions.gomodifytags,
    null_ls.builtins.formatting.goimports,
    null_ls.builtins.formatting.gofumpt,
  }
})

require "render-markdown".setup({
  checkbox = {
    custom = {
      inprogress = {
        raw = '[=]',
        rendered = '󰄗 ',
        highlight = "RenderMarkdownUnchecked",
        scope_highlight = nil,
      },
      canceled = {
        raw = '[-]',
        rendered = '󱋭 ',
        highlight = "RenderMarkdownUnchecked",
        scope_highlight = nil,
      },
      -- remove the annoying "just an example" that's in the defaults that conflicts with canceled
      todo = {},
    }
  },
  heading = {
    backgrounds = {},
  },
  sign = {
    enabled = false,
  },
})

local telescope_actions = require("telescope.actions")
require "telescope".setup({
  defaults = {
    layout_strategy = "vertical",
    layout_config = { vertical = { height = 0.95, width = 0.95, }, },
    mappings = {
      i = {
        ["<esc>"] = telescope_actions.close
      },
    },
  },
})

require "todo-comments".setup()

require "nvim-treesitter".install({
  "lua", "go", "gomod", "gowork", "gosum"
})

require "nvim-treesitter".setup({
  ensure_installed = { "lua", "go", "gomod", "gowork", "gosum" },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  auto_install = true,
  sync_install = false,
  ignore_install = {},
  modules = {},
})

-- lsp
vim.diagnostic.config({
  virtual_lines = true,
  virtual_text = false,
})


vim.lsp.config["lua_ls"] = {
  settings = {
    Lua = {
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      }
    }
  }
}

-- keymaps
vim.keymap.set('n', '<leader>ff', ":lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>", { desc = "MiniFiles" })
vim.keymap.set('n', '<leader>e', "<Cmd>Neotree toggle<CR>", { desc = "(E)xplore Files" })
vim.keymap.set('n', '<leader>En', function()
  require('telescope.builtin').find_files {
    cwd = vim.fn.stdpath("config")
  }
end, { desc = "Edit (N)eovim Config" })
-- vim.keymap.set('n', '<leader>fd', ":Pick files<CR>", { desc = "Pick Files" })
vim.keymap.set('n', '<leader>fd', require('telescope.builtin').find_files, { desc = "Find Files" })
-- vim.keymap.set('n', '<leader>cd', ":lua MiniExtra.pickers.diagnostic()<CR>", { desc = "Pick (D)iagnostics" })
vim.keymap.set('n', '<leader>cd', require('telescope.builtin').diagnostics, { desc = "Code (D)iagnostics" })
vim.keymap.set('n', '<leader>cp', ":MarkdownPreview<CR>", { desc = "Markdown (P)review" })
vim.keymap.set('v', '<leader>ct', ":!tr -s ' ' | /opt/homebrew/opt/util-linux/bin/column -t -s '|' -o '|'<CR>",
  { desc = "Markdown (T)able Format" })
-- vim.keymap.set('n', '<leader>g', ":Pick grep_live<CR>", { desc = "Live (G)rep" })
vim.keymap.set('n', '<leader>rg', require('telescope.builtin').live_grep, { desc = "Live (G)rep" })
vim.keymap.set('n', '<leader>h', ":noh<CR>", { desc = "No (H)ighlight" })
vim.keymap.set('n', 'H', ':bp<CR>', { desc = "Previous Buffer" })
vim.keymap.set('n', 'L', ':bn<CR>', { desc = "Next Buffer" })
vim.keymap.set('n', '<leader>bd', ":lua MiniBufremove.delete()<CR>", { desc = "(D)elete" })
vim.keymap.set('n', '<leader>bl', ":Telescope buffers<CR>", { desc = "(L)ist" })
vim.keymap.set('n', '<leader>bo', function()
  local bufs = vim.api.nvim_list_bufs()
  local current = vim.api.nvim_get_current_buf()
  local bufremove = require("mini.bufremove")
  for _, buf in ipairs(bufs) do
    if buf ~= current and vim.api.nvim_buf_is_loaded(buf) then
      bufremove.delete(buf)
    end
  end
end, { desc = "Delete (O)thers" })

vim.g.smoothie_remapped_commands = { "<C-D>", "<C-U>" }
vim.keymap.set({ "n", "v" }, "<PageDown>", function()
  return "<CMD>call smoothie#do('<C-d>') <CR>"
end, { silent = true, expr = true })
vim.keymap.set({ "n", "v" }, "<PageUp>", function()
  return "<CMD>call smoothie#do('<C-u>') <CR>"
end, { silent = true, expr = true })

vim.keymap.set('n', "q:", "<NOP")

vim.keymap.set('n', 'gra', "<NOP>")
vim.keymap.set('n', 'gri', "<NOP>")
vim.keymap.set('n', 'grn', "<NOP>")
vim.keymap.set('n', 'grr', "<NOP>")
vim.keymap.set('n', 'grt', "<NOP>")
vim.keymap.del('n', 'gra')
vim.keymap.del('n', 'gri')
vim.keymap.del('n', 'grn')
vim.keymap.del('n', 'grr')
vim.keymap.del('n', 'grt')
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to definition" })
-- vim.keymap.set('n', 'gr', ':Pick lsp scope="references"<CR>', { desc = "Go to references" })
vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, { desc = "Go to (R)eferences" })
vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { desc = "(A)ction" })
vim.keymap.set('n', '<leader>cr', function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true, desc = "(R)ename" })

vim.keymap.set('n', "\\c", "<Cmd>setlocal cursorline! cursorline?<CR>", { desc = "(no)cursorline" })
vim.keymap.set('n', "\\C", "<Cmd>setlocal cursorcolumn! cursorcolumn?<CR>", { desc = "(no)cursorcolumn" })
vim.keymap.set('n', '\\l', function()
  local opts = vim.diagnostic.config()
  if not opts then
    opts = { virtual_lines = true }
  end
  opts.virtual_lines = not opts.virtual_lines
  vim.diagnostic.config(opts)
end, { desc = "(no)virtual_lines" })
vim.keymap.set('n', "\\L", "<Cmd>setlocal list! list?<CR>", { desc = "(no)list" })
vim.keymap.set('n', "\\n", "<Cmd>setlocal number! number?<CR>", { desc = "(no)line numbers" })
vim.keymap.set('n', "\\r", "<Cmd>setlocal relativenumber! relativenumber?<CR>", { desc = "(no)relative line numbers" })
vim.keymap.set('n', "\\s", "<Cmd>setlocal spell! spell?<CR>", { desc = "(no)spell" })
vim.keymap.set('n', "\\w", "<Cmd>setlocal wrap! wrap?<CR>", { desc = "(no)wrap" })

-- colorscheme
vim.cmd("colorscheme base16-tomorrow-night")

-- highlights
vim.cmd("hi! Visual  guifg=#282a2e guibg=#f0c674")

vim.cmd("hi! MiniStatuslineModeNormal guifg=#282a2e guibg=#c5c8c6")
vim.cmd("hi! MiniStatuslineModeInsert guifg=#282a2e guibg=#c5c8c6")
vim.cmd("hi! MiniStatuslineModeVisual guifg=#282a2e guibg=#f0c674")
vim.cmd("hi! MiniStatuslineModeReplace guifg=#282a2e guibg=#cc6666")
vim.cmd("hi! MiniStatuslineModeCommand guifg=#282a2e guibg=#b294bb")
vim.cmd("hi! MiniStatuslineDevinfoInsert guifg=#282a2e guibg=#8abeb7")
vim.cmd("hi! MiniStatuslineFileinfoInsert guifg=#282a2e guibg=#8abeb7")
vim.cmd("hi! MiniStatuslineFilenameInsert guifg=#282a2e guibg=#81a2be")

vim.cmd("hi! MiniDiffSignAdd guifg=#b5bd68")
vim.cmd("hi! MiniDiffSignChange guifg=#81a2be")
vim.cmd("hi! MiniDiffSignDelete guifg=#cc6666")

vim.cmd("hi! MiniTablineCurrent guifg=#c5c8c6 guibg=#373b41")
vim.cmd("hi! MiniTablineVisible guifg=#c5c8c6 guibg=#373b41")
vim.cmd("hi! MiniTablineModifiedCurrent guifg=#f0c674 guibg=#373b41")
vim.cmd("hi! MiniTablineModifiedVisible guifg=#f0c674")
vim.cmd("hi! MiniTablineModifiedHidden guifg=#de935f")

vim.cmd("hi! MiniIndentscopeSymbol guifg=#8abeb7")

vim.cmd("hi! NeoTreeGitModified guifg=#f0c674")

vim.cmd("hi! link TelescopeBorder TelescopeNormal")
vim.cmd("hi! link TelescopePromptBorder TelescopePromptNormal")
vim.cmd("hi! link TelescopePreviewBorder TelescopePreviewNormal")
vim.cmd("hi! link TelescopeResultsBorder TelescopeResultsNormal")
vim.cmd("hi! link TelescopePromptTitle MiniStatuslineModeCommand")
vim.cmd("hi! link TelescopeResultsTitle IncSearch")
vim.cmd("hi! link TelescopePreviewLine TelescopePreviewMatch")
vim.cmd("hi! link TelescopeMatching TelescopePreviewMatch")

-- ensure tmux is able to decorate the background color based on active status
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none" })
vim.api.nvim_set_hl(0, "LineNrAbove", { bg = "none" })
vim.api.nvim_set_hl(0, "LineNrBelow", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "MiniPickBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "MiniFilesBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
vim.api.nvim_set_hl(0, "MsgArea", { bg = "none" })

-- autocommands (mostly harvested from LazyVim)
local function augroup(name)
  return vim.api.nvim_create_augroup("zoinks_" .. name, { clear = true })
end

local augroup_lspFormatting = vim.api.nvim_create_augroup("LspFormatting", {})
vim.api.nvim_create_autocmd('LspAttach', {
  group = augroup("lsp_autoformat"),
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client and client:supports_method('textDocument/formatting') then
      vim.api.nvim_clear_autocmds({
        group = augroup_lspFormatting,
        buffer = ev.buf,
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup_lspFormatting,
        buffer = ev.buf,
        callback = function()
          vim.lsp.buf.format()
        end,
      })
    end
  end
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    (vim.hl or vim.highlight).on_yank()
  end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = augroup("resize_splits"),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup("last_loc"),
  callback = function(event)
    local exclude = { "gitcommit" }
    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
      return
    end
    vim.b[buf].lazyvim_last_loc = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_q"),
  pattern = {
    "checkhealth",
    "help",
    "lspinfo",
    "qf",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.schedule(function()
      vim.keymap.set("n", "q", function()
        vim.cmd("close")
        pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
      end, {
        buffer = event.buf,
        silent = true,
        desc = "Quit buffer",
      })
    end)
  end,
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("wrap_spell"),
  pattern = { "text", "plaintex", "typst", "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- ensure treesitter starts in markdown buffers
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "markdown" },
  callback = function()
    pcall(vim.treesitter.start)
  end,
})

-- Fix conceallevel for json files
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = augroup("json_conceal"),
  pattern = { "json", "jsonc", "json5" },
  callback = function()
    vim.opt_local.conceallevel = 0
  end,
})

-- Use only HEAD name as minigit_summary_string
vim.api.nvim_create_autocmd('User', {
  group = augroup("format_minigit_summary_string"),
  pattern = 'MiniGitUpdated',
  callback = function(data)
    local maxlen = 32
    local summary = vim.b[data.buf].minigit_summary
    local out = summary.head_name or ''
    if #out > maxlen then
      out = string.sub(out, 0, maxlen - 1) .. "…"
    end
    vim.b[data.buf].minigit_summary_string = out
  end,
})

-- fix .tftpl file support
-- NOTE: only fixes highlighting at the moment
vim.filetype.add({
  extension = {
    ['tftpl'] = 'yaml.terraform',
  },
})
