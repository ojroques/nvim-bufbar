local palette = {
  bg    = '#31353F',
  black = '#181A1F',
  blue  = '#61AFEF',
  fg    = '#ABB2BF',
  green = '#98C379',
  grey  = '#5C6370',
  red   = '#E86671',
}

return {
  separator = {
    default = {guifg = palette.fg, guibg = palette.bg},
  },
  listed = {
    active = {guifg = palette.black, guibg = palette.green},
    active_low = {guifg = palette.grey, guibg = palette.green},
    inactive = {guifg = palette.green, guibg = palette.bg},
  },
  modified = {
    active = {guifg = palette.black, guibg = palette.blue},
    active_low = {guifg = palette.grey, guibg = palette.blue},
    inactive = {guifg = palette.blue, guibg = palette.bg},
  },
  terminal = {
    active = {guifg = palette.black, guibg = palette.red},
    active_low = {guifg = palette.grey, guibg = palette.red},
    inactive = {guifg = palette.red, guibg = palette.bg},
  },
}
