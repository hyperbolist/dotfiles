vim.g.startify_custom_header = {
        [[     _  _       __   ___        ]],
        [[    | \| |___ __\ \ / (_)_ __   ]],
        [[    | .` / -_) _ \ V /| | `  \  ]],
        [[    |_|\_\___\___/\_/ |_|_|_|_| ]],
        }

vim.api.nvim_exec(
[[
let g:startify_lists = [ { 'type': 'files', 'header': [' Recent'] }, { 'type': 'dir', 'header': [' Project '. getcwd()] }, { 'type': 'sessions', 'header': [' Sessions'] }, { 'type': 'bookmarks', 'header': [' Bookmarks'] }, ]
]], false)

-- sessions
vim.g.startify_session_dir = '~/.config/nvim/session'
vim.g.startify_session_autoload = 1
vim.g.startify_session_delete_buffers = 1
vim.g.startify_session_persistence = 1

-- makes the 'dir' type track the current project
vim.g.startify_change_to_vcs_root = 1

-- hide empty/quit
vim.g.startify_enable_special = 0

-- invoke explicitly, not on vim start
vim.g.startify_disable_at_vimenter = 1
