vim.o.laststatus = 2
vim.o.showmode = false

local gl = require('galaxyline')
local colors = {
    bg = '#2e2e2e',
    yellow = '#f0c674',
    cyan = '#8abeb7',
    green = '#b5bd68',
    orange = '#de935f',
    purple = '#b294bb',
    magenta = '#D16D9E',
    grey = '#969896',
    blue = '#81a2be',
    red = '#cc6666',
    bright_grey = '#c8c8c8'
}
local icons = {
    slant = {
        right = '',
        left = ''
    },
    diagnostic = {
        error = '  ',
        warn = '  ',
        hint = '  ',
        info = '  ',
    },
    diff = {
        add = '  ',
        modified = ' 柳',
        remove = '  ',
    },
    git = '',
    mode = {
        c = ' 🄲  ',
        i = ' 🄸  ',
        n = ' 🄽  ',
        r = ' 🅁  ',
        s = ' 🅂  ',
        t = ' 🅃  ',
        v = ' 🅅  '
    },
    bullet = '•',
    bar = '▊'
}
local condition = require('galaxyline.condition')
local gls = gl.section
gl.short_line_list = {'NvimTree', 'vista', 'packer'}

gls.left[1] = {
    ViMode = {
        provider = function()
            -- auto change color according the vim mode
            local mode_color = {
                R = colors.red,
                Rv = colors.red,
                S = colors.yellow,
                V = colors.yellow,
                [''] = colors.yellow,
                [''] = colors.yellow,
                ['!'] = colors.green,
                ['r?'] = colors.cyan,
                c = colors.purple,
                ce = colors.purple,
                cv = colors.purple,
                i = colors.blue,
                ic = colors.blue,
                n = colors.green,
                no = colors.green,
                r = colors.cyan,
                rm = colors.cyan,
                s = colors.yellow,
                t = colors.green,
                v = colors.yellow,
            }
            local mode_icon = {
                R = icons.mode.r,
                Rv = icons.mode.r,
                S = icons.mode.s,
                V = icons.mode.v,
                [''] = icons.mode.s,
                [''] = icons.mode.v,
                ['!'] = '! ',
                ['r?'] = icons.mode.r,
                c = icons.mode.c,
                ce = icons.mode.c,
                cv = icons.mode.c,
                i = icons.mode.i,
                ic = icons.mode.i,
                n = icons.mode.n,
                no = icons.mode.n,
                r = icons.mode.r,
                rm = icons.mode.r,
                s = icons.mode.s,
                t = icons.mode.t,
                v = icons.mode.v,
            }
            vim.api.nvim_command('hi GalaxyViMode guifg=' .. mode_color[vim.fn.mode()])
            --vim.api.nvim_command('hi GalaxyViMode guifg=' .. mode_color[vim.fn.mode()] .. ' gui=reverse')
            return '▊ '
            --return ' ' .. mode_icon[vim.fn.mode()] .. icons.bar
        end,
        highlight = {colors.red, colors.bg, 'bold'},
        -- separator = ' ',
        -- separator_highlight = {'NONE', colors.bg},
    }
}

gls.left[2] = {
    GitIcon = {
        provider = function()
            return icons.git
        end,
        condition = condition.check_git_workspace,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.purple, colors.bg, 'bold'}
    }
}

gls.left[3] = {
    GitBranch = {
        provider = 'GitBranch',
        condition = condition.check_git_workspace,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.purple, colors.bg, 'bold'}
    }
}
gls.left[4] = {
    FileName = {
        -- provider = 'FileName',
        provider = function()
            --return vim.fn.expand("%:F")
            return vim.fn.expand("%")
        end,
        condition = condition.buffer_not_empty,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.bright_grey, colors.bg, 'bold'}
    }
}
gls.left[5] = {

    DiffAdd = {
        provider = 'DiffAdd',
        condition = condition.hide_in_width,
        icon = icons.diff.add,
        highlight = {colors.green, colors.bg}
    }
}
gls.left[6] = {
    DiffModified = {
        provider = 'DiffModified',
        condition = condition.hide_in_width,
        icon = icons.diff.modified,
        highlight = {colors.blue, colors.bg}
    }
}
gls.left[7] = {
    DiffRemove = {
        provider = 'DiffRemove',
        condition = condition.hide_in_width,
        icon = icons.diff.remove,
        highlight = {colors.red, colors.bg}
    }
}

gls.right[1] = {
    DiagnosticError = {
        provider = 'DiagnosticError',
        icon = icons.diagnostic.error,
        highlight = {colors.red, colors.bg}
    }
}
gls.right[2] = {
    DiagnosticWarn = {
        provider = 'DiagnosticWarn',
        icon = icons.diagnostic.warn,
        highlight = {colors.orange, colors.bg}
    }
}

gls.right[3] = {
    DiagnosticHint = {
        provider = 'DiagnosticHint',
        icon = icons.diagnostic.hint,
        highlight = {colors.blue, colors.bg}
    }
}

gls.right[4] = {
    DiagnosticInfo = {
        provider = 'DiagnosticInfo',
        icon = icons.diagnostic.info,
        highlight = {colors.blue, colors.bg}
    }
}

gls.right[5] = {
    ShowLspClient = {
        provider = 'GetLspClient',
        condition = function()
            local tbl = {['dashboard'] = true, [' '] = true}
            if tbl[vim.bo.filetype] then return false end
            return true
        end,
        icon = ' ',
        highlight = {colors.grey, colors.bg, 'bold'}
    }
}

gls.right[6] = {
    LineInfo = {
        provider = 'LineColumn',
        separator = '  ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.grey, colors.bg}
    }
}

gls.right[7] = {
    PerCent = {
        provider = 'LinePercent',
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.grey, colors.bg, 'bold'}
    }
}

gls.short_line_left[1] = {
    BufferType = {
        provider = 'FileTypeName',
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.grey, colors.bg, 'bold'}
    }
}

gls.short_line_left[2] = {
    SFileName = {
        provider = 'SFileName',
        condition = condition.buffer_not_empty,
        highlight = {colors.grey, colors.bg, 'bold'}
    }
}

gls.short_line_right[1] = {
    BufferIcon = {provider = 'BufferIcon', highlight = {colors.grey, colors.bg}}
}
