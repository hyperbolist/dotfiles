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
        right = "",
        left = ""
    },
    diagnostic = {
        error = '  ',
        warn = '  ',
        hint = '  ',
        info = '  ',
    },
    diff = {
        add = '  ',
        icon = ' 柳',
        remove = '  ',
    },
    git = ' ',
    mode = {
        c = ' C ',
        i = ' I ',
        n = ' N ',
        r = ' R ',
        s = ' S ',
        t = ' T ',
        v = ' V '
    },
    bullet = "•"
}
local condition = require('galaxyline.condition')
local gls = gl.section
gl.short_line_list = {'NvimTree', 'vista', 'packer'}

gls.left[1] = {
    ViMode = {
        provider = function()
            -- auto change color according the vim mode
            local mode_color = {
                n = colors.green,
                i = colors.blue,
                v = colors.orange,
                [''] = colors.orange,
                V = colors.orange,
                c = colors.purple,
                no = colors.green,
                s = colors.orange,
                S = colors.orange,
                [''] = colors.orange,
                ic = colors.yellow,
                R = colors.red,
                Rv = colors.red,
                cv = colors.green,
                ce = colors.green,
                r = colors.cyan,
                rm = colors.cyan,
                ['r?'] = colors.cyan,
                ['!'] = colors.green,
                t = colors.green
            }
            local mode_icon = {
                n = icons.mode.n,
                i = icons.mode.i,
                v = icons.mode.v,
                [''] = icons.mode.v,
                V = icons.mode.v,
                c = icons.mode.c,
                no = icons.mode.n,
                s = icons.mode.s,
                S = icons.mode.s,
                [''] = icons.mode.s,
                ic = icons.mode.i,
                R = icons.mode.r,
                Rv = icons.mode.r,
                cv = icons.mode.c,
                ce = icons.mode.c,
                r = icons.mode.r,
                rm = icons.mode.r,
                ['r?'] = icons.mode.r,
                ['!'] = '! ',
                t = icons.mode.t,
            }
            vim.api.nvim_command('hi GalaxyViMode guifg=' .. mode_color[vim.fn.mode()] .. ' gui=reverse')
            --return '▊ '
            return ' ' .. mode_icon[vim.fn.mode()] .. icons.slant.left
        end,
        highlight = {colors.red, colors.bg, 'bold'}
    }
}

gls.left[2] = {
    GitIcon = {
        provider = function()
            return '  '
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
            return vim.fn.expand("%:F")
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
        icon = '  ',
        highlight = {colors.green, colors.bg}
    }
}
gls.left[6] = {
    DiffModified = {
        provider = 'DiffModified',
        condition = condition.hide_in_width,
        icon = ' 柳',
        highlight = {colors.blue, colors.bg}
    }
}
gls.left[7] = {
    DiffRemove = {
        provider = 'DiffRemove',
        condition = condition.hide_in_width,
        icon = '  ',
        highlight = {colors.red, colors.bg}
    }
}

gls.right[1] = {
    DiagnosticError = {
        provider = 'DiagnosticError',
        icon = '  ',
        highlight = {colors.red, colors.bg}
    }
}
gls.right[2] = {
    DiagnosticWarn = {
        provider = 'DiagnosticWarn',
        icon = '  ',
        highlight = {colors.orange, colors.bg}
    }
}

gls.right[3] = {
    DiagnosticHint = {
        provider = 'DiagnosticHint',
        icon = '  ',
        highlight = {colors.blue, colors.bg}
    }
}

gls.right[4] = {
    DiagnosticInfo = {
        provider = 'DiagnosticInfo',
        icon = '  ',
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
