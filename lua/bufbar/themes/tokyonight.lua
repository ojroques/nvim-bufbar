local palette = {
  bg    = '#222436',
  black = '#1B1D2B',
  blue  = '#82AAFF',
  fg    = '#C8D3F5',
  green = '#C3E88D',
  teal  = '#4FD6BE',
}

return {
  separator = {
    default = {guifg = palette.fg, guibg = palette.bg},
  },
  listed = {
    active = {guifg = palette.black, guibg = palette.blue},
    active_low = {guifg = palette.black, guibg = palette.blue},
    inactive = {guifg = palette.blue, guibg = palette.bg},
  },
  modified = {
    active = {guifg = palette.black, guibg = palette.green},
    active_low = {guifg = palette.black, guibg = palette.green},
    inactive = {guifg = palette.green, guibg = palette.bg},
  },
  terminal = {
    active = {guifg = palette.black, guibg = palette.teal},
    active_low = {guifg = palette.black, guibg = palette.teal},
    inactive = {guifg = palette.teal, guibg = palette.bg},
  },
}
