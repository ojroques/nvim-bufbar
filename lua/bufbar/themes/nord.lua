local colors = {
    black = {gui = '#2E3440', cterm = '235', cterm16 = '0'},
    blue = { gui = '#88C0D0', cterm = '110', cterm16 = '14'},
    cyan = {gui = '#5E81AC', cterm = '67', cterm16 = '12'},
    green = {gui = '#81A1C1', cterm = '109', cterm16 = '4'},
    grey_comment = {gui = "#4C566A", cterm = "59", cterm16 = "8"},
    grey_cursor = {gui = "#434C5E", cterm = "59", cterm16 = "8"},
    grey_menu = {gui = "#3B4252", cterm = "59", cterm16 = "8"},
    purple = {gui = '#B48EAD', cterm = '139', cterm16 = '5'},
    red = {gui = '#BF616A', cterm = '131', cterm16 = '1'},
    white = {gui = '#D8DEE9', cterm = '188', cterm16 = '7'},
    yellow = {gui = '#EBCB8B', cterm = '222', cterm16 = '3'},
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
  },
  tabs = {
    inactive = {
      guifg = colors.white.gui,
      guibg = colors.grey_cursor.gui,
      ctermfg = colors.white.cterm,
      ctermbg = colors.grey_cursor.cterm,
    },
    active = {
      guifg = colors.black.gui,
      guibg = colors.white.gui,
      ctermfg = colors.black.cterm,
      ctermbg = colors.white.cterm,
    },
  },
}
