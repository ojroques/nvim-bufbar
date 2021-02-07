# nvim-bufbar

A simple bufferline for Neovim written in Lua.

_**Note**: this plugin is mainly for my own use. I won't add new features/themes
if I don't need them. Feel free to submit PRs or fork the plugin though._

## Installation

#### With Packer:
```lua
use {'ojroques/nvim-bufbar'}
```

#### With Plug
```vim
Plug 'ojroques/nvim-bufbar'
```

## Usage
In your *init.lua*:
```lua
require('bufbar').setup {}
```

If you're using a *.vimrc* or *init.vim*:
```vim
lua require('bufbar').setup {}
```

## Configuration
You can pass options to the `setup()` function. Here are all available options
with their default settings:
```lua
require('bufbar').setup {
  theme = 'default',       -- the theme in 'lua/bufbar/themes' to use
  counters = true,         -- show buffer counters (listed, modified, terminal)
  show_alternate = false,  -- show alternate buffer
  modifier = ':t',         -- the buffer name modifier
  separator = '|',         -- the buffer separator
  spacer = true,           -- space the buffer list and buffer counters
}
```

## License
[LICENSE](./LICENSE)
