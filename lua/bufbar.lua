-- nvim-bufbar
-- By Olivier Roques
-- github.com/ojroques

-------------------- VARIABLES -----------------------------
local fn, cmd, vim = vim.fn, vim.cmd, vim
local o = vim.o
local fmt = string.format
local M = {}

-------------------- OPTIONS -------------------------------
M.options = {
  theme = 'default',         -- the theme in 'lua/bufbar/themes' to use
  show_tabs = true,          -- show tabs
  show_bufname = 'current',  -- show full buffer name
  show_flags = true,         -- show buffer flags
  show_alternate = false,    -- show alternate buffer
  modifier = ':t',           -- the name modifier
  term_modifier = ':t',      -- the name modifier for terminal buffers
  separator = '|',           -- the buffer separator
}

-------------------- HELPERS ----------------------------
local function set_hlgroup(text, class, level)
  local hlgroup = fmt('Bufbar_%s_%s', class, level)

  if fn.hlexists(hlgroup) == 0 then
    return text
  end

  return fmt('%%#%s#%s%%*', hlgroup, text)
end

-------------------- BUFFERLINE ------------------------
local function is_excluded(bufnr)
  return fn.buflisted(bufnr) == 0 or fn.getbufvar(bufnr, '&filetype') == 'qf'
end

local function format_name(name, modifier, class, level)
  if name == '' then
    return set_hlgroup('[No Name]', class, level)
  end

  if modifier ~= 'full' or level ~= 'active' then
    return set_hlgroup(fn.fnamemodify(name, modifier), class, level)
  end

  local full = fn.fnamemodify(name, ':p')
  local head, tail = '', ''

  if class == 'terminal' then
    head = 'term://'
    local pattern = fmt('%s%s/', head, fn.fnamemodify(fn.getcwd(), ':p:~'))
    tail = string.sub(full, #pattern + 1, -1)
  else
    head = fn.fnamemodify(fn.getcwd(), ':p')
    tail = fn.fnamemodify(full, fmt(':s?%s??', head))
    head = fn.fnamemodify(head, ':~')
  end

  head = set_hlgroup(head, class, 'active_low')
  tail = set_hlgroup(tail, class, 'active')

  return fmt('%s%s', head, tail)
end

local function get_buffers()
  local buffers = {}
  local current_bufnr, alternate_bufnr = fn.bufnr(), fn.bufnr('#')
  local last_timestamp, last_buffer

  for _, bufinfo in ipairs(fn.getbufinfo({buflisted = 1})) do
    if not is_excluded(bufinfo.bufnr) then
      local buffer = {
        bufnr = bufinfo.bufnr,
        current = bufinfo.bufnr == current_bufnr,
        alternate = bufinfo.bufnr == alternate_bufnr,
        modifiable = fn.getbufvar(bufinfo.bufnr, '&modifiable') == 1,
        modified = fn.getbufvar(bufinfo.bufnr, '&modified') == 1,
        readonly = fn.getbufvar(bufinfo.bufnr, '&readonly') == 1,
        terminal = fn.getbufvar(bufinfo.bufnr, '&buftype') == 'terminal',
        visible = fn.bufwinnr(bufinfo.bufnr) > 0,
      }

      if not last_timestamp or bufinfo.lastused > last_timestamp then
        last_timestamp, last_buffer = bufinfo.lastused, buffer
      end

      table.insert(buffers, buffer)
    end
  end

  if is_excluded(current_bufnr) and last_buffer then
    last_buffer.current = true
  end

  return buffers
end

local function get_tabs()
  local tabs = {}
  local current_tab = fn.tabpagenr()

  for _, tabinfo in ipairs(fn.gettabinfo()) do
    local tab = {
      tabnr = tabinfo.tabnr,
      current = tabinfo.tabnr == current_tab,
    }

    table.insert(tabs, tab)
  end

  return tabs
end

local function get_flags(buffer)
  local flags = {}

  if buffer.readonly then
    table.insert(flags, '[RO]')
  end

  if not buffer.modifiable then
    table.insert(flags, '[-]')
  end

  if buffer.modified then
    table.insert(flags, '[+]')
  end

  return table.concat(flags)
end

local function get_name(buffer)
  local class, level = 'listed', 'inactive'
  local name, expand = '', buffer.current

  class = buffer.modified and 'modified' or class
  class = buffer.terminal and 'terminal' or class
  level = buffer.current and 'active' or level

  expand = expand or M.options.show_bufname == 'all'
  expand = expand or M.options.show_bufname == 'visible' and buffer.visible

  if not expand then
    if M.options.show_alternate and buffer.alternate then
      name = fmt('%d (#)', buffer.bufnr)
    else
      name = fmt('%d', buffer.bufnr)
    end

    return set_hlgroup(name, class, level)
  end

  local modifier = (buffer.terminal and M.options.term_modifier) or M.options.modifier
  local prefix = set_hlgroup(fmt(' %d: ', buffer.bufnr), class, level)
  local suffix = set_hlgroup(' ',  class, level)
  local flags = get_flags(buffer)

  name = format_name(fn.bufname(buffer.bufnr), modifier, class, level)

  if M.options.show_flags and flags ~= '' then
    suffix = set_hlgroup(fmt(' %s ', flags), class, level)
  end

  return fmt('%s%s%s', prefix, name, suffix)
end

function M.build_bufferline()
  local separator = set_hlgroup(M.options.separator, 'separator', 'normal')
  local spacer = set_hlgroup('%<%=', 'separator', 'normal')
  local bufferline = {}
  local buffers, buflist = get_buffers(), {}

  for _, buffer in ipairs(buffers) do
    table.insert(buflist, get_name(buffer))
  end

  table.insert(bufferline, table.concat(buflist, separator))
  table.insert(bufferline, spacer)

  if M.options.show_tabs then
    local tabs, tablist = get_tabs(), {}

    for _, tab in ipairs(tabs) do
      local level = tab.current and 'active' or 'inactive'
      local tabname = set_hlgroup(fmt(' %d ', tab.tabnr), 'tabs', level)

      table.insert(tablist, tabname)
    end

    table.insert(bufferline, set_hlgroup(' tabs: ', 'separator', 'emphasized'))
    table.insert(bufferline, table.concat(tablist, separator))
  end

  return table.concat(bufferline)
end

-------------------- SETUP -----------------------------
local function set_theme()
  if type(M.options.theme) ~= 'string' then
    return
  end

  local theme = fmt('bufbar.themes.%s', M.options.theme)
  M.options.theme = require(theme)
end

local function set_hlgroups()
  for class, levels in pairs(M.options.theme) do
    for level, args in pairs(levels) do
      local hlgroup, arg = fmt('Bufbar_%s_%s', class, level), {}

      for k, v in pairs(args) do
        table.insert(arg, fmt('%s=%s', k, v))
      end

      arg = table.concat(arg, ' ')
      cmd(fmt('autocmd VimEnter,ColorScheme * hi %s %s', hlgroup, arg))
    end
  end
end

local function set_bufferline()
  o.showtabline = 2
  o.tabline = [[%!luaeval('require("bufbar").build_bufferline()')]]
end

function M.setup(user_options)
  if user_options then
    M.options = vim.tbl_extend('force', M.options, user_options)
  end

  set_theme()
  set_hlgroups()
  set_bufferline()
end

------------------------------------------------------------
return M
