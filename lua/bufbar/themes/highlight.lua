-- Gets the colors for the given highlight group, and formats them for bufbar.
local function highlight(group)
  local gui  = vim.api.nvim_get_hl_by_name(group, true)
  local term = vim.api.nvim_get_hl_by_name(group, false)
  return {
    guifg   = string.format("#%06x", gui.foreground),
    guibg   = string.format("#%06x", gui.background),
    ctermfg = string.format("%d",    term.foreground),
    ctermbg = string.format("%d",    term.background)
  }
end

-- Follow the tabline highlight groups.
return {
  separator = {
    normal     = highlight('TabLineFill'),
    emphasized = highlight('StatusLine')
  },
  listed = {
    inactive   = highlight('TabLine'),
    active     = highlight('TabLineSel'),
    active_low = highlight('TabLineSel'),
  },
  modified = {
    inactive   = highlight('TabLine'),
    active     = highlight('TabLineSel'),
    active_low = highlight('TabLineSel'),
  },
  terminal = {
    inactive   = highlight('TabLine'),
    active     = highlight('TabLineSel'),
    active_low = highlight('TabLineSel'),
  },
  tabs = {
    inactive   = highlight('TabLine'),
    active     = highlight('TabLineSel'),
  },
}
