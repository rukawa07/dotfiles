local status, lualine = pcall(require, "lualine")
if (not status) then return end

local function get_simple_vim_mode(vim_mode)
  -- If vim_mode is Visual Line mode, return 'VL'
  if vim_mode == 'V-LINE' then
    return 'VL'
  -- If vim_mode is Visual Block mode, return 'VB'
  elseif vim_mode == 'V-BLOCK' then
    return 'VB'
  -- Otherwise, return the first character of vim_mode
  else
    return vim_mode:sub(1, 1)
  end
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {{ 'mode', fmt = get_simple_vim_mode }},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
