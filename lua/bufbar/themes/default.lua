local colors = {
  black = {gui = '#181A1F'},
  blue = {gui = '#61AFEF'},
  cyan = { gui = '#56B6C2'},
  green = {gui = '#98C379'},
  grey = {gui = "#5C6370"},
  grey_light = {gui = "#31353F"},
  purple = {gui = '#C678DD'},
  red = {gui = '#E86671'},
  white = {gui = '#ABB2BF'},
  yellow = {gui = '#E5C07B'},
}

return {
  separator = {
    normal = {guifg = colors.grey.gui, guibg = colors.grey_light.gui},
    emphasized = {guifg = colors.grey.gui, guibg = colors.grey_light.gui},
  },
  listed = {
    inactive = {guifg = colors.green.gui, guibg = colors.grey_light.gui},
    active = {guifg = colors.black.gui, guibg = colors.green.gui},
  },
  modified = {
    inactive = {guifg = colors.blue.gui, guibg = colors.grey_light.gui},
    active = {guifg = colors.black.gui, guibg = colors.blue.gui},
  },
  terminal = {
    inactive = {guifg = colors.red.gui, guibg = colors.grey_light.gui},
    active = {guifg = colors.black.gui, guibg = colors.red.gui},
  },
  tabs = {
    inactive = {guifg = colors.white.gui, guibg = colors.grey_light.gui},
    active = {guifg = colors.black.gui, guibg = colors.white.gui},
  },
}
