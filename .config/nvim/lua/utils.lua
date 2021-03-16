local function define_augroups(definitions) -- {{{1
    -- Create autocommand groups based on the passed definitions
    --
    -- The key will be the name of the group, and each definition
    -- within the group should have:
    --    1. Trigger
    --    2. Pattern
    --    3. Text
    -- just like how they would normally be defined from Vim itself
    for group_name, definition in pairs(definitions) do
        vim.cmd('augroup ' .. group_name)
        vim.cmd('autocmd!')

        for _, def in pairs(definition) do
            local command = table.concat(vim.tbl_flatten {'autocmd', def}, ' ')
            vim.cmd(command)
        end

        vim.cmd('augroup END')
    end
end

define_augroups(
    {
        _general_settings = {
            {'TextYankPost', '*', 'lua require(\'vim.highlight\').on_yank({higroup = \'IncSearch\', timeout = 200})'},
        },
        -- this causes the nvim start message to disappear, but it's worth it
        _corsorline_focus = {
            {'FocusLost', '*', 'silent lua vim.wo.cursorline=false'},
            {'FocusGained', '*', 'silent lua vim.wo.cursorline=true'},
        },
        _help_nav = {
            {'filetype,BufRead', 'help', ':nnoremap <buffer><cr> <c-]>'},
            {'filetype,BufRead', 'help', ':nnoremap <buffer><bs> <c-T>'},
        },
        _quickfix_to_the_bottom = {
            {'FileType', 'qf', 'wincmd J'},
        }
    }
)
