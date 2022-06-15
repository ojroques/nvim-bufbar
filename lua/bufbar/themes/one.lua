local colors = {
  black = {gui = '#282C34', cterm = '235', cterm16 = '0'},
  blue = {gui = '#61AFEF', cterm = '39', cterm16 = '4'},
  cyan = { gui = '#56B6C2', cterm = '38', cterm16 = '6'},
  green = {gui = '#98C379', cterm = '114', cterm16 = '2'},
  grey_comment = {gui = "#5C6370", cterm = "59", cterm16 = "15"},
  grey_cursor = {gui = "#2C323C", cterm = "236", cterm16 = "8"},
  grey_menu = {gui = "#3E4452", cterm = "237", cterm16 = "8"},
  purple = {gui = '#C678DD', cterm = '170', cterm16 = '5'},
  red = {gui = '#E06C75', cterm = '204', cterm16 = '1'},
  white = {gui = '#ABB2BF', cterm = '145', cterm16 = '7'},
  yellow = {gui = '#E5C07B', cterm = '180', cterm16 = '3'},
}

return {
  separator = {
    normal = {
      guifg = colors.grey_comment.gui,
      guibg = colors.grey_cursor.gui,
      ctermfg = colors.grey_comment.cterm,
      ctermbg = colors.grey_cursor.cterm,
    },
    emphasized = {
      guifg = colors.grey_menu.gui,
      guibg = colors.grey_cursor.gui,
      ctermfg = colors.grey_menu.cterm,
      ctermbg = colors.grey_cursor.cterm,
    },
  },
  listed = {
    inactive = {
      guifg = colors.green.gui,
      guibg = colors.grey_cursor.gui,
      ctermfg = colors.green.cterm,
      ctermbg = colors.grey_cursor.cterm,
    },
    active = {
      guifg = colors.black.gui,
      guibg = colors.green.gui,
      ctermfg = colors.black.cterm,
      ctermbg = colors.green.cterm,
    },
    active_low = {
      guifg = colors.grey_menu.gui,
      guibg = colors.green.gui,
      ctermfg = colors.grey_menu.cterm,
      ctermbg = colors.green.cterm,
    },
  },
  modified = {
    inactive = {
      guifg = colors.blue.gui,
      guibg = colors.grey_cursor.gui,
      ctermfg = colors.blue.cterm,
      ctermbg = colors.grey_cursor.cterm,
    },
    active = {
      guifg = colors.black.gui,
      guibg = colors.blue.gui,
      ctermfg = colors.black.cterm,
      ctermbg = colors.blue.cterm,
    },
    active_low = {
      guifg = colors.grey_menu.gui,
      guibg = colors.blue.gui,
      ctermfg = colors.grey_menu.cterm,
      ctermbg = colors.blue.cterm,
    },
  },
  terminal = {
    inactive = {
      guifg = colors.red.gui,
      guibg = colors.grey_cursor.gui,
      ctermfg = colors.red.cterm,
      ctermbg = colors.grey_cursor.cterm,
    },
    active = {
      guifg = colors.black.gui,
      guibg = colors.red.gui,
      ctermfg = colors.black.cterm,
      ctermbg = colors.red.cterm,
    },
    active_low = {
      guifg = colors.grey_menu.gui,
      guibg = colors.red.gui,
      ctermfg = colors.grey_menu.cterm,
      ctermbg = colors.red.cterm,
    },
  },
  tabs = {
    inactive = {
      guifg = colors.white.gui,
      guibg = colors.grey_cursor.gui,
      ctermfg = colors.white.cterm,
      ctermbg = colors.grey_cursor.cterm,
    },
    active = {
      guifg = colors.white.gui,
      guibg = colors.grey_comment.gui,
      ctermfg = colors.white.cterm,
      ctermbg = colors.grey_comment.cterm,
    },
  },
}
