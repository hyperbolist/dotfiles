vim.o.showtabline = 2
vim.o.termguicolors = true
require'bufferline'.setup {
  options = {
    view = "default",
    numbers = "none",
    number_style = "",
    mappings = false,
    buffer_close_icon= '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is deduplicated
    tab_size = 18,
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, _)
      return "("..count..")"
    end,
    show_buffer_close_icons = false,
    show_close_icon = false,
    show_tab_indicators = true,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    separator_style = "thin", --"slant" | "thick" | "thin" | { 'any', 'any' },
    enforce_regular_tabs = false,
    always_show_bufferline = true,
    sort_by = ''
  },
  highlights = {
    background = {
      guifg = comment_fg,
      guibg = "#282c34"
    },
    fill = {
      guifg = comment_fg,
      guibg = "#282c34"
    },
    buffer_selected = {
      guifg = normal_fg,
      guibg = "#3A3E44",
      gui = "bold"
    },
    separator_visible = {
      guifg = "#282c34",
      guibg = "#282c34"
    },
    separator_selected = {
      guifg = "#282c34",
      guibg = "#282c34"
    },
    separator = {
      guifg = "#282c34",
      guibg = "#282c34"
    },
    indicator_selected = {
      guifg = "#282c34",
      guibg = "#282c34"
    },
    modified_selected = {
      guifg = string_fg,
      guibg = "#3A3E44"
    },
    warning = {
      guifg = '<color-value-here>',
      gui = "underline",
      guisp = warning_fg,
      guibg = '<color-value-here>'
    },
    warning_visible = {
      guifg = '<color-value-here>',
      guibg = '<color-value-here>',
      gui = "underline",
      guisp = warning_fg
    },
    warning_selected = {
      guifg = warning_fg,
      guibg = '<color-value-here>',
      gui = "bold,italic,underline",
      guisp = warning_fg
    },
    error = {
      guifg = '<color-value-here>',
      guibg = '<color-value-here>',
      gui = "underline",
      guisp = '<color-value-here>'
    },
    error_visible = {
      guifg = '<color-value-here>',
      guibg = '<color-value-here>',
      gui = "underline",
      guisp = '<color-value-here>'
    },
    error_selected = {
      guifg = '<color-value-here>',
      guibg = '<color-value-here>',
      gui = "bold,italic,underline",
      guisp = '<color-value-here>'
    },
  }
}
