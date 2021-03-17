vim.o.hidden=true                -- Required to keep multiple buffers open
vim.wo.wrap=true                 -- Wrap long lines
vim.o.wrapmargin=8               -- Wrap lines when coming within n characters from side
vim.o.linebreak=true             -- Set soft wrapping
vim.o.showbreak="…"              -- Show ellipsis at breaking
vim.o.pumheight=10               -- Makes popup menu smaller
vim.o.fileencoding="utf-8"       -- The encoding written to file
vim.o.cmdheight=1                -- Don't need more space for displaying messages
vim.o.splitbelow=true            -- Horizontal splits will automatically be below
vim.o.splitright=true            -- Vertical splits will automatically be to the right
vim.o.t_Co="256"                 -- Support 256 colors
vim.o.conceallevel=0             -- So that I can see `` in markdown files
vim.o.smartindent=true           -- Makes indenting smart
vim.o.laststatus=0               -- Never display the status line (unless we're using airline that is)
vim.wo.number=false              -- Don't show Line numbers
vim.wo.cursorline=true           -- Enable highlighting of the current line
vim.o.showtabline=0              -- Never show tab line (outside of airline, that is)
vim.o.backup=false               -- This is recommended by coc
vim.o.writebackup=false          -- This is recommended by coc
vim.o.updatetime=250             -- Faster completion
vim.o.timeoutlen=250             -- By default timeoutlen is 1000 ms
vim.o.clipboard="unnamedplus"    -- Copy paste between vim and everything else
vim.o.shortmess="atTFc"          -- shorten/suppress the messages shown in the command area
vim.o.ignorecase=true            -- Case insensitive searching
vim.o.smartcase=true             -- Case-sensitive if expresson contains a capital letter
vim.o.scrolloff=7                -- Lines of text around cursor
vim.wo.signcolumn="yes"          -- For git status, etc
vim.o.magic=true                 -- Set magic on, for regex
vim.o.showmatch=true             -- Show matching braces
vim.o.mat=2                      -- How many tenths of a second to blink matches
vim.o.shell="bash"               -- Let vim use bash for maximum compatibility, fish breaks noninteractive flows
vim.o.inccommand="split"         -- Show live previews of substitutions

-- by default, 2 spaces instead of tabs
-- but tpope/vim-sleuth will take care of us when we're in a project that uses actual tabs
vim.o.tabstop=2                  -- Show 2 spaces for a tab
vim.o.softtabstop=2              -- Show 2 spaces for a tab
vim.o.shiftwidth=2               -- Change the number of space characters inserted for indentation
vim.o.expandtab=true             -- Converts tabs to spaces

-- Treat dash separated words as a word text object
vim.o.iskeyword = vim.o.iskeyword .. ",-"
-- Stop newline continution of comments
vim.o.formatoptions = string.gsub(vim.o.formatoptions, "[cro]", "")
-- ignore junk
vim.o.wildignore = '.DS_Store,.git'
vim.o.wildignore = vim.o.wildignore .. ",*.a,*.o"
vim.o.wildignore = vim.o.wildignore .. ",*~,*.swp,*.tmp"
vim.o.wildignore = vim.o.wildignore .. ",*.bmp,*.gif,*.ico,*.jpg,*.png"
