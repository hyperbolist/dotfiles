vim.g.gitblame_enabled = 0
vim.cmd('hi link gitblame SpecialComment')
vim.g.gitblame_message_template = [[<sha> • <author> • <date> • <summary>]]
vim.g.gitblame_date_format = [[%Y-%m-%d (%H:%M)]]
