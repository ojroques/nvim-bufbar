-- By Olivier Roques
-- github.com/ojroques

-------------------- VARIABLES -----------------------------
local fn, cmd, vim = vim.fn, vim.cmd, vim
local o = vim.o
local fmt = string.format
local M = {}

-------------------- OPTIONS -------------------------------
M.options = {
  theme = 'default',       -- the theme in 'lua/bufbar/themes' to use
  counters = true,         -- show buffer counters (listed, modified, terminal)
  show_alternate = false,  -- show alternate buffer
  modifier = ':t',         -- the buffer name modifier
  separator = '|',         -- the buffer separator
  spacer = true,           -- space the buffer list and buffer counters
}

-------------------- HELPERS ----------------------------
local function echo(hlgroup, msg)
  cmd(string.format('echohl %s', hlgroup))
  cmd(string.format('echo "[hardline] %s"', msg))
  cmd('echohl None')
end

local function set_hlgroup(text, class, level)
  local hlgroup = fmt('Bufbar_%s_%s', class, level)
  if fn.hlexists(hlgroup) == 0 then
    return text
  end
  return fmt('%%#%s#%s%%*', hlgroup, text)
end

-------------------- BUFFERLINE ------------------------
local function get_buffers()
  local buffers = {}
  local current_bufnr, alternate_bufnr = fn.bufnr(), fn.bufnr('#')
  local last_timestamp, last_buffer
  for _, bufinfo in ipairs(fn.getbufinfo({buflisted = 1})) do
    local buffer = {
      bufnr = bufinfo.bufnr,
      current = bufinfo.bufnr == current_bufnr,
      alternate = bufinfo.bufnr == alternate_bufnr,
      modifiable = fn.getbufvar(bufinfo.bufnr, '&modifiable') == 1,
      modified = fn.getbufvar(bufinfo.bufnr, '&modified') == 1,
      readonly = fn.getbufvar(bufinfo.bufnr, '&readonly') == 1,
      terminal = fn.getbufvar(bufinfo.bufnr, '&buftype') == 'terminal',
    }
    if not last_timestamp or bufinfo.lastused > last_timestamp then
      last_timestamp, last_buffer = bufinfo.lastused, buffer
    end
    table.insert(buffers, buffer)
  end
  if fn.buflisted(current_bufnr) == 0 then
    last_buffer.current = true
  end
  return buffers
end

local function get_counters()
  local counters = {listed = 0, modified = 0, terminal = 0}
  for _, bufinfo in ipairs(fn.getbufinfo({buflisted = 1})) do
    counters.listed = counters.listed + 1
    if fn.getbufvar(bufinfo.bufnr, '&modified') == 1 then
      counters.modified = counters.modified + 1
    end
    if fn.getbufvar(bufinfo.bufnr, '&buftype') == 'terminal' then
      counters.terminal = counters.terminal + 1
    end
  end
  return counters
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
  local name
  if buffer.current then
    local modifier = M.options.modifier or ':t'
    local bufname = fn.fnamemodify(fn.bufname(buffer.bufnr), modifier)
    local flags = get_flags(buffer)
    if flags == '' then
      name = fmt('%d: %s', buffer.bufnr, bufname)
    else
      name = fmt('%d: %s %s', buffer.bufnr, bufname, flags)
    end
  elseif M.options.show_alternate and buffer.alternate then
    name = fmt('%d (#)', buffer.bufnr)
  else
    name = fmt('%d', buffer.bufnr)
  end
  return name
end

function M.build_bufferline()
  local buffers = get_buffers()
  local bufferline, buflist = {}, {}
  local separator, spacer
  for _, buffer in ipairs(buffers) do
    local bufname = fmt(' %s ', get_name(buffer))
    local class, level = 'listed', 'low'
    class = buffer.modified and 'modified' or class
    class = buffer.terminal and 'terminal' or class
    level = buffer.current and 'high' or level
    table.insert(buflist, set_hlgroup(bufname, class, level))
  end
  separator = set_hlgroup(M.options.separator, 'separator', 'low')
  table.insert(bufferline, table.concat(buflist, separator))
  if M.options.spacer then
    spacer = set_hlgroup('%=', 'separator', 'low')
    table.insert(bufferline, spacer)
  end
  if M.options.counters then
    local counters = get_counters()
    local bufcounters = {
      set_hlgroup(fmt(' L:%d ', counters.listed), 'listed', 'med'),
      set_hlgroup(fmt(' M:%d ', counters.modified), 'modified', 'med'),
      set_hlgroup(fmt(' T:%d ', counters.terminal), 'terminal', 'med'),
    }
    separator = set_hlgroup(M.options.separator, 'separator', 'med')
    table.insert(bufferline, table.concat(bufcounters, separator))
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
  M.options = vim.tbl_extend('force', M.options, user_options)
  set_theme()
  set_hlgroups()
  set_bufferline()
end

------------------------------------------------------------
return M
