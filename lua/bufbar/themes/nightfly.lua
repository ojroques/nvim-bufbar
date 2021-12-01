local palette = {
  bg         = '#092236',
  black      = '#011627',
  blue       = '#82AAFF',
  emerald    = '#21C7A8',
  fg         = '#C3CCDC',
  grey       = '#334E65',
  turquoise  = '#7FDBCA',
}

return {
  separator = {
    default = {guifg = palette.fg, guibg = palette.bg},
  },
  listed = {
    active = {guifg = palette.black, guibg = palette.blue},
    active_low = {guifg = palette.grey, guibg = palette.blue},
    inactive = {guifg = palette.blue, guibg = palette.bg},
  },
  modified = {
    active = {guifg = palette.black, guibg = palette.emerald},
    active_low = {guifg = palette.grey, guibg = palette.emerald},
    inactive = {guifg = palette.emerald, guibg = palette.bg},
  },
  terminal = {
    active = {guifg = palette.black, guibg = palette.turquoise},
    active_low = {guifg = palette.grey, guibg = palette.turquoise},
    inactive = {guifg = palette.turquoise, guibg = palette.bg},
  },
}
