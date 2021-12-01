# nvim-bufbar

My personal bufferline for Neovim.

_**Note**: I won't add features/themes I don't use. Feel free to fork the plugin though._

## Usage
In your *init.lua*:
```lua
require('bufbar').setup {}
```

## Configuration
You can pass options to the `setup()` function. Here are all available options with their default
settings:
```lua
M.options = {
  theme = 'onedark',  -- the theme in 'lua/bufbar/themes' to use
}
```
