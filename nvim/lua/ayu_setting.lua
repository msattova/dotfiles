local opt = vim.opt
local ayu = require('ayu')

opt.termguicolors = true

ayu.colorscheme()
ayu.setup({
  mirage = false,
  overrides = {},
})

require('lualine').setup({
  options = {
    theme = 'ayu',
  },
})
