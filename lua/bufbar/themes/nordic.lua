 local colors = {
  black = {gui = '#2E3440', cterm = '235', cterm16 = '0'},
  blue = { gui = '#5E81AC', cterm = '110', cterm16 = '14'},
  bluegreen = { gui = '#8FBCBB', cterm = '110', cterm = '16'},
  cyan = {gui = '#88C0D0', cterm = '67', cterm16 = '12'},
  green = {gui = '#A3BE8C', cterm = '109', cterm16 = '4'},
  grey_comment = {gui = "#616E88", cterm = "59", cterm16 = "8"},
  grey_cursor = {gui = "#3B4252", cterm = "59", cterm16 = "8"},
  grey_menu = {gui = "#4C566A", cterm = "59", cterm16 = "8"},
  purple = {gui = '#B48EAD', cterm = '139', cterm16 = '5'},
  red = {gui = '#BF616A', cterm = '131', cterm16 = '1'},
  white = {gui = '#E5E9F0', cterm = '188', cterm16 = '7'},
  yellow = {gui = '#EBCB8B', cterm = '222', cterm16 = '3'},
} 

return {
    separator = {
      normal = {
        guifg = colors.white.gui,
        guibg = colors.grey_menu.gui,
        ctermfg = colors.white.cterm,
        ctermbg = colors.grey_menu.cterm,
      },
      emphasized = {
        guifg = colors.white.gui,
        guibg = colors.grey_menu.gui,
        ctermfg = colors.white.cterm,
        ctermbg = colors.grey_menu.cterm,
      },
    },
    listed = {
      inactive = {
        guifg = colors.white.gui,
        guibg = colors.grey_menu.gui,
        ctermfg = colors.white.cterm,
        ctermbg = colors.grey_menu.cterm,
      },
      active = {
        guifg = colors.black.gui,
        guibg = colors.cyan.gui,
        ctermfg = colors.black.cterm,
        ctermbg = colors.cyan.cterm,
      },
    },
    modified = {
      inactive = {
        guifg = colors.white.gui,
        guibg = colors.grey_menu.gui,
        ctermfg = colors.white.cterm,
        ctermbg = colors.grey_menu.cterm,
      },
      active = {
        guifg = colors.black.gui,
        guibg = colors.cyan.gui,
        ctermfg = colors.white.cterm,
        ctermbg = colors.black.cterm,
      },
    },
    terminal = {
      inactive = {
        guifg = colors.white.gui,
        guibg = colors.grey_menu.gui,
        ctermfg = colors.white.cterm,
        ctermbg = colors.grey_menu.cterm,
      },
      active = {
        guifg = colors.black.gui,
        guibg = colors.green.gui,
        ctermfg = colors.black.cterm,
        ctermbg = colors.green.cterm,
      },
    },
    tabs = {
      inactive = {
        guifg = colors.white.gui,
        guibg = colors.grey_menu.gui,
        ctermfg = colors.white.cterm,
        ctermbg = colors.grey_menu.cterm,
      },
      active = {
        guifg = colors.white.gui,
        guibg = colors.grey_cursor.gui,
        ctermfg = colors.white.cterm,
        ctermbg = colors.grey_cursor.cterm,
      },
    },
  }
  
