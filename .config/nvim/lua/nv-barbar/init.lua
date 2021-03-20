vim.api.nvim_exec([[
let bufferline = get(g:, 'bufferline', {})
let bufferline.icons = v:true
let bufferline.closable = v:false
let bufferline.clickable = v:false
let bufferline.no_name_title = '[no name]'
"let bufferline.icon_separator_active = '▎'
"let bufferline.icon_separator_inactive = '▎'
let bufferline.icon_separator_active = ''
let bufferline.icon_separator_inactive = ''
let bufferline.icon_close_tab = ' '
let bufferline.icon_close_tab_modified = '●'
]], false)
