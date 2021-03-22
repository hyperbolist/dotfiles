vim.g.dashboard_disable_at_vimenter = true
vim.g.dashboard_preview_command = 'cat'
--vim.g.dashboard_preview_pipeline = 'lolcat'
vim.g.dashboard_preview_file = '~/.config/nvim/lua/nv-dashboard/neovim.logo'
vim.g.dashboard_preview_file_height = 12
vim.g.dashboard_preview_file_width = 80
vim.g.dashboard_default_executive = 'telescope'

vim.g.dashboard_custom_section = {
    a = {description = {' Find File          '}, command = 'Telescope find_files'},
    b = {description = {' Find Text          '}, command = 'Telescope live_grep'},
    c = {description = {' Recently Used Files'}, command = 'Telescope oldfiles'},
    d = {description = {' Load Last Session  '}, command = 'SessionLoad'},
}
    --e = {description = {' Marks              '}, command = 'Telescope marks'},
-- vim.g.dashboard_session_directory = '~/.cache/nvim/session'
-- vim.g.dashboard_custom_footer = {'chrisatmachine.com'}
